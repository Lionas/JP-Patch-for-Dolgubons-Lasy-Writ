

function WritCreater.langWritNames() --Exacts!!!  I know for german alchemy writ is Alchemistenschrieb - so ["G"] = schrieb, and ["A"]=Alchemisten
	local names = {
	["G"] = "令状",
	["E"] = "付呪",
	["B"] = "鍛冶",
	["C"] = "仕立",
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
				[1] = "ローブ",
				[2] = "シャツ",
				[3] = "靴",
				[4] = "手袋",
				[5] = "帽子",
				[6] = "パンツ",
				[7] = "肩当て",
				[8] = "サッシュ",
				[9] = "胴当て",
				[10]= "ブーツ",
				[11]= "腕当て",
				[12]= "兜",
				[13]= "すね当て",
				[14]= "アームカップ",
				[15]= "ベルト",
			},
			["match"] = --exact!!! This is not the material, but rather the prefix the material gives to equipment. e.g. Homespun Robe, Linen Robe
			{
				[1] = "手織り布", --lvtier one of mats
				[2] = "リネン",	--l
				[3] = "コットン",
				[4] = "スパイダーシルク",
				[5] = "エボンスレッド",
				[6] = "クレッシュ",
				[7] = "アイアンスレッド",
				[8] = "シルバーウィーブ",
				[9] = "影",
				[10]= "先人",
				[11]= "生皮",
				[12]= "皮",
				[13]= "革",
				[14]= "フルレザー",
				[15]= "フェルハイド",
				[16]= "ブリガンダイン",
				[17]= "アイアンハイド",
				[18]= "最上",
				[19]= "シャドウハイド",
				[20]= "ルベドレザー",
			},
			["names"] = --Does not strictly need to be exact, but people would probably appreciate it
			{
				[1] = "黄麻", --lvtier one of mats
				[2] = "亜麻",	--l
				[3] = "コットン",
				[4] = "スパイダーシルク",
				[5] = "エボンスレッド",
				[6] = "クレッシュ繊維",
				[7] = "アイアンスレッド",
				[8] = "シルバーウィーブ",
				[9] = "虚無の布",
				[10]= "先人のシルク",
				[11]= "生皮",
				[12]= "皮",
				[13]= "革",
				[14]= "重厚な革",
				[15]= "フェルハイド",
				[16]= "トップグレインハイド",
				[17]= "鉄の皮",
				[18]= "最上なる皮",
				[19]= "シャドウハイド",
				[20]= "ルベドレザー",
			}
		},
		["B"] = 
		{
			["pieces"] = --exact!!
			{
				[1] = "斧",
				[2] = "戦棍",
				[3] = "剣",
				[4] = "両手斧",
				[5] = "大槌",
				[6] = "大剣",
				[7] = "短剣",
				[8] = "胸当て",
				[9] = "サバトン",
				[10] = "篭手",
				[11] = "兜",
				[12] = "グリーヴ",
				[13] = "ポールドロン",
				[14] = "ガードル",
			},
			["match"] = --exact!!! This is not the material, but rather the prefix the material gives to equipment. e.g. Iron Axe, Steel Axe
			{
				[1] = "鉄",
				[2] = "鋼鉄",
				[3] = "オリハルコン",
				[4] = "ドワーフ",
				[5] = "黒壇",
				[6] = "カルシニウム",
				[7] = "ガラタイト",
				[8] = "水銀",
				[9] = "虚無",
				[10]= "ルベダイト",
			},
			["names"] = --Does not strictly need to be exact, but people would probably appreciate it
			{
				[1] = "鉄のインゴット",
				[2] = "鋼鉄のインゴット",
				[3] = "オリハルコンのインゴット",
				[4] = "ドワーフのインゴット",
				[5] = "黒壇のインゴット",
				[6] = "カルシニウムのインゴット",
				[7] = "ガラタイトのインゴット",
				[8] = "水銀のインゴット",
				[9] = "虚無の鉄のインゴット",
				[10]= "ルベダイトのインゴット",
			}
		},
		["W"] = 
		{
			["pieces"] = --Exact!!!
			{
				[1] = "弓",
				[3] = "業火",
				[4] = "氷",
				[5] = "稲妻",
				[6] = "回復",
				[2] = "盾",
			},
			["match"] = --exact!!! This is not the material, but rather the prefix the material gives to equipment. e.g. Maple Bow. Oak Bow.
			{
				[1] = "カエデ",
				[2] = "カシ",
				[3] = "ブナノキ",
				[4] = "ヒッコリー",
				[5] = "イチイ",
				[6] = "カバノキ",
				[7] = "アッシュ",
				[8] = "マホガニー",
				[9] = "ナイトウッド",
				[10] = "ルビーアッシュ",
			},
			["names"] = --Does not strictly need to be exact, but people would probably appreciate it
			{
				[1] = "上質なカエデ材",
				[2] = "上質なカシ材",
				[3] = "上質なブナ材",
				[4] = "上質なヒッコリー材",
				[5] = "上質なイチイ材",
				[6] = "上質なカバ材",
				[7] = "上質なアッシュ材",
				[8] = "上質なマホガニー材",
				[9] = "上質なナイトウッド材",
				[10]= "上質なルビーアッシュ材",
			}
		},
		["E"] = 
		{
			["pieces"] = --exact!!
			{
				[2] = "グリフ(スタミナ)",
				[1] = "グリフ(体力)",
				[3] = "グリフ(マジカ)",
			},
			["match"] = --exact!!! The names of glyphs. The prefix (in English) So trifling glyph of magicka, for example
			{
				[1] = "初歩", 
				[2] = "未熟",
				[3] = "不出来",
				[4] = "未完",
				[5] = "一般的",
				[6] = "適正",
				[7] = "中堅",
				[8] = "熟練",
				[9] = "強力",
				[10]= "優秀",
				[11]= "希少",
				[12]= "至高",
				[13]= "伝説",
				[14]= "壮麗",
				[15]= "最上",
				[16]= "真に最上",
			},
		},
	}

	return craftInfo

end


function WritCreater.langOptions() --Sentimental
	local options =  {
		[1] = {
		type = "checkbox",
		name = "生産ウィンドウを表示",
		tooltip = "生産設備が開いたときに生産ウィンドウを表示する",
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
              name = "自動生産",
              tooltip = "これを選択すると生産設備に入った時にアドオンが即時に生産を開始する。ウィンドウが非表示の場合でもこの機能は有効です。",
              getFunc = function() return WritCreater.savedVars.autoCraft end,
              disabled = function() return not WritCreater.savedVars.showWindow end,
              setFunc = function(value) 
              	WritCreater.savedVars.autoCraft = value 
              end,
         },
     		[3] = {
              type = "checkbox",
              name = "鍛冶",
              tooltip = "鍛冶のアドオンをオフにする",
              getFunc = function() return WritCreater.savedVars.Blacksmith end,
              setFunc = function(value) 
              	WritCreater.savedVars.Blacksmith = value 
              end,
         },
     		[4] = {
              type = "checkbox",
              name = "縫製",
              tooltip = "縫製のアドオンをオフにする",
              getFunc = function() return WritCreater.savedVars.Clothier end,
              setFunc = function(value) 
              	WritCreater.savedVars.Clothier = value 
              end,
         },
     		[5] = {
              type = "checkbox",
              name = "付呪",
              tooltip = "付呪のアドオンをオフにする",
              getFunc = function() return WritCreater.savedVars.Enchanter end,
              setFunc = function(value) 
              	WritCreater.savedVars.Enchanter = value 
              end,
         },
     		[6] = {
              type = "checkbox",
              name = "木工",
              tooltip = "木工のアドオンをオフにする",
              getFunc = function() return WritCreater.savedVars.Woodworker end,
              setFunc = function(value) 
              	WritCreater.savedVars.Woodworker = value 
              end,
         },
         	[7] = {
         	type = "checkbox",
         	name = "令状アイテムを取り込む",
         	tooltip = "令状に必要なアイテム（ニルンルート、ターなど）銀行から取り込みます",
         	getFunc = function() return WritCreater.savedVars.shouldGrab end,
         	setFunc = function(value) WritCreater.savedVars.shouldGrab = value end,
         },
         	[8] = {
         		type = "slider",
         		name = "アイテム取り込み遅延",
         		tooltip = "銀行からアイテムを取り込む前に待機する時間（ミリ秒）",
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
		[1] = "オコ", --health
		[2] = "デニ", --stamina
		[3] = "マッコ", --magicka
	}
	return essenceNames
end

function WritCreater.langPotencyNames() --exact!! Also, these are all the positive runestones - no negatives needed.
	local potencyNames = 
	{
		[1] = "ジョラ", --Lowest potency stone lvl
		[2] = "ポラデ",
		[3] = "ジェラ",
		[4] = "ジェジョラ",
		[5] = "オドラ",
		[6] = "ポジョラ",
		[7] = "エドラ",
		[8] = "ジャエラ",
		[9] = "ポラ",
		[10]= "デナラ",
		[11]= "レラ",
		[12]= "デラド",
		[13]= "レクラ",
		[14]= "クラ",
		[15]= "レジェラ",
		[16]= "レポラ", --v16 potency stone
		
	}
	return potencyNames
end

function WritCreater.langTutorial(i) --sentimental
	local t = {
		[5]="最初に、/dailyreset というコマンドで、毎日の\nサーバのリセットまでの時間を知ることができます。\n最後に、このアドオンは9種類の\n種族（同盟）スタイルの素材のみ使用します。",
		[4]="最後に、それぞれの職業に対してアドオンを活性化\nするか非活性にするかを選択できます。\nデフォルトは全ての生産がオンになっています。\nもし、いくつかをオフにしたい場合、設定を確認してください。\nまた、あなたが知っておくべきことがあります。",
		[3]="次に、生産設備を使用する時にこのウィンドウを\n表示するかどうかを選択する必要があります。\nこのウィンドウでは必要な材料の数と\n現在いくつ持っているかが分かります。",
		[2]="最初の設定は自動生産を使用するかどうかです。\nオンにした時は生産設備に入った時に\nアドオンが自動的に生産を開始します。",
		[1]="Dolgubon's Lazy Writ Crafterへようこそ!\n最初にいくつかの設定を行います。\nこの設定は設定メニューからいつでも変更できます。"
	}
	return t[i]
end

function WritCreater.langTutorialButton(i,onOrOff) --sentimental and short pls
	local tOn = 
	{
		[1]="デフォルトを使用",
		[2]="オン",
		[3]="表示する",
		[4]="続ける",
		[5]="終了する",
	}
	local tOff=
	{
		[1]="続ける",
		[2]="オフ",
		[3]="表示しない",
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
		["original"] = "影の布",
		["corrected"] = "影",
	},
	[2] = 
	{
		["original"] = "先人のシルク",
		["corrected"] = "先人",
	},
	[3] = 
	{
		["original"] = "虚無の鉄",
		["corrected"] = "虚無",
	},
	[4] = 
	{
		["original"] = "業火の杖",
		["corrected"] = "業火",
	},
	[5] = 
	{
		["original"] = "氷の杖",
		["corrected"] = "氷",
	},
	[6] = 
	{
		["original"] = "稲妻の杖",
		["corrected"] = "稲妻",
	},
	[7] = 
	{
		["original"] = "回復の杖",
		["corrected"] = "回復",
	},
	[8] = 
	{
		["original"] = "ルベダイトのヘルム",
		["corrected"] = "ルベダイト",
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
		return "|c2dff00生産には1個の|r ター |c2dff00と1個の |cffcc66"..essence.."|c2dff00 と\n1個の |c0066ff"..potency.."|r|c2dff00 が必要です。" end,
	["runeMissing"] = function (ta,essence,potency)
		if not ta["bag"] then
			if not essence["bag"] then
				if not potency["bag"] then
					return "|cf60000グリフが生産できませんでした。\n|r"..ta["slot"].."|cf60000 と |cffcc66"..essence["slot"].."|cf60000 または |c0066ff"..potency["slot"].."|r|cf60000 を持っていません。"
				else
					return "|cf60000グリフが生産できませんでした。\n|r"..ta["slot"].."|cf60000 または |cffcc66"..essence["slot"].."|r|cf60000 を持っていません。"
				end
			else
				if not potency["bag"] then
					return "|cf60000グリフが生産できませんでした。\n|rター|cf60000 または |c0066ff"..potency["slot"].."|r|cf60000 を持っていません。"
				else
					return "|cf60000グリフが生産できませんでした。\n|rター|cf60000 を持っていません。"
				end
			end
		else
			if not essence["bag"] then
				if not potency["bag"] then
					return "|cf60000グリフが生産できませんでした。\n|cffcc66"..essence["slot"].."|cf60000 または |c0066ff"..potency["slot"].."|r|cf60000 を持っていません。"
				else
					return "|cf60000グリフが生産できませんでした。\n|cffcc66"..essence["slot"].."|r|cf60000 を持っていません。"
				end
			else
				if not potency["bag"] then
					return "|cf60000グリフが生産できませんでした。\n|c0066ff"..potency["slot"].."|r|cf60000 を持っていません。"
				end
			end
		end
	end,
	["smithingMissing"] = "\n|cf60000十分な材料を持っていません|r",
	["craftAnyway"] = "強制的に作成",
	["smithingEnough"] = "\n|c2dff00十分な材料を持っています|r",
	["craft"] = "|c00ff00作成|r",
	["smithingReqM"] = function(amount, type, more) return "生産には" .. type .. "を" .. amount .. "個使用します\n (|cf60000あと" .. more .. "個必要|r)" end,
	["smithingReqM2"] = function (amount,type,more) return "\n同様に" .. type .. "を" .. amount .. "個使用します\n (|cf60000あと" .. more .. "個必要|r)" end,
	["smithingReq"] = function (amount,type, current) return "生産には" .. type .. "を" .. amount .. "個使用します\n (|c2dff00現在" .. current .. "個使用可能|r)" end,
	["smithingReq2"] = function (amount,type, current) return "\n同様に" .. type .. "を" .. amount .."個使用します\n (|c2dff00現在" .. current .. "個使用可能|r)" end,
	["crafting"] = "|c00ff00作成中...|r",
	["craftIncomplete"] = "|cf60000生産が完全に終わりませんでした。\nさらに材料が必要です。|r",
	["moreStyle"] = "|cf60000使用可能な9種類の基本種族（帝国は含まない）の\nスタイル素材がありません|r",
	["dailyreset"] = function (till)
		if till["hour"]==0 then
			if till["minute"]==1 then
				d("毎日のサーバーリセットまであと1分です！")
			elseif till["minute"]==0 then
				if stamp==1 then
					d("毎日のリセットまであと"..stamp.."秒！")
				else
					d("真剣に... 問い合わせをやめてください。あなたはせっかちですね！")
				end
			else
				d("毎日のリセットまであと" .. till["minute"] .."分！")
			end
		else
			d("毎日のリセットまであと" .. till["hour"].."時間".. till["minute"] .."分")
		end 
	end,
	["complete"] = "|c00FF00令状完了|r",
	["craftingstopped"] = "生産を中止しました。アドオンが正しいアイテムを生産しているかチェックしてください",
}
return strings

end


function WritCreater.getTaString()
	return "ター"
end

WritCreater.lang = "jp"
