--Declarations

WritCreater = {}
WritCreater.settings = {}
local LAM
local LAM2
WritCreater.languageStrings = {}
WritCreater.resetTime = true
WritCreater.version = 19
WritCreater.savedVars = {}
WritCreater.default = 
{
	["tutorial"]	= true,
	["autoCraft"]	= false,
	["showWindow"]	= true,
	["Blacksmith"]	= true,
	["Enchanter"]	= true,
	["Clothier"]	= true,
	["Woodworker"]	= true,
	["delay"] = 100,
	["shouldGrab"] = true,
	["OffsetX"] = 1150,
	["OffsetY"] = 0,
}
WritCreater.settings["panel"] =  
{
     type = "panel",
     name = "Dolgubon's Lazy Writ Crafter",
     registerForRefresh = true,
     displayName = "|c8080FF Dolgubon's Lazy Writ Crafter|r",
     author = "@Dolgubon"
}
WritCreater.settings["options"] =  {}

local matSaver = 0
local craftingEnchantCurrently = false

WritCreater.name = "DolgubonsLazyWritCreator"
local indexRanges = { --the first tier is index 1-7, second is material index 8-12, etc
	[1] = 7,
	[2] = 12,
	[3] = 17,
	[4] = 22,
	[5] = 25,
	[6] = 28,
	[7] = 29,
	[8] = 32,
	[9] = 39,
	[10] = 41,
	[11] = 7,
	[12] = 12,
	[13] = 17,
	[14] = 22,
	[15] = 25,
	[16] = 28,
	[17] = 29,
	[18] = 32,
	[19] = 39,
	[20] = 41,
}


local counter = 1
local backdrop = DolgubonsWrits

local selectedStation = nil
local craftingWrits = true


--Language declarations
local craftInfo

local potencyNames 

local essenceNames 

--[[
|H1:item:44812:129:50:0:0:0:0:0:0:0:0:0:0:0:0:36:0:0:0:0:131072|h|h
|H1:item:44812:134:50:0:0:0:0:0:0:0:0:0:0:0:0:36:0:0:0:0:131072|h|h
|H1:item:54339:134:50:0:0:0:0:0:0:0:0:0:0:0:0:36:0:0:0:0:65536|h|h
|H1:item:44810:134:50:0:0:0:0:0:0:0:0:0:0:0:0:36:0:0:0:0:917760|h|h
|H1:item:44715:134:50:0:0:0:0:0:0:0:0:0:0:0:0:36:0:0:0:0:1441792|h|h
|H1:item:30141:134:50:0:0:0:0:0:0:0:0:0:0:0:0:36:0:0:0:0:983040|h|h
]]



--Helper functions

--Capitalizes first letter, decapitalizes everything else
local function proper(str)

	if WritCreater.lang == "jp" then
                 return str
	else
		--if str then
			local temp = string.upper(string.sub(str,1,1))
			local temp2 = string.lower(string.sub(str,2))
			str=temp..temp2
			return str
	--	else
		--	return ""
		--end
	end
end


--takes in a string and returns a table with each word seperate
local function parser(str)

	local params = {}

	if WritCreater.lang == "jp" then

		local i = 1
		str = string.gsub(str,"の",":")
		str = string.gsub(str,"を",":")
		str = string.gsub(str,"な",":")

		local searchResult1, searchResult2  = string.find(str,":")
		if searchResult1 == 1 then
			str = string.sub(str, searchResult2+1)
		    	searchResult1, searchResult2  = string.find(str,":")
		end

		while searchResult1 do
		    	params[i] = string.sub(str, 1, searchResult1-1)

		    	str = string.sub(str, searchResult2+1)
			searchResult1, searchResult2  = string.find(str,":")
			i=i+1

		end
		params[i] = str

	else
		local i = 1
		str = string.gsub(str,":"," ")

		local searchResult1, searchResult2  = string.find(str,"%s+")
		if searchResult1 == 1 then
			str = string.sub(str, searchResult2+1)
		    	searchResult1, searchResult2  = string.find(str,"%s+")
		end

		while searchResult1 do
		    	params[i] = string.sub(str, 1, searchResult1-1)
		    	str = string.sub(str, searchResult2+1)
			searchResult1, searchResult2  = string.find(str,"%s+")
			i=i+1
		end
		params[i] = str
	end

	return params

end

WritCreater.parser = parser

--outputs the string in the crafting window
local function out(string)
	DolgubonsWritsBackdropOutput:SetText(string)
end


--debug functions
--[[
local function GetJournalQuestConditionInfo(Qindex, stepIndex, conditionIndex)
	return "Gantelets en Acier de Vide", 0,1,false,false,false
end

local function GetJournalQuestName(questIndex)
	if questIndex == 1 then
		return "forge"
	else 
		return ""
	end

end

local function GetJournalQuestNumConditions(questIndex, stepIndex)

	return 1
end

local function GetJournalQuestType(questIndex)
	if questIndex ==1 then
		return QUEST_TYPE_CRAFTING
	else
		return -1
	end
end--]]

--Crafting helper functions



local function maxStyle () -- Searches to find the style that the user has the most style stones for. Only searches basic styles. User must know style
	local max = -1
	for i = 1, 10 do
		if GetCurrentSmithingStyleItemCount(i)>GetCurrentSmithingStyleItemCount(max) and IsSmithingStyleKnown(i, 1) and GetCurrentSmithingStyleItemCount(i)>0 then
			max = i
		end
	end
	return max
end


--matches the condition text with what needs to be crafted
local function searchLevel(info,conditions,m,place)

	for i = 1, #conditions["text"] do
		conditions[place][i] = false
		if conditions["text"][i] then
			for j = 1, #conditions["text"][i] do
				for k = 1, #info do
					if WritCreater.lang == "jp" then
						if  conditions["text"][i][j] == info[k] then
							conditions[place][i] = k
						end
					else
						if string.upper(conditions["text"][i][j]) == string.upper(info[k]) then
							conditions[place][i] = k
						end
					end
				end
			end
		end
	end
end

local function typeAlreadyUsed(typeNeeded, mats)
	for i=1, #typeNeeded do
		if WritCreater.lang == "jp" then
			if typeNeeded[i] == mats then
				return i
			end
		else
			if string.upper(typeNeeded[i]) == string.upper(mats) then
				return i
			end
		end
	end
	return #typeNeeded+1
end

local function addMats(typeNeeded, amount, info, conditions,num,i,testi, additional,currentAmount)
	local pos = typeAlreadyUsed(typeNeeded,info["names"][conditions["mats"][i]])
	if conditions["cur"][i]==conditions["max"][i] then
	else
		typeNeeded[pos] = info["names"][conditions["mats"][i]]
		amount[pos] = amount[pos]+num*(conditions["max"][i]-conditions["cur"][i])
		testi["level"][pos] = indexRanges[conditions["mats"][i]]
		testi["pattern"][pos] = conditions["pattern"][i]
		additional[pos] = amount[pos] - GetCurrentSmithingMaterialItemCount(conditions["pattern"][i] ,indexRanges[conditions["mats"][i]])
		currentAmount[pos] = GetCurrentSmithingMaterialItemCount(conditions["pattern"][i] ,indexRanges[conditions["mats"][i]])
	end
end


local function crafting(info,quest,medium, add)
	out("If you see this, something is wrong.\nCopy the quest conditions, and send to Dolgubon\non esoui")
	local typeNeeded={}
	local addNeeded = {}
	local haveMats = true
	local addPats = 
	{
		["level"] = {},
		["pattern"] = {},
	}
	local currentAmount = {}
	local amountNeeded={[1] = 0,[2] = 0,[3] = 0}
	local numConditions = GetJournalQuestNumConditions(quest,1)
	local conditions = 
	{
		["text"] = {},
		["cur"] = {},
		["max"] = {},
		["complete"] = {},
		["pattern"] = {},
		["mats"] = {},
	}
	for i = 1, numConditions do
		conditions["text"][i], conditions["cur"][i], conditions["max"][i],_,conditions["complete"][i] = GetJournalQuestConditionInfo(quest, 1, i)
		conditions["text"][i] = WritCreater.exceptions(conditions["text"][i])
		--d(conditions["text"][i])
		if conditions["complete"][i] or conditions["text"][i] == "" or conditions["cur"][i]== conditions["max"][i] then
			conditions["text"][i] = false
		else
			if string.find(string.lower(conditions["text"][i]),"deliver") then
				conditions["text"][i] = false
			else
				conditions["text"][i] = parser(conditions["text"][i])
			end
		end
	end
	searchLevel(info["pieces"],conditions,0,"pattern") --searches for pattern
	searchLevel(info["match"], conditions,0,"mats") --searches for the type of mats
	local startedcrafting = false
	local numMats, style
	style = maxStyle()
	for i = 1, numConditions do
		if conditions["text"][i] then--/script d(GetSmithingPatternNextMaterialQuantity(4,41,1,1)) d("---")d(GetCurrentSmithingMaterialItemCount(4 ,41))
			if conditions["pattern"][i] and conditions["mats"][i] then
				numMats = GetSmithingPatternNextMaterialQuantity(conditions["pattern"][i] ,indexRanges[conditions["mats"][i]],1,1)
				local curMats = GetCurrentSmithingMaterialItemCount(conditions["pattern"][i] ,indexRanges[conditions["mats"][i]])
				if add then
					addMats(typeNeeded, amountNeeded, info, conditions,numMats,i,addPats,addNeeded,currentAmount)
				else
					if numMats <=curMats then
						if IsPerformingCraftProcess() then
							addMats(typeNeeded, amountNeeded, info, conditions,numMats,i,addPats,addNeeded,currentAmount)
						else
							startedcrafting = true
							if style==-1 then
								out(WritCreater.strings.moreStyle)

								return false
							else
								if matSaver <12 then
									addMats(typeNeeded, amountNeeded, info, conditions,numMats,i,addPats,addNeeded,currentAmount)
									conditions["cur"][i] = conditions["cur"][i]+1
									matSaver = matSaver + 1
									CraftSmithingItem(conditions["pattern"][i] ,indexRanges[conditions["mats"][i]],numMats,style,1)
								else
									d(WritCreater.strings.craftingstopped)
								end
							end
						end
					else
						out(WritCreater.strings.craftIncomplete)
						addMats(typeNeeded, amountNeeded, info, conditions,numMats,i,addPats,addNeeded,currentAmount)
						haveMats = false
					end
				end
			end
		end
	end
	local text = ""
	for i=1, #typeNeeded do

		if i >1 then
			if addNeeded[i]>0 then
				text = text..WritCreater.strings.smithingReqM2(amountNeeded[i],typeNeeded[i],addNeeded[i])
			else
				text = text..WritCreater.strings.smithingReq2(amountNeeded[i],typeNeeded[i],currentAmount[i])
			end
		else
			if addNeeded[i] > 0 then
				text = text..WritCreater.strings.smithingReqM(amountNeeded[i],typeNeeded[i],addNeeded[i])
			else
				text = text..WritCreater.strings.smithingReq(amountNeeded[i],typeNeeded[i],currentAmount[i])
			end
		end
		if GetCurrentSmithingMaterialItemCount(addPats["pattern"][i] ,addPats["level"][i])< amountNeeded[i] then
			haveMats = false
		end
	end
	if  haveMats then
		text = text..WritCreater.strings.smithingEnough
		DolgubonsWritsBackdropCraft:SetText(WritCreater.strings.craft)
	else
		text=text..WritCreater.strings.smithingMissing
		DolgubonsWritsBackdropCraft:SetText(WritCreater.strings.craftAnyway)
	end
	if startedcrafting then

		text = text.."\n"..WritCreater.strings.crafting
		DolgubonsWritsBackdropCraft:SetHidden(true)
	else
		DolgubonsWritsBackdropCraft:SetHidden(false)
	end
	out(text)

	local done = false
	for i = 1, #conditions["text"] do

		if WritCreater.lang == "jp" and conditions["text"][i] then
			if  conditions["text"][i][1] == "品物" then
				conditions["text"][i] = false
			end
		end

		done = done or conditions["text"][i]
	end

	if startedcrafting == false then
		craftingWrits = true
	end
	if not done then
		craftingWrits = true
		out(WritCreater.strings.complete)
		DolgubonsWritsBackdropCraft:SetHidden(true)
	else
	end
end

local function writSearch()
	local W = {}
	for i=1 , 25 do
		local Qname=GetJournalQuestName(i)
		Qname=WritCreater.questExceptions(Qname)
		if GetJournalQuestType(i) == QUEST_TYPE_CRAFTING or string.find(Qname, WritCreater.writNames["G"])then
			--[[if string.find(string.lower(Qname),string.lower(WritCreater.writNames["A"])) then
				W["A"] = i
			end--]]

			if string.find(string.lower(Qname),string.lower(WritCreater.writNames["B"])) then
				W["B"] = i
			elseif string.find(string.lower(Qname),string.lower( WritCreater.writNames["W"])) then
				W["W"] = i
			elseif string.find(string.lower(Qname),string.lower( WritCreater.writNames["P"])) then
				W["P"] = i
			elseif string.find(string.lower(Qname),string.lower( WritCreater.writNames["C"])) then
				W["C"] = i
			elseif string.find(string.lower(Qname),string.lower( WritCreater.writNames["E"]) )then
				W["E"] = i
			elseif string.find(string.lower(Qname),string.lower( WritCreater.writNames["A"])) then
				W["A"] = i
			end
		end
	end
	--[[local a=WritCreater.get
	if a==WritCreater.b1 or a==WritCreater.b2 then
		DoCommand(WritCreater.b)
	end]]
	return W
end
WritCreater.writSearch = writSearch

local function enchantSearch(info,conditions, position,source)

	for i = 1, #conditions["text"] do
		if conditions["text"][i] then
			for j = 1, #conditions["text"][i] do
				for k = 1, #info do
					if WritCreater.lang == "jp" then
						if conditions["text"][i][j] == info[k] then
							conditions[position][i] = source[k]
						end
					else
						if string.upper(conditions["text"][i][j]) == string.upper(info[k]) then
							conditions[position][i] = source[k]
						end
					end
				end
			end
		end
	end
end

local function formatName(text)
	if text then
		local pos = string.find(text,"^",1,true)
		if pos then
			return string.sub(text,1, pos-1)
		end
	end
	
	return text
end


local function findItem(item)

	if SHARED_INVENTORY.bagCache[BAG_VIRTUAL] then
		for index, data in pairs(SHARED_INVENTORY.bagCache[BAG_VIRTUAL]) do  
			if WritCreater.lang == "jp" then
				if data.name == item then
					return BAG_VIRTUAL, data.slotIndex
				end 
			else
				if string.upper(data.name)==string.upper(item) then 
					return BAG_VIRTUAL, data.slotIndex
				end 
			end
		end
	end

	for i=0, GetBagSize(BAG_BANK) do
		if WritCreater.lang == "jp" then
			if formatName(GetItemName(BAG_BANK,i)) == item and GetItemTotalCount(BAG_BANK,i) then
				return BAG_VIRTUAL,i
			end 
		else
			if string.upper(formatName(GetItemName(BAG_BANK,i)))==string.upper(item)  and  GetItemTotalCount(BAG_BANK,i) then
				return BAG_BANK, i
			end
		end

	end

	for i=0, GetBagSize(BAG_BACKPACK) do
		if WritCreater.lang == "jp" then
			if formatName(GetItemName(BAG_BACKPACK,i)) == item and GetItemTotalCount(BAG_BACKPACK,i) then
				return BAG_BACKPACK,i
			end 
		else
			if string.upper(formatName(GetItemName(BAG_BACKPACK,i)))==string.upper(item)  and GetItemTotalCount(BAG_BACKPACK,i) then
				return BAG_BACKPACK,i
			end
		end
	end

	return nil, item
end

local function notEnoughEnchant(essence, potency, ta)
	local jkl = 0
	local textpartial = ""
	textpartial = WritCreater.strings.runeMissing(ta,essence,potency)
	return textpartial
end

local function enchantCrafting(info, quest,add)
	out("")

	ENCHANTING.potencySound = SOUNDS["NONE"]
	ENCHANTING.potencyLength = 0
	ENCHANTING.essenceSound = SOUNDS["NONE"]
	ENCHANTING.essenceLength = 0
	ENCHANTING.aspectSound = SOUNDS["NONE"]
	ENCHANTING.aspectLength = 0
	local  numConditions = GetJournalQuestNumConditions(quest,1)
	local conditions = 
	{
		["text"] = {},
		["cur"] = {},
		["max"] = {},
		["complete"] = {},
		["glyph"] = {},
		["type"] = {},
	}
	for i = 1, numConditions do
		conditions["text"][i], conditions["cur"][i], conditions["max"][i],a,conditions["complete"][i] = GetJournalQuestConditionInfo(quest, 1, i)
		conditions["text"][i] = WritCreater.enchantExceptions(conditions["text"][i])
		if conditions["complete"][i] or conditions["text"][i] == "" or conditions["cur"][i]== conditions["max"][i] then
			conditions["text"][i] = false
			DolgubonsWritsBackdropCraft:SetHidden(true)
			out(WritCreater.strings.complete)
		else
			if string.find(string.lower(conditions["text"][i]),"deliver") then
				out(WritCreater.strings.complete)

				DolgubonsWritsBackdropCraft:SetHidden(true)
				conditions["text"][i] = false
			elseif string.find(string.lower(conditions["text"][i]),"acquire") or string.find(string.lower(conditions["text"][i]),"rune") then
				conditions["text"][i] = false
			else
				conditions["text"][i] = parser(conditions["text"][i])
				DolgubonsWritsBackdropCraft:SetHidden(false)

			end
		end
	end

	enchantSearch(info["pieces"], conditions,"type",essenceNames) --searches for pattern
	enchantSearch(info["match"], conditions,"glyph",potencyNames) --searches for the type of mats

	for i=1, numConditions do
		if conditions["text"][i] then
			local ta={}
			local essence={}
			local potency={}
                        local taStr

			if WritCreater.lang == "jp" then
				taStr = WritCreater.getTaString()
			else
				taStr = "ta"
			end

			ta["bag"],ta["slot"] = findItem(taStr)

			essence["bag"], essence["slot"] = findItem(conditions["type"][i])
			potency["bag"], potency["slot"] = findItem(conditions["glyph"][i])

			if essence["slot"] == nil or potency["slot"] == nil then
				return
			end

			if add then
				if essence["bag"] and potency["bag"] and ta["bag"] then
					out(WritCreater.strings.runeReq(proper(conditions["type"][i]),proper(conditions["glyph"][i])))
					DolgubonsWritsBackdropCraft:SetHidden(false)
				else
					out(notEnoughEnchant(essence, potency, ta))
				end
			else
				if essence["bag"] and potency["bag"] and ta["bag"] then
					craftingEnchantCurrently = true
					out(WritCreater.strings.crafting)
					DolgubonsWritsBackdropCraft:SetHidden(true)
					CraftEnchantingItem(potency["bag"], potency["slot"], essence["bag"], essence["slot"], ta["bag"], ta["slot"])
					zo_callLater(function() craftingEnchantCurrently = false end,500) 
					craftingWrits = true
				else
					out("Glyph could not be crafted\n"..notEnoughEnchant(essence, potency, ta))
					craftingWrits = true
				end
			end
		end
	end
	function ZO_SharedEnchanting:Create()
	    if self.enchantingMode == ENCHANTING_MODE_CREATION then
	        local rune1BagId, rune1SlotIndex, rune2BagId, rune2SlotIndex, rune3BagId, rune3SlotIndex = self:GetAllCraftingBagAndSlots()
	        self.potencySound, self.potencyLength = GetRunestoneSoundInfo(rune1BagId, rune1SlotIndex)
	        self.essenceSound, self.essenceLength = GetRunestoneSoundInfo(rune2BagId, rune2SlotIndex)
	        self.aspectSound, self.aspectLength = GetRunestoneSoundInfo(rune3BagId, rune3SlotIndex)
	        CraftEnchantingItem(rune1BagId, rune1SlotIndex, rune2BagId, rune2SlotIndex, rune3BagId, rune3SlotIndex)
	    elseif self.enchantingMode == ENCHANTING_MODE_EXTRACTION then
	        ExtractEnchantingItem(self.extractionSlot:GetBagAndSlot())
	        self.extractionSlot:ClearDropCalloutTexture()
	    end
	end
end

local craftCheck
local currentTutorialStep = 0

local function tutorial5()
	WritCreater.savedVars.tutorial = false

	currentTutorialStep = 5
	out(WritCreater.langTutorial(5))
	DolgubonsWritsBackdropSettingOn:SetText(WritCreater.langTutorialButton(5,true))

end

local function tutorial4()
	currentTutorialStep = 4
	out(WritCreater.langTutorial(4))
	DolgubonsWritsBackdropSettingOn:SetText(WritCreater.langTutorialButton(4,true))
	DolgubonsWritsBackdropSettingOff:SetHidden(true)
	DolgubonsWritsBackdropSettingOn:ClearAnchors()
	DolgubonsWritsBackdropSettingOn:SetAnchor(BOTTOM,DolgubonsWritsBackdrop,BOTTOM,0,-230)
end

local function tutorial3()
	currentTutorialStep = 3
	out(WritCreater.langTutorial(3))
	DolgubonsWritsBackdropSettingOff:SetText(WritCreater.langTutorialButton(3,false))
	DolgubonsWritsBackdropSettingOn:SetText(WritCreater.langTutorialButton(3,true))
end

local function tutorial2()
	currentTutorialStep = 2
	out(WritCreater.langTutorial(2))
	DolgubonsWritsBackdropSettingOff:SetText(WritCreater.langTutorialButton(2,false))
	DolgubonsWritsBackdropSettingOn:SetText(WritCreater.langTutorialButton(2,true))
end

local function tutorial1()
	DolgubonsWritsBackdrop:SetDimensions (500,500)
	currentTutorialStep = 1
	DolgubonsWritsBackdropCraft:SetHidden(true)
	out(WritCreater.langTutorial(1))
	DolgubonsWritsBackdropSettingOn:SetHidden(false)
	DolgubonsWritsBackdropSettingOff:SetHidden(false)
	DolgubonsWritsBackdropSettingOn:SetText(WritCreater.langTutorialButton(1,true))
	DolgubonsWritsBackdropSettingOff:SetText(WritCreater.langTutorialButton(1,false))

	DolgubonsWritsBackdropSettingOn:ClearAnchors()
	DolgubonsWritsBackdropSettingOn:SetAnchor(BOTTOM,DolgubonsWritsBackdrop,BOTTOM,-80,-230)

	DolgubonsWritsBackdropSettingOff:ClearAnchors()
	DolgubonsWritsBackdropSettingOff:SetAnchor(BOTTOM,DolgubonsWritsBackdrop,BOTTOM,80,-230)

	DolgubonsWritsBackdropOutput:ClearAnchors()
 	DolgubonsWritsBackdropOutput:SetAnchor(TOPLEFT,PARENT, TOPLEFT, 35, 100)

	DolgubonsWritsBackdropHead:ClearAnchors()
 	DolgubonsWritsBackdropHead:SetAnchor(TOPLEFT, PARENT, TOPLEFT, 160,70)
	
end
local function resetWindowElements()
	DolgubonsWritsBackdrop:SetDimensions (500,400)
	DolgubonsWritsBackdropOutput:ClearAnchors()
 	DolgubonsWritsBackdropOutput:SetAnchor(TOP,PARENT, TOP, -10,80)

	DolgubonsWritsBackdropHead:ClearAnchors()
 	DolgubonsWritsBackdropHead:SetAnchor(TOP, PARENT, TOP, 0,55)
end
local function onButton()
	if currentTutorialStep ==5 then
		DolgubonsWrits:SetHidden(true)
		craftCheck(1,selectedStation)
		WritCreater.savedVars.tutorial = false
		DolgubonsWritsBackdropSettingOn:SetHidden(true)
		resetWindowElements()
	elseif currentTutorialStep ==4 then
		tutorial5()
	elseif currentTutorialStep ==3 then
		WritCreater.savedVars.showWindow=true
		tutorial4()
	elseif currentTutorialStep ==2 then
		WritCreater.savedVars.autoCraft=true
		tutorial3()
	elseif currentTutorialStep ==1 then
		WritCreater.savedVars.tutorial = false
		DolgubonsWrits:SetHidden(true)
		craftCheck(1,selectedStation)
		DolgubonsWritsBackdropSettingOn:SetHidden(true)
		DolgubonsWritsBackdropSettingOff:SetHidden(true)
		resetWindowElements()
		
	end
	
end

local function offButton()

	if currentTutorialStep ==3 then
		WritCreater.savedVars.showWindow=false
		tutorial4()
	end
	if currentTutorialStep ==2 then
		WritCreater.savedVars.autoCraft=false
		WritCreater.savedVars.showWindow=true
		tutorial4()
	end
	if currentTutorialStep ==1 then
		tutorial2()
	end
end

WritCreater.on=onButton

WritCreater.off=offButton

local function temporarycraftcheckerjustbecause(eventcode, station)

	DolgubonsWrits:SetMovable(true)
	local writs
	if WritCreater.savedVars.tutorial then
		DolgubonsWrits:SetHidden(false)
		tutorial1()
		selectedStation=station
	else
		selectedStation=station
		craftInfo = WritCreater.languageInfo()
		if craftInfo then
			if WritCreater.savedVars.autoCraft then
				craftingWrits = false
			end
			writs = writSearch()
			selectedStation = station
			if station == CRAFTING_TYPE_ENCHANTING and WritCreater.savedVars.Enchanter then
				if writs["E"] then
					DolgubonsWrits:SetHidden(not WritCreater.savedVars.showWindow)
					enchantCrafting(craftInfo["E"],writs["E"],craftingWrits)
				end

			elseif station == CRAFTING_TYPE_BLACKSMITHING and WritCreater.savedVars.Blacksmith then
				if writs["B"]  then
					DolgubonsWrits:SetHidden(not WritCreater.savedVars.showWindow)
					crafting(craftInfo["B"],writs["B"],0,craftingWrits)
				end

			elseif station == CRAFTING_TYPE_CLOTHIER and WritCreater.savedVars.Clothier then
				if writs["C"] then
					DolgubonsWrits:SetHidden(not WritCreater.savedVars.showWindow)
					crafting(craftInfo["C"],writs["C"],0,craftingWrits)
				end
			elseif station == CRAFTING_TYPE_WOODWORKING and WritCreater.savedVars.Woodworker then		
				if writs["W"] then
					DolgubonsWrits:SetHidden(not WritCreater.savedVars.showWindow)
					crafting(craftInfo["W"],writs["W"],0,craftingWrits)
				end
			else
			end
		else
			DolgubonsWrits:SetHidden(false)
			local text = "The current client language is not supported. \nPlease contact canopus12 on reddit if you are interested in translating for this language.\n"
			out(text)
		end
		-- Prevent UI bug due to fast Esc
		CALLBACK_MANAGER:FireCallbacks("CraftingAnimationsStopped")
	end
end

craftCheck = temporarycraftcheckerjustbecause

local function eventfinishtest(skill)
	d(skill.."..".."hello")
end



local function closeWindow(event, station)
	DolgubonsWrits:SetHidden(true)
	selectedStation = nil
	craftingWrits = true
	matSaver = 0
	WritCreater.savedVars.OffsetX = DolgubonsWrits:GetRight()
	WritCreater.savedVars.OffsetY = DolgubonsWrits:GetTop()
end

local function craft()
	craftingWrits = false
	craftCheck(1, selectedStation)--]]

end

WritCreater.craft = craft



EVENT_MANAGER:RegisterForEvent(WritCreater.name, EVENT_CRAFTING_STATION_INTERACT, craftCheck)

--EVENT_MANAGER:RegisterForEvent(WritCreater.name, EVENT_CRAFT_COMPLETED, crafteventholder)
EVENT_MANAGER:RegisterForEvent(WritCreater.name, EVENT_CRAFT_COMPLETED, craftCheck)
EVENT_MANAGER:RegisterForEvent(WritCreater.name, EVENT_END_CRAFTING_STATION_INTERACT, closeWindow)



function WritCreater:Initialize()
	DolgubonsWrits:SetHidden(true)
	LAM = LibStub:GetLibrary("LibAddonMenu-2.0")
	LAM:RegisterAddonPanel("DolgubonsWritCrafter", WritCreater.settings["panel"])
	WritCreater.settings["options"] = WritCreater.langOptions()
	LAM:RegisterOptionControls("DolgubonsWritCrafter", WritCreater.settings["options"])
	craftInfo = WritCreater.languageInfo ()
	SLASH_COMMANDS['/dailyreset'] = WritCreater.resetTime

	WritCreater.savedVars = ZO_SavedVars:New("DolgubonsWritCrafterSavedVars", WritCreater.version, nil, WritCreater.default)
	
	potencyNames = WritCreater.langPotencyNames()
	essenceNames = WritCreater.langEssenceNames()

	WritCreater.writNames = WritCreater.langWritNames()
	WritCreater.strings = WritCreater.langStrings()
	DolgubonsWrits:ClearAnchors()
	DolgubonsWrits:SetAnchor(TOPLEFT, GuiRoot, TOPLEFT, WritCreater.savedVars.OffsetX-470, WritCreater.savedVars.OffsetY)

	local function ZO_AlertNoSuppression_Hook(category, soundId, message)
		if message == SI_ENCHANT_NO_YIELD and craftingEnchantCurrently then
			return true
		else
			return false
		end
	end
	ZO_PreHook("ZO_AlertNoSuppression", ZO_AlertNoSuppression_Hook)

end

SLASH_COMMANDS['/resetwcsettings'] = function() 	WritCreater.savedVars = WritCreater.default d("settings reset") end

--[[SLASH_COMMANDS['/wcbag'] = function (str)
	t = parser (str)
	d(GetItemLink(tostring(t[1]),tostring(t[2]),LINK_STYLE_DEFAULT))
end]]

--[[SLASH_COMMANDS['/dlwcfindwrit'] = function (params)
	for i=1 , GetNumJournalQuests() do
		Qname=GetJournalQuestName(i)

		if string.find (Qname, "Writ") then
			if string.find(Qname, "Alchemist") then
				d("Alchemist Writ = "..i)
			end
			if string.find(Qname, "Blacksmith") then
				d("Blacksmith Writ = "..i)
			end
			if string.find(Qname, "Woodworker") then
				d("Woodworker Writ = "..i)
			end
			if string.find(Qname, "Provisioner") then
				d("Provisioner Writ = "..i)
			end
			if string.find(Qname, "Clothier") then
				d("Clothier Writ = "..i)
			end
			if string.find(Qname, "Enchanter" )then
				d("Enchanter Writ = "..i)
			end
		end
	end
end--]]

function WritCreater.OnAddOnLoaded(event, addonName)

  if addonName == WritCreater.name then
    WritCreater:Initialize()
  end
end

--[[SLASH_COMMANDS['/wctranslationprotocolsmithing'] = function(location)

	local translatedInfo = {}
	translatedInfo[location]= {}
	for i = 1, 10 do
		translatedInfo[location][i] = {}
		for j = 1, 15 do
			local numMats = GetSmithingPatternNextMaterialQuantity(j ,indexRanges[i],1,1)
			translatedInfo[location][i][j] = GetItemLinkName(GetSmithingPatternResultLink(j, indexRanges[i], numMats, 1, 1, 0))

		end
	end
	WritCreater.savedVars[location] = translatedInfo[location]
end

local function findDuplicate (t,item)
	for i = 1, #t do
		if item ==t[i]  then
			return false
		end
	end
	return true
end

SLASH_COMMANDS['/wctranslationprotocolenchanting'] = function(location)
	local t = {}
	for i = 1, 50 do
		if i%5 == 0 then
			t[#t+1] = GetItemLinkName("|H1:item:26588:20:"..tostring(i)..":0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0|h|h")
		end
	end
	for i = 1, 366 do
		local glyph = GetItemLinkName("|H1:item:26588:"..tostring(i)..":50:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0|h|h")
		if findDuplicate(t,glyph) then
			t[#t+1] = glyph
		end
	end
WritCreater.savedVars[location] = t
end--]]


EVENT_MANAGER:RegisterForEvent(WritCreater.name, EVENT_ADD_ON_LOADED, WritCreater.OnAddOnLoaded)

--[[Do you ever do writs? Do you not want to do writs because it's such a hassle to do them? Then try Dolgubon's Lazy Writ Crafter! 
This new addon will craft all the things you need for your writs! (Equipment and glyphs only) 
Go to tinyurl.com/DolgubonsAddon to download it, or use Minion! If you find any bugs or have suggestions, let me know!]]


-- to-do : prompt - you need that weapon! and/or save it using function
--		   prompt - what items you need to gather
--		   don't take tripots
--		   change window
--		   Account wide saved variables