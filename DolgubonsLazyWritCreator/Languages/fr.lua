

function WritCreater.langWritNames() --Exacts!!!  I know for german alchemy writ is Alchemistenschrieb - so ["G"] = schrieb, and ["A"]=Alchemisten
	local names = {
	["G"] = "Commande",
	["E"] = "d'enchantement",
	["B"] = "forge",
	["C"] = "tailleur",
	["P"] = "cuisine",
	["W"] = "bois",
	["A"] = "d'alchimie",
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
				[2] = "pourpoint",
				[3] = "chaussures",
				[4] = "gants",
				[5] = "chapeau",
				[6] = "braies",
				[7] = "épaulettes",
				[8] = "baudrier",
				[9] = "gilet",
				[10]= "bottes",
				[11]= "brassards",
				[12]= "casque",
				[13]= "gardes",
				[14]= "d'épaules",
				[15]= "ceinture",
			},
			["match"] = --exact!!! This is not the material, but rather the prefix the material gives to equipment. e.g. Homespun Robe, Linen Robe
			{
				[1] = "artisanal", --lvtier one of mats
				[2] = "lin",	--l
				[3] = "coton",
				[4] = "d'araignée",
				[5] = "d'ébonite",
				[6] = "kresh",
				[7] = "fer",
				[8] = "d'argent",
				[9] = "tissombre",
				[10]= "ancestrale",
				[11]= "brut",
				[12]= "peau",
				[13]= "cuir",
				[14]= "complète",
				[15]= "déchue",
				[16]= "clouté",
				[17]= "ferhide",
				[18]= "superbes",
				[19]= "d'ombre",
				[20]= "pourpre",
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
				[1] = "hache",
				[2] = "masse",
				[3] = "épée",
				[4] = "bataille",
				[5] = "d'arme",
				[6] = "longue",
				[7] = "dague",
				[8] = "cuirasse",
				[9] = "solerets",
				[10] = "gantelet",
				[11] = "heaume",
				[12] = "grèves",
				[13] = "spallière",
				[14] = "gaine",
			},
			["match"] = --exact!!! This is not the material, but rather the prefix the material gives to equipment. e.g. Iron Axe, Steel Axe
			{
				[1] = "fer",
				[2] = "acier",
				[3] = "orichalque",
				[4] = "dwemer",
				[5] = "ébonite",
				[6] = "calcinium",
				[7] = "galatite",
				[8] = "mercure",
				[9] = "vide",
				[10]= "cuprite",
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
				[1] = "arc",
				[3] = "infernal",
				[4] ="glace",
				[5] ="foudre",
				[6] ="rétablissement",
				[2] ="bouclier",
			},
			["match"] = --exact!!! This is not the material, but rather the prefix the material gives to equipment. e.g. Maple Bow. Oak Bow.
			{
				[1] = "érable",
				[2] =  "chêne",
				[3] =  "hêtre",
				[4] = "noyer",
				[5] = "ifyew",
				[6] =  "bouleau",
				[7] = "frêne",
				[8] = "acajou",
				[9] = "nuit",
				[10] = "roux",
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
				[2] = "vigoureux",
				[1] = "vital",
				[3] = "magie",
			},
			["match"] = --exact!!! The names of glyphs. The prefix (in English) So trifling glyph of magicka, for example
			{
				[1] = "insignifiant", 
				[2] = "sameAsNumberSix",
				[3] = "petit",
				[4] = "léger",
				[5] = "mineur",
				[6] = "lesser",
				[7] = "modéré",
				[8] = "moyen",
				[9] = "fort",
				[10]= "bon",
				[11]= "majeur",
				[12]= "grandiose",
				[13]= "splendide",
				[14]= "monumental",
				[15]= "superbe",
				[16]= "vraiment",
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
   --[[      [7] = {
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
         		max = 120,
         		getFunc = function() return WritCreater.savedVars.delay end,
         		setFunc = function(value)
         			WritCreater.savedVars.delay = value
         		end,
         		disabled = function() return not WritCreater.savedVars.shouldGrab end,
         },]]
    }
    return options
end

function WritCreater.langEssenceNames() --exact!

local essenceNames =  
	{
		[1] = "oko", --health
		[2] = "deni", --stamina
		[3] = "makko", --magicka
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
		[4]="Finally, you can also choose to deactivate or activate \nthis addon for each profession.\nBy default, all applicable crafts are on.\nIf you wish to turn some off, please check the settings.\nThere's also a few things you should know.",
		[3]="Next, you need to choose if you wish to see this window when using a crafting station.\nThe window will tell you how many mats the writ will require, as well as how many you currently have.",
		[2]="The first setting to choose is if you want to use\nAutoCraft.\nIf on, when you enter a crafting station, the addon will immediately start crafting.",
		[1]="Welcome to Dolgubon's Lazy Writ Crafter!\nThere are a few settings you should choose first.\n You can change the settings at any\n time in the addon settings menu.",
	}
	return t[i]
end

function WritCreater.langTutorialButton(i,onOrOff) --sentimental and short pls
	local tOn = 
	{
		[1]="Just use Defaults",
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

local exceptions = -- This is a slight misnomer. Not all are corrections - some are changes into english so that future functions will work
{
	["original"] = {
	[1] = "artisanale",
	[2] = "artisanales",
	[3] = "artisanaux",
	[4] = "dwemère",
	[5] = "dwemères",
	[6] = "dwemers",
	[7] = "brutes",
	[8] = "brute",
	[9] = "bruts",
	[10]= "cuir brut",
	[11]= "complètes",
	[12]= "complet",
	[13]= "complets",
	[14]= "cuir complète",
	[15]= "déchu",
	[16]= "déchues",
	[17]= "déchus",
	[18]= "cloutées",
	[19]= "cloutés",
	[20]= "cloutée",
	[21]= "cuir clouté",
	[22]= "peau de fer",
	[23]= "superbe",
	[24]= "cuir pourpre",
	[25]= "peau d'ombre",
	[26]= "livrez",
	[27]= "acier de vide",
	[28]= "casque en cuprite",
	[29]= "spallières",
	[30]= "néant",
	[31]= "gantelets",


	},
	["corrected"] = {
	[1] = "artisanal",
	[2] = "artisanal",
	[3] = "artisanal",
	[4] = "dwemer",
	[5] = "dwemer",
	[6] = "dwemer",
	[7] = "brut",
	[8] = "brut",
	[9] = "brut",
	[10]= "brut",
	[11]= "complète",
	[12]= "complète",
	[13]= "complète",
	[14]= "complète",
	[15]= "déchue",
	[16]= "déchue",
	[17]= "déchue",
	[18]= "clouté",
	[19]= "clouté",
	[20]= "clouté",
	[21]= "clouté",
	[22]= "ferhide",
	[23]= "superbes",
	[24]= "pourpre",
	[25]= "d'ombre",
	[26]= "deliver",
	[27]= "vide",
	[28]= "heaume en cuprite",
	[29]= "spallière",
	[30]= "vide",
	[31]= "gantelet",
	}

}
local enExceptions = {
	["original"]  = {
		[1] = "santé",
		[2] = "vigueur",
	},
	["corrected"] = {
		[1] = "vital",
		[2] = "vigoureux",
	},
}



function WritCreater.exceptions(condition)
	condition = string.lower(condition)

	for i = 1, #exceptions["original"] do
		if string.find(condition, exceptions["original"][i]) then
			condition = string.gsub(condition, exceptions["original"][i],exceptions["corrected"][i])
		end
	end
	condition = string.gsub(condition, " "," ")
	condition = string.lower(condition)
	return condition
end

function WritCreater.questExceptions(condition)
	condition = string.gsub(condition, " "," ")
	condition = string.lower(condition)
	condition = string.gsub(condition,"commandes","commande")
	return condition
end

function WritCreater.enchantExceptions(condition)
	condition = string.lower(condition)
	condition = string.gsub(condition, " "," ")
	condition = string.gsub(condition,"livrez","deliver")
	for i = 1, #enExceptions["original"] do
		if string.find(condition, enExceptions["original"][i]) then
			condition = string.gsub(condition, enExceptions["original"][i],enExceptions["corrected"][i])
		end
	end
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
	["smithingMissing"] = "\n|cf60000You do not have enough mats|r",
	["craftAnyway"] = "Craft anyway",
	["smithingEnough"] = "\n|c2dff00You have enough mats|r",
	["craft"] = "|c00ff00Craft|r",
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

WritCreater.lang = "fr"