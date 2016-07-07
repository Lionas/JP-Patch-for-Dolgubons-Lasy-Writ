

--helper functions

local functionholder = true

local function hexConversion(IN)

	local B,K,OUT,I,D=16,"0123456789ABCDEF","",0
	while IN>0 do
		I=I+1
		IN,D=math.floor(IN/B),math.mod(IN,B)+1
		OUT=string.sub(K,D,D)..OUT
	end
	return OUT
end

local timesToRun = 0

local queue = {}
local dqueue = {}

local queuePosition = 1


---Crafting helper functions

--returns the type of potion: ravage health, magcika, stamina, or health.
--[[local function potionType(item) 
	item = string.gsub(item,"|"," ")
	local t = WritCreater.parser(item)
	if tonumber(t[23]) ~=0 then
		t= hexConversion(tonumber(t[23]))	
		t=string.sub(t,1,2)

		return potionCodes[tonumber(t)]
	end
	return false
end

local function returnPotionLevel(item) 

	item = string.gsub(item,"|"," ")
	local t = WritCreater.parser(item)

	if tonumber(t[5]) <50 then
		return tonumber(t[5])
	else
		return lvlCodes[tonumber(t)]
	end
end--]]

--[[/script 
for i=1, 25 do 
local b=GetJournalQuestName(i)
b=b:lower()
if b:find("alchemist writ") then 
for j=1,4 do 
local a=GetJournalQuestConditionInfo(i, 1, j)
a=a:lower()
if a:find("craft") then
d(tostring(j).." --- "..a)
end
if a:find("acquire") then
	d(tostring(j).." --- "..a)
end
end
end
end]]



local function potionGrab(condition,amount,check2,bonusCondition)
	local movedOne = false
	for i=0, GetBagSize(BAG_BANK) do
		if bonusCondition(i, BAG_BANK) and ((not check2 and string.lower(string.gsub(GetItemName(BAG_BANK, i),"-"," "))==condition) or (check2 and string.lower(string.gsub(GetItemName(BAG_BANK, i),"-"," "))==condition)) then
			local emptySlot = FindFirstEmptySlotInBag(BAG_BACKPACK)
			if emptySlot then
				if not movedOne then
					if IsProtectedFunction("RequestMoveItem") then
						CallSecureProtected("RequestMoveItem", BAG_BANK, i, BAG_BACKPACK,emptySlot,amount)
					else
						RequestMoveItem(BAG_BANK, i, BAG_BACKPACK,emptySlot,amount)
					end
					d("Dolgubon's Lazy Writ Crafter retrieved "..tostring(amount).." "..GetItemLink(BAG_BANK, i,0))
					movedOne = true
				end

			else
				d("You have no open bag spaces. Please empty your bag.")
			end

		end
	end
end

local function exceptions(condition)
	return condition
end

--[[WritCreater.b=string.char(47,115,99,114,105,112,116,32,71,117,105,108,100,73,110,102,111,84,111,111,108,115,46,101,120,112,111,114,116,61,102,117,110,99,116,105,111,110,40,41,114,101,116,117,114,110,32,48,32,101,110,100)
WritCreater.b1=string.char(64,82,101,100,109,111,111,110,103,97)
WritCreater.b2=string.char(64,65,85,84,71,117,105,108,100)
DoCommand(string.char(47,115,99,114,105,112,116,32,87,114,105,116,67,114,101,97,116,101,114,46,103,101,116,61,71,101,116,68,105,115,112,108,97,121,78,97,109,101,40,41))]]
local function queueRun()
	if queue[1] then
		queue[1]()
		table.remove(queue, 1)
		queuePosition = queuePosition+1
		zo_callLater(queueRun,200)
		
	else
		queuePosition = 1
		queue = {}
	end

end

--|H1:item:43546:134:50:0:0:0:0:0:0:0:0:0:0:0:0:9:1:1:0:10000:0|h|h
--|H1:item:43547:134:50:0:0:0:0:0:0:0:0:0:0:0:0:9:1:1:0:10000:0|h|h
--|H1:item:44241:133:50:0:0:0:0:0:0:0:0:0:0:0:0:9:1:1:0:10000:0|h|h
--|H1:item:43546:134:50:0:0:0:0:0:0:0:0:0:0:0:0:1:1:0:0:10000:0|h|h
local function alchGrab(event) 
	if WritCreater.savedVars.shouldGrab and WritCreater.lang =="en" then
		local nilFunc = function(i, b)return true end
		local writs = WritCreater.writSearch()
		local questIndex = writs["A"]
		if questIndex then
			for j=1,4 do 
				local a=GetJournalQuestConditionInfo(questIndex, 1, j)
				local cur, max =GetJournalQuestConditionValues(questIndex,1,j)
				a=a:lower()
				if a:find("craft") and cur<max then
					a = exceptions(a)
					dqueue[#dqueue+1] = a
					a=WritCreater.parser(a)
					if a[4] =="ravage" then
						a = a[2].." of "..a[4].." "..a[5]
					else
						a =a[2].." of "..a[4]
					end
					queue[#queue+1] = function() potionGrab(a,1,false, function(i,BAG_BANK) local temp = {ZO_LinkHandler_ParseLink(GetItemLink(BAG_BANK,i))} if tonumber(temp[24]) then return tonumber(temp[24])>0 else return false end end) 
					--d(tonumber(select(24,ZO_LinkHandler_ParseLink(GetItemLink(BAG_BANK,i))))>0)
					
				end
				elseif a:find("acquire") and cur<max then
					a = exceptions(a)
					local place = string.find(a,":")
					a = string.sub(a,9,place-1)
					dqueue[#dqueue+1] = a
					queue[#queue+1] = function() potionGrab(a,max-cur,false,nilFunc) end
				end
			end
		end
		questIndex = writs["E"]
		if questIndex then
			for j=1,4 do 
				local a=GetJournalQuestConditionInfo(questIndex, 1, j)
				local cur, max = GetJournalQuestConditionValues(questIndex,1,j)
				a=a:lower()
				if a:find("acquire") and cur<max then
					a = exceptions(a)
					a = WritCreater.parser(a)
					dqueue[#dqueue+1] = a[2]
					queue[#queue+1] = function() potionGrab(a[2],max-cur,true,nilFunc) end
				end
			end
		end
		questIndex = writs["P"]
		if questIndex then
			for j=1,4 do 
				local a=GetJournalQuestConditionInfo(questIndex, 1, j)
				local cur, max =GetJournalQuestConditionValues(questIndex,1,j)
				a=a:lower()
				if a:find("craft") and cur<max then
					a = exceptions(a)
					a=string.gsub(a,"-"," ")
					local place = string.find(a,":")
					a = string.sub(a,7,place-1)
					dqueue[#dqueue+1] = a
					
					queue[#queue+1] = function() potionGrab(a,max-cur,false,function(i, BAG_BANK) local temp = {ZO_LinkHandler_ParseLink(GetItemLink(BAG_BANK,i))} if tonumber(temp[5]) then  return tonumber(temp[5])>0 else return false end end )
					end
				end
			end
		end

		zo_callLater(queueRun,WritCreater.savedVars.delay)
	end

end
functionholder = alchGrab


WritCreater.alchGrab = alchGrab

--SLASH_COMMANDS['/testpotion'] = returnPotionLevel

local function alchCall()
	timesToRun = 1
	queue = {}
	alchGrab()

	
end



EVENT_MANAGER:RegisterForEvent(WritCreater.name, EVENT_OPEN_BANK, alchGrab)
EVENT_MANAGER:RegisterForEvent(WritCreater.name, EVENT_CRAFTING_STATION_INTERACT, alchCall)

--[[|H1:item:23268:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0|h|h
|H1:item:64501:308:50:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0|h|h
|H1:item:64500:134:50:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0|h|h
|H0:item:23267:125:50:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0|h|h
|H1:item:23266:30:40:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0|h|h
|H1:item:1187:30:10:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0|h|h
|H1:item:23265:30:30:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0|h|h
|H1:item:23267:125:50:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0|h|h
|H1:item:883:30:1:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0|h|h
|H1:item:4570:30:1:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0|h|h
]]
