function WritCreater.langWritNames() --Exacts!!!  I know for german alchemy writ is Alchemistenschrieb - so ["G"] = schrieb, and ["A"]=Alchemisten
	local names = {
	["G"] = "schrieb",
	["E"] = "Verzauberer",
	["B"] = "Schmiede",
	["C"] = "Schneider",
	["P"] = "Versorger",
	["W"] = "Schreiner",
	["A"] = "Alchemisten",
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
				[1] = "Roben",
				[2] = "Jacken",
				[3] = "Schuhe",
				[4] = "Handschuhe",
				[5] = "Hüte",
				[6] = "Beinkleider",
				[7] = "Schulterpolster",
				[8] = "Schärpen",
				[9] = "Wämser",
				[10] = "Stiefel",
				[11] = "Armschienen",
				[12] = "Helme",
				[13] = "Schoner",
				[14] = "Schulterkappen",
				[15] = "Riemen",
			},
			["match"] = --exact!!! This is not the material, but rather the prefix the material gives to equipment. e.g. Homespun Robe, Linen Robe
			{
				[1] = "Jute", --lvtier one of mats
				[2] = "Flachs",	--l
				[3] = "Baumwoll",
				[4] = "Spinnenseiden",
				[5] = "Ebengarn",
				[6] = "Kresh",
				[7] = "Eisenstoff",
				[8] = "Silberstoff",
				[9] = "Leerenstoff",
				[10] = "Ahnenseiden",
				[11] = "Rohleder",
				[12] = "Halbleder",
				[13] = "Leder",
				[14] = "Hartleder",
				[15] = "Wildleder",
				[16] = "Rauleder",
				[17] = "Eisenleder",
				[18] = "Prächtige",
				[19] = "Schattenleder",
				[20] = "Rubedoleder",
			},
			["names"] = --Does not strictly need to be exact, but people would probably appreciate it
			{
				[1] = "Jute", 
				[2] = "Flachs",	
				[3] = "Baumwolle",
				[4] = "Spinnenseide",
				[5] = "Ebengarn",
				[6] = "Kreshfasern",
				[7] = "Eisenstoff",
				[8] = "Silberstoff",
				[9] = "Leerenstoff",
				[10] = "Ahnenseide",
				[11] = "Rohleder",
				[12] = "Halbleder",
				[13] = "Leder",
				[14] = "Hartleder",
				[15] = "Wildleder",
				[16] = "Rauleder",
				[17] = "Eisenleder",
				[18] = "Prachtleder",
				[19] = "Schattenleder",
				[20] = "Rubedoleder",
			}		
		},
		["B"] = 
		{
			["pieces"] = --exact!!
			{
				[1] = "Äxte",
				[2] = "Keulen",
				[3] = "Schwerter",
				[4] = "Streitäxte",
				[5] = "Streitkolben",
				[6] = "Bidenhänder",
				[7] = "Dolche",
				[8] = "Kürasse",
				[9] = "Panzerschuhe",
				[10] = "Hentzen",
				[11] = "Hauben",
				[12] = "Beinschienen",
				[13] = "Schulterschutze",
				[14] = "Gürtel",
			},
			["match"] = --exact!!! This is not the material, but rather the prefix the material gives to equipment. e.g. Iron Axe, Steel Axe
			{
				[1] = "Eisen",
				[2] = "Stahl",
				[3] = "Oreichalkos",
				[4] = "Dwemer",
				[5] = "Ebenerz",
				[6] = "Kalzinium",
				[7] = "Galatit",
				[8] = "Flinksilber",
				[9] = "Leerenstahl",
				[10] = "Rubedit",
			},
			["names"] = --Does not strictly need to be exact, but people would probably appreciate it
			{
				[1] = "Eisenbarren",
				[2] = "Stahlbarren",
				[3] = "Oreichalkosbarren",
				[4] = "Dwemrbarren",
				[5] = "Ebenerzbarren",
				[6] = "Kalziniumbarren",
				[7] = "Galatitbarren",
				[8] = "Flinksilberbarren",
				[9] = "Leerenstahlbarren",
				[10]= "Rubeditbarren",
			}
		},
		["W"] = 
		{
			["pieces"] = --Exact!!!
			{
				[1] = "Bogen",
				[2] = "Schilde",
				[3] = "Flammenstäbe",
				[4] = "Froststäbe",
				[5] = "Blitzstäbe",
				[6] = "Heilungsstäbe",
				
			},
			["match"] = --exact!!! This is not the material, but rather the prefix the material gives to equipment. e.g. Maple Bow. Oak Bow.
			{
				[1] = "Ahorn",
				[2] = "Eichen",
				[3] = "Buchen",
				[4] = "Hickory",
				[5] = "Eiben",
				[6] = "Birken",
				[7] = "Eschen",
				[8] = "Mahagoni",
				[9] = "Nachtholz",
				[10] = "Rubineschen",
			},
			["names"] = --Does not strictly need to be exact, but people would probably appreciate it
			{
				[1] = "Geschliffener Ahorn",
				[2] = "Geschliffene Eiche",
				[3] = "Geschliffene Buche",
				[4] = "Geschliffenes Hickory",
				[5] = "Geschliffene Eibe",
				[6] = "Geschliffene Birke",
				[7] = "Geschliffene Esche",
				[8] = "Geschliffenes Mahagoni",
				[9] = "Geschliffenes Nachtholz",
				[10] = "Geschliffene Rubinesche",
			}
		},
		["E"] = 
		{
			["pieces"] = --exact!!
			{
				[2] = "Ausdauer",
				[1] = "Lebens",
				[3] = "Magicka",
			},
			["match"] = --exact!!! The names of glyphs. The prefix (in English) So trifling glyph of magicka, for example
			{
				[1] = "unbedeutende", 
				[2] = "minderwertige",
				[3] = "winzige",
				[4] = "schwache",
				[5] = "niedere",
				[6] = "geringe",
				[7] = "moderate",
				[8] = "durchschnittliche",
				[9] = "starke",
				[10]= "stärkere",
				[11]= "hervorragende",
				[12]= "gewaltige",
				[13]= "vortreffliche",
				[14]= "monumentale",
				[15]= "prächtige",
				[16]= "wahrlich prächtige",
			},
		},
	}

	return craftInfo

end


function WritCreater.langOptions() --Sentimental
	local options =  {
		[1] = {
		type = "checkbox",
		name = "Zeige Writ Crafter Fenster",
		tooltip = "Zeige das Writ Crafter Fenster während du an einer Handwerksstation bist",
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
              name = "Automatisches herstellen",
              tooltip = "Bei Aktivierung dieser Funktion wird Writ Crafter automatisch mit dem Herstellen beginnen, sobald ihr bei einer Handwerksstation seid. Wird das Writ Craft Fenster nicht angezeigt, wird diese Funktion eingeschaltet sein.",
              getFunc = function() return WritCreater.savedVars.autoCraft end,
              disabled = function() return not WritCreater.savedVars.showWindow end,
              setFunc = function(value) 
              	WritCreater.savedVars.autoCraft = value 
              end,
         },
     		[3] = {
              type = "checkbox",
              name = "Schmiede",
              tooltip = "Addon für Schmiede ausschalten",
              getFunc = function() return WritCreater.savedVars.Blacksmith end,
              setFunc = function(value) 
              	WritCreater.savedVars.Blacksmith = value 
              end,
         },
     		[4] = {
              type = "checkbox",
              name = "Schneider",
              tooltip = "Addon für Schneider ausschalten",
              getFunc = function() return WritCreater.savedVars.Clothier end,
              setFunc = function(value) 
              	WritCreater.savedVars.Clothier = value 
              end,
         },
     		[5] = {
              type = "checkbox",
              name = "Verzauberer",
              tooltip = "Addon für Verzauberer ausschalten",
              getFunc = function() return WritCreater.savedVars.Enchanter end,
              setFunc = function(value) 
              	WritCreater.savedVars.Enchanter = value 
              end,
         },
     		[6] = {
              type = "checkbox",
              name = "Schreiner",
              tooltip = "Addon für Schreiner ausschalten",
              getFunc = function() return WritCreater.savedVars.Woodworker end,
              setFunc = function(value) 
              	WritCreater.savedVars.Woodworker = value 
              end,
         },
    --[[     [7] = {
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
		[5]="Der Befehl  /dailyreset  ist ein Chatbefehl. Dieser zeigt dir an, wann du deine nächsten Handwerksbelohnungen machen kannst.Als Letztes noch eine wichtige Info zu den Stilmaterialien: Es werden nur Stilmaterilien von den neun Rassen verwendet, keine seltenen Stile oder Mimensteine.",
		[4]="Als Letztes kannst du auswählen für welches Handwerk du das AddOn aktivieren willst. Der Standard ist bei allen Berufen auf An. Wenn du gewisse deaktivieren willst, gehe in die Einstellungen. Da sind auch weitere Dinge die du wissen solltest.",
		[3]="Als Nächstes kannst du dich entscheiden, ob dieses Fenster angezeigt werden soll, solange du dich an einer Handwerksstation befindest.\nDieses Fenster zeigt dir wieviele Materialien für das Herstellen benötigt werden und wieviele du aktuell besitzt.",
		[2]="Wenn aktiv werden deine Sachen automatisch beim Betreten einer Handwerksstation hergestellt.",
		[1]="Willkommen zu Dolgubon's Lazy Writ Crafter!\nEs gibt ein paar Einstellungen die du zunächst festlegen\n solltest. Du kannst die Einstellungen jederzeit bei\nAddOn in Einstellungen >> Erweiterungen Menü ändern.",
	}
	return t[i]
end

function WritCreater.langTutorialButton(i,onOrOff) --sentimental and short pls
	local tOn = 
	{
		[1]="Standardoptionen",
		[2]="An",
		[3]="Zeigen",
		[4]="Weiter",
		[5]="Fertig",
	}
	local tOff=
	{
		[1]="Weiter",
		[2]="Aus",
		[3]="Verbergen",
	}
	if onOrOff then
		return tOn[i]
	else
		return tOff[i]
	end
end

local enExceptions = -- This is a slight misnomer. Not all are corrections - some are changes into english so that future functions will work
{
	["original"] =
	{
		[1] = "beschafft",
		[2] = "beliefert",

	},
	["corrected"] = 
	{	
		[1] = "acquire",
		[2] = "deliver",

	},
}

local exceptions = -- This is a slight misnomer. Not all are corrections - some are changes into english so that future functions will work
{
	["original"] =
	{
		[1] = "beliefert",
		[2] = "bögen",
	},
	["corrected"] = 
	{
		[1] = "deliver",
		[2] = "bogen",
	},
}

function WritCreater.exceptions(condition)
	condition = string.lower(condition)
	local info = WritCreater.languageInfo()
	for i = 1, 20 do
		condition = string.gsub(condition,string.lower(info["C"]["match"][i]),string.lower(info["C"]["match"][i].." "))
	end
	for i = 1, 10 do
		condition = string.gsub(condition,string.lower(info["B"]["match"][i]),string.lower(info["B"]["match"][i].." "))
	end
	for i = 1, 10 do
		condition = string.gsub(condition,string.lower(info["W"]["match"][i]),string.lower(info["W"]["match"][i].." "))
	end
	for i = 1, #exceptions["original"] do
		condition = string.gsub(condition,exceptions["original"][i],exceptions["corrected"][i])
	end
	condition = string.gsub(condition, " "," ")
	return condition
end

function WritCreater.questExceptions(condition)
	condition = string.gsub(condition, " "," ")
	return condition
end

function WritCreater.enchantExceptions(condition)
	condition = string.gsub(condition, " "," ")
	condition = string.lower(condition)
	for i = 1, #enExceptions["original"] do
		condition = string.gsub(condition,enExceptions["original"][i],enExceptions["corrected"][i])
	
	end
	return condition
end



function WritCreater.langStrings()
	local strings = {
	["runeReq"] = function (essence, potency) 
		return "|c2dff00Benötigt 1 |rTa|c2dff00, 1 |cffcc66"..essence.."|c2dff00 und ein |c0066ff"..potency end,
	["runeMissing"] = function (ta,essence,potency)
		if not ta["bag"] then
			if not essence["bag"] then
				if not potency["bag"] then
					return "|cf60000Glyphe kann nicht hergestellt werden.\nNicht genügend |rTa|cf60000, |cffcc66"..essence["slot"].."|cf60000 oder |c0066ff"..potency["slot"].."|r"
				else
					return "|cf60000Glyphe kann nicht hergestellt werden.\nNicht genügend |rTa|cf60000 oder |cffcc66"..essence["slot"].."|r"
				end
			else
				if not potency["bag"] then
					return "|cf60000Glyphe kann nicht hergestellt werden.\nNicht genügend |rTa|cf60000, oder |c0066ff"..potency["slot"].."|r"
				else
					return "|cf60000Glyphe kann nicht hergestellt werden.\nNicht genügend |rTa"
				end
			end
		else
			if not essence["bag"] then
				if not potency["bag"] then
					return "|cf60000Glyphe kann nicht hergestellt werden.\nNicht genügend |cffcc66"..essence["slot"].."|cf60000 oder |c0066ff"..potency["slot"].."|r"
				else
					return "|cf60000Glyphe kann nicht hergestellt werden.\nNicht genügend |cffcc66"..essence["slot"].."|r"
				end
			else
				if not potency["bag"] then
					return "|cf60000Glyphe kann nicht hergestellt werden.\nNicht genügend |c0066ff"..potency["slot"].."|r"
				end
			end
		end
	end,
	["smithingMissing"] = "\n|cf60000Nicht genügend Materialien|r",
	["craftAnyway"] = "Trotzdem herstellen",
	["smithingEnough"] = "\n|c2dff00Du hast genügend Materialien",
	["craft"] = "|c00ff00Herstellen|r",
	["smithingReqM"] = function(amount, type, more) return "Benötigt "..amount.." "..type.." (|cf60000"..more.." benötigt|r)" end,
	["smithingReqM2"] = function (amount,type,more) return "\n"..amount.." "..type.." (|cf60000"..more.." benötigt|r)" end,
	["smithingReq"] = function (amount,type, current) return "Benötigt "..amount.." "..type.." (|c2dff00"..current.." verfügbar|r)" end,
	["smithingReq2"] = function (amount,type, current) return "\n"..amount.." "..type.." (|c2dff00"..current.." verfügbar|r)" end,
	["crafting"] = "|cffff00Herstellung...|r",
	["craftIncomplete"] = "|cf60000Die Herstellung konnte nicht abgeschlossen werden.\nDu benötigst mehr Materialien.|r",
	["moreStyle"] = "|cf60000Nicht genügend Stilsteine\nvon den 9 Standard Rassen|r",
	["dailyreset"] = function (till) d(till["hour"].." Stunden und "..till["minute"].." Minuten bis zum Daily Reset") end,
	["complete"] = "|c00FF00Der Schrieb ist fertig|r",
	["craftingstopped"] = "Herstellung gestoppt. Bitte überprüfe, ob das AddOn den richtigen Gegenstand herstellt.",
}
DolgubonsWritsBackdropCraft:SetWidth(200)
return strings

end
WritCreater.lang = "de"