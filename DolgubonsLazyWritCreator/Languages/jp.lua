

function WritCreater.langWritNames() --Exacts!!!  I know for german alchemy writ is Alchemistenschrieb - so ["G"] = schrieb, and ["A"]=Alchemisten
	local names = {
	["G"] = "召喚",
	["E"] = "付呪",
	["B"] = "鍛冶",
	["C"] = "縫製",
	["P"] = "調理",
	["W"] = "木工",
	["A"] = "錬金術",
	}
	return names
end


function WritCreater.languageInfo() --exacts!!!

local craftInfo = 
	{
		["C"] = 
		{
			["pieces"] = --exact!!
			{
				[1] = "robe",
				[2] = "jerkin",
				[3] = "shoes",
				[4] = "gloves",
				[5] = "hat",
				[6] = "breeches",
				[7] = "epaulets",
				[8] = "sash",
				[9] = "jack",
				[10]= "boots",
				[11]= "bracers",
				[12]= "helmet",
				[13]= "guards",
				[14]= "cops",
				[15]= "belt",
			},
			["match"] = --exact!!! This is not the material, but rather the prefix the material gives to equipment. e.g. Homespun Robe, Linen Robe
			{
				[1] = "Homespun", --lvtier one of mats
				[2] = "Linen",	--l
				[3] = "Cotton",
				[4] =  "Spidersilk",
				[5] = "Ebonthread",
				[6] = "Kresh",
				[7] = "Ironthread",
				[8] = "Silverweave",
				[9] = "Shadowspun",
				[10]= "Ancestor",
				[11]= "Rawhide",
				[12]= "Hide",
				[13]= "Leather",
				[14]= "Full-Leather",
				[15]= "Fell",
				[16]= "Brigandine",
				[17]= "Ironhide",
				[18]= "Superb",
				[19]= "Shadowhide",
				[20]= "Rubedo",
			},
			["names"] = --Does not strictly need to be exact, but people would probably appreciate it
			{
				[1] = "Jute",
				[2] = "Flax",
				[3] = "Cotton",
				[4] = "Spidersilk",
				[5] = "Ebonthread",
				[6] = "Kresh Fiber",
				[7] = "Ironthread",
				[8] = "Silverweave",
				[9] = "Void Cloth",
				[10]= "Ancestor Silk",
				[11]= "Rawhide",
				[12]= "Hide",
				[13]= "Leather",
				[14]= "Thick Leather",
				[15]= "Fell Hide",
				[16]= "Topgrain Hide",
				[17]= "Iron Hide",
				[18]= "Superb Hide",
				[19]= "Shadowhide",
				[20]= "Rubedo Leather",
			}		
		},
		["B"] = 
		{
			["pieces"] = --exact!!
			{
				[1] = "axe",
				[2] = "mace",
				[3] = "sword",
				[4] = "battle",
				[5] ="maul",
				[6] ="greatsword",
				[7] = "dagger",
				[8] = "cuirass",
				[9] = "sabatons",
				[10] = "gauntlets",
				[11] = "helm",
				[12] = "greaves",
				[13] = "pauldron",
				[14] = "girdle",
			},
			["match"] = --exact!!! This is not the material, but rather the prefix the material gives to equipment. e.g. Iron Axe, Steel Axe
			{
				[1] = "Iron",
				[2] = "Steel",
				[3] = "Orichalc",
				[4] = "Dwarven",
				[5] = "Ebon",
				[6] = "Calcinium",
				[7] = "Galatite",
				[8] = "Quicksilver",
				[9] = "Voidsteel",
				[10]= "Rubedite",
			},
			["names"] = --Does not strictly need to be exact, but people would probably appreciate it
			{
				[1] = "Iron Ingots",
				[2] = "Steel Ingots",
				[3] = "Orichalc Ingots",
				[4] = "Dwarven Ingots",
				[5] = "Ebony Ingots",
				[6] = "Calcinium Ingots",
				[7] = "Galatite Ingots",
				[8] = "Quicksilver Ingots",
				[9] = "Voidsteel Ingots",
				[10]= "Rubedite Ingots",
			}
		},
		["W"] = 
		{
			["pieces"] = --Exact!!!
			{
				[1] = "弓",
				[3] = "火",
				[4] = "氷",
				[5] = "稲妻",
				[6] = "復元",
				[2] = "盾",
			},
			["match"] = --exact!!! This is not the material, but rather the prefix the material gives to equipment. e.g. Maple Bow. Oak Bow.
			{
				[1] = "カエデ",
				[2] =  "オーク",
				[3] =  "ブナ",
				[4] = "ヒッコリー",
				[5] = "セイヨウイチイ",
				[6] =  "バーチ",
				[7] = "トネリコ",
				[8] = "マホガニ",
				[9] = "ナイトウッド",
				[10] = "ルビー",
			},
			["names"] = --Does not strictly need to be exact, but people would probably appreciate it
			{
				[1] = "Sanded Maple",
				[2] = "Sanded Oak",
				[3] = "Sanded Beech",
				[4] = "Sanded Hickory",
				[5] = "Sanded Yew",
				[6] = "Sanded Birch",
				[7] = "Sanded Ash",
				[8] = "Sanded Mahogany",
				[9] = "Sanded Nightwood",
				[10]= "Sanded Ruby Ash",
			}
		},
		["E"] = 
		{
			["pieces"] = --exact!!
			{
				[2] = "stamina",
				[1] = "health",
				[3] = "magicka",
			},
			["match"] = --exact!!! The names of glyphs. The prefix (in English) So trifling glyph of magicka, for example
			{
				[1] = "trifling", 
				[2] = "inferior",
				[3] = "petty",
				[4] = "slight",
				[5] = "minor",
				[6] = "lesser",
				[7] = "moderate",
				[8] = "average",
				[9] = "strong",
				[10]= "major",
				[11]= "greater",
				[12]= "grand",
				[13]= "splendid",
				[14]= "monumental",
				[15]= "superb",
				[16]= "truly",
			},
		},
	}

	return craftInfo

end


function WritCreater.langOptions() --Sentimental
	local options =  {
		[1] = {
		type = "checkbox",
		name = "Show Craft Window",
		tooltip = "Shows the crafting window when a crafting station is open",
		getFunc = function() return WritCreater.savedVars.showWindow end,
		setFunc = function(value) 
			WritCreater.savedVars.showWindow = value
			if value == false then
				WritCreater.savedVars.autoCraft = true
			end

		end,
		},
		[2] = {
              type = "checkbox",
              name = "AutoCraft",
              tooltip = "Selecting this will cause the addon to begin crafting immediately upon entering a crafting station. If the window is not shown, this will be on.",
              getFunc = function() return WritCreater.savedVars.autoCraft end,
              disabled = function() return not WritCreater.savedVars.showWindow end,
              setFunc = function(value) 
              	WritCreater.savedVars.autoCraft = value 
              end,
         },
     		[3] = {
              type = "checkbox",
              name = "Blacksmithing",
              tooltip = "Turn the addon off for Blacksmithing",
              getFunc = function() return WritCreater.savedVars.Blacksmith end,
              setFunc = function(value) 
              	WritCreater.savedVars.Blacksmith = value 
              end,
         },
     		[4] = {
              type = "checkbox",
              name = "Clothing",
              tooltip = "Turn the addon off for Clothing",
              getFunc = function() return WritCreater.savedVars.Clothier end,
              setFunc = function(value) 
              	WritCreater.savedVars.Clothier = value 
              end,
         },
     		[5] = {
              type = "checkbox",
              name = "Enchanting",
              tooltip = "Turn the addon off for Enchanting",
              getFunc = function() return WritCreater.savedVars.Enchanter end,
              setFunc = function(value) 
              	WritCreater.savedVars.Enchanter = value 
              end,
         },
     		[6] = {
              type = "checkbox",
              name = "Woodworking",
              tooltip = "Turn the addon off for Woodworking",
              getFunc = function() return WritCreater.savedVars.Woodworker end,
              setFunc = function(value) 
              	WritCreater.savedVars.Woodworker = value 
              end,
         },
         	[7] = {
         	type = "checkbox",
         	name = "Grab writ items",
         	tooltip = "Grab items required for writs (e.g. nirnroot, Ta, etc.) from the bank",
         	getFunc = function() return WritCreater.savedVars.shouldGrab end,
         	setFunc = function(value) WritCreater.savedVars.shouldGrab = value end,
         },
         	[8] = {
         		type = "slider",
         		name = "Item Grab Delay",
         		tooltip = "How long to wait before grabbing items from the bank (milliseconds)",
         		min = 10,
         		max = 2000,
         		getFunc = function() return WritCreater.savedVars.delay end,
         		setFunc = function(value)
         			WritCreater.savedVars.delay = value
         		end,
         		disabled = function() return not WritCreater.savedVars.shouldGrab end,
         },
    }
    return options
end

function WritCreater.langEssenceNames() --exact!

local essenceNames =  
	{
		[1] = "Oko", --health
		[2] = "Deni", --stamina
		[3] = "Makko", --magicka
	}
	return essenceNames
end

function WritCreater.langPotencyNames() --exact!! Also, these are all the positive runestones - no negatives needed.
	local potencyNames = 
	{
		[1] = "Jora", --Lowest potency stone lvl
		[2] = "Porade",
		[3] = "Jera",
		[4] = "Jejora",
		[5] = "Odra",
		[6] = "Pojora",
		[7] = "Edora",
		[8] = "Jaera",
		[9] = "Pora",
		[10]= "Denara",
		[11]= "Rera",
		[12]= "Derado",
		[13]= "Rekura",
		[14]= "Kura",
		[15]= "Rejera",
		[16]= "Repora", --v16 potency stone
		
	}
	return potencyNames
end

function WritCreater.langTutorial(i) --sentimental
	local t = {
		[5]="First, /dailyreset is a slash command that will tell you\nhow long until the next daily server reset.\nFinally, this addon will only use style\nstones from the 9 basic alliance styles.",
		[4]="Finally, you can also choose to deactivate or\nactivate this addon for each profession.\nBy default, all applicable crafts are on.\nIf you wish to turn some off, please check the settings.\nThere's also a few things you should know.",
		[3]="Next, you need to choose if you wish to see this\nwindow when using a crafting station.\nThe window will tell you how many mats the writ will require, as well as how many you currently have.",
		[2]="The first setting to choose is if you\nwant to useAutoCraft.\nIf on, when you enter a crafting station, the addon will start crafting.",
		[1]="Welcome to Dolgubon's Lazy Writ Crafter!\nThere are a few settings you should choose first.\n You can change the settings at any\n time in the settings menu.",
	}
	return t[i]
end

function WritCreater.langTutorialButton(i,onOrOff) --sentimental and short pls
	local tOn = 
	{
		[1]="Use Defaults",
		[2]="On",
		[3]="Show",
		[4]="Continue",
		[5]="Finish",
	}
	local tOff=
	{
		[1]="Continue",
		[2]="Off",
		[3]="Do not show",
	}
	if onOrOff then
		return tOn[i]
	else
		return tOff[i]
	end
end

local exceptions = 
{
	[1] = 
	{
		["original"] = "rubedo leather",
		["corrected"] = "rubedo",
	},
	[2] = 
	{
		["original"] = "ancestor silk",
		["corrected"] = "ancestor",
	},
	[3] = 
	{
		["original"] = "ebony",
		["corrected"] = "ebon",
	},
	[4] = 
	{
		["original"] = "orichalcum",
		["corrected"] = "orichalc",
	},
	[5] = 
	{
		["original"] = "ruby ash",
		["corrected"] = "ruby",
	},
	[6] = 
	{
		["original"] = "dwarven pauldrons",
		["corrected"] = "dwarven pauldron",
	}
}

function WritCreater.exceptions(condition)
	condition = string.gsub(condition, "?"," ")
	condition = string.lower(condition)

	for i = 1, #exceptions do

		if string.find(condition, exceptions[i]["original"]) then
			condition = string.gsub(condition, exceptions[i]["original"],exceptions[i]["corrected"])
		end
	end
	return condition
end

function WritCreater.questExceptions(condition)
	condition = string.gsub(condition, "?"," ")
	return condition
end

function WritCreater.enchantExceptions(condition)
	condition = string.gsub(condition, "?"," ")
	return condition
end

function WritCreater.langStrings()
	local strings = {
	["runeReq"] = function (essence, potency) 
		return "|c2dff00Crafting will require 1 |rTa|c2dff00, 1 |cffcc66"..essence.."|c2dff00 and 1 |c0066ff"..potency.."|r" end,
	["runeMissing"] = function (ta,essence,potency)
		if not ta["bag"] then
			if not essence["bag"] then
				if not potency["bag"] then
					return "|cf60000Glyph could not be crafted. You do not have any |r"..ta["slot"].."|cf60000, |cffcc66"..essence["slot"].."|cf60000 or |c0066ff"..potency["slot"].."|r"
				else
					return "|cf60000Glyph could not be crafted. You do not have any |r"..ta["slot"].."|cf60000 or |cffcc66"..essence["slot"].."|r"
				end
			else
				if not potency["bag"] then
					return "|cf60000Glyph could not be crafted. You do not have any |rTa|cf60000 or |c0066ff"..potency["slot"].."|r"
				else
					return "|cf60000Glyph could not be crafted. You do not have any |rTa"
				end
			end
		else
			if not essence["bag"] then
				if not potency["bag"] then
					return "|cf60000Glyph could not be crafted. You do not have any |cffcc66"..essence["slot"].."|cf60000 or |c0066ff"..potency["slot"].."|r"
				else
					return "|cf60000Glyph could not be crafted. You do not have any |cffcc66"..essence["slot"].."|r"
				end
			else
				if not potency["bag"] then
					return "|cf60000Glyph could not be crafted. You do not have any |c0066ff"..potency["slot"].."|r"
				end
			end
		end
	end,
	["smithingMissing"] = "\n|cf60000十分な材料を持っていません|r",
	["craftAnyway"] = "Craft anyway",
	["smithingEnough"] = "\n|c2dff00十分な材料を持っています|r",
	["craft"] = "|c00ff00作成|r",
	["smithingReqM"] = function(amount, type, more) return "Crafting will use "..amount.." "..type.." (|cf60000You need "..more.."|r)" end,
	["smithingReqM2"] = function (amount,type,more) return "\nAs well as "..amount.." "..type.." (|cf60000You need "..more.."|r)" end,
	["smithingReq"] = function (amount,type, current) return "Crafting will use "..amount.." "..type.." (|c2dff00"..current.." available|r)" end,
	["smithingReq2"] = function (amount,type, current) return "\nAs well as "..amount.." "..type.." (|c2dff00"..current.." available|r)" end,
	["crafting"] = "|c00ff00Crafting...|r",
	["craftIncomplete"] = "|cf60000Crafting could not be completed.\nYou need more mats.|r",
	["moreStyle"] = "|cf60000You do not have any usable racial stones\nfrom the 9 basic alliance styles|r",
	["dailyreset"] = function (till)
		if till["hour"]==0 then
			if till["minute"]==1 then
				d("1 minute until daily server reset!")
			elseif till["minute"]==0 then
				if stamp==1 then
					d("Daily reset in "..stamp.." seconds!")
				else
					d("Seriously... Stop asking. Are you that impatient??? It resets in one more second godammit. Stupid entitled MMO players. *grumble grumble*")
				end
			else
				d(till["minute"].." minutes until daily reset!")
			end
		elseif till["hour"]==1 then
			if till["minute"]==1 then
				d(till["hour"].." hour and "..till["minute"].." minute until daily reset")
			else
				d(till["hour"].." hour and "..till["minute"].." minutes until daily reset")
			end
		else
			if till["minute"]==1 then
				d(till["hour"].." hours and "..till["minute"].." minute until daily reset")
			else
				d(till["hour"].." hours and "..till["minute"].." minutes until daily reset")
			end
		end 
	end,
	["complete"] = "|c00FF00Writ complete.|r",
	["craftingstopped"] = "Crafting stopped. Please check to make sure the addon is crafting the correct item.",
}
return strings

end

WritCreater.lang = "jp"
