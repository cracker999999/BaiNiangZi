module(...)
--auto generate data
DATA={
	[1]={color=0,desc=[[]],icon=0,name=[[测试]],trans=1,},
	[101]={
		color=1,
		desc=[[物防、法防下降]],
		icon=51104,
		name=[[横扫千军]],
		trans=1,
	},
	[103]={
		color=0,
		desc=[[死亡5回合自动复活，不受异常状态影响]],
		icon=51304,
		name=[[魂兮归来]],
		trans=2,
	},
	[105]={
		color=0,
		desc=[[休息]],
		icon=51107,
		name=[[万剑归一]],
		trans=3,
	},
	[111]={
		color=0,
		desc=[[受到伤害降低]],
		icon=51206,
		name=[[金刚护体]],
		trans=3,
	},
	[112]={
		color=1,
		desc=[[物防下降]],
		icon=51602,
		name=[[卸甲]],
		trans=1,
	},
	[113]={
		color=0,
		desc=[[封印普攻和技能]],
		icon=51603,
		name=[[震慑]],
		trans=2,
	},
	[114]={
		color=0,
		desc=[[回复气血]],
		icon=51202,
		name=[[推气过宫]],
		trans=1,
	},
	[115]={
		color=0,
		desc=[[连击,伤害降低]],
		icon=51605,
		name=[[战神]],
		trans=2,
	},
	[116]={
		color=1,
		desc=[[封印法术、降低双防]],
		icon=51502,
		name=[[失心符]],
		trans=2,
	},
	[117]={
		color=1,
		desc=[[混乱]],
		icon=51503,
		name=[[离魂符]],
		trans=1,
	},
	[119]={
		color=1,
		desc=[[封印物法]],
		icon=50033,
		name=[[催眠符]],
		trans=2,
	},
	[120]={
		color=1,
		desc=[[封印命中降低]],
		icon=50033,
		name=[[催眠符]],
		trans=1,
	},
	[121]={
		color=1,
		desc=[[封印物法]],
		icon=51507,
		name=[[禁断万古]],
		trans=3,
	},
	[122]={color=1,desc=[[休息]],icon=50149,name=[[休息]],trans=3,},
	[123]={
		color=1,
		desc=[[中毒]],
		icon=51403,
		name=[[木灵蚀心]],
		trans=2,
	},
	[124]={
		color=0,
		desc=[[提高攻击和治疗]],
		icon=51404,
		name=[[神威]],
		trans=1,
	},
	[125]={
		color=1,
		desc=[[物防下降]],
		icon=51405,
		name=[[天雷蚀甲]],
		trans=1,
	},
	[127]={
		color=0,
		desc=[[免疫死亡]],
		icon=51407,
		name=[[天神法相]],
		trans=3,
	},
	[129]={
		color=0,
		desc=[[物防上升]],
		icon=51402,
		name=[[杏黄旗]],
		trans=1,
	},
	[130]={color=0,desc=[[隐身]],icon=50150,name=[[隐身]],trans=1,},
	[131]={
		color=0,
		desc=[[发现隐形单位]],
		icon=50004,
		name=[[感知]],
		trans=1,
	},
	[132]={color=0,desc=[[隐身]],icon=51106,name=[[剑遁]],trans=1,},
	[133]={
		color=1,
		desc=[[物理攻击偏差]],
		icon=51305,
		name=[[星灵禁锢]],
		trans=3,
	},
	[134]={
		color=0,
		desc=[[受到伤害增加]],
		icon=51103,
		name=[[斗剑]],
		trans=1,
	},
	[135]={
		color=0,
		desc=[[受到斗剑者的伤害提高]],
		icon=51103,
		name=[[被斗剑]],
		trans=1,
	},
	[136]={
		color=0,
		desc=[[回复法力]],
		icon=51406,
		name=[[仙气灌顶]],
		trans=1,
	},
	[137]={
		color=1,
		desc=[[降低速度]],
		icon=50020,
		name=[[降低速度]],
		trans=1,
	},
	[138]={
		color=1,
		desc=[[物防、法防大量降低]],
		icon=51207,
		name=[[舍生取义]],
		trans=1,
	},
	[139]={
		color=1,
		desc=[[抗药性]],
		icon=50005,
		name=[[抗药性]],
		trans=1,
	},
	[140]={color=1,desc=[[]],icon=50047,name=[[降低攻击]],trans=1,},
	[141]={color=0,desc=[[]],icon=50021,name=[[提升攻击]],trans=1,},
	[142]={color=0,desc=[[]],icon=50118,name=[[提升速度]],trans=1,},
	[143]={color=0,desc=[[]],icon=50136,name=[[提升防御]],trans=1,},
	[144]={
		color=1,
		desc=[[持续减少气血]],
		icon=50131,
		name=[[中毒]],
		trans=2,
	},
	[145]={color=1,desc=[[]],icon=50240,name=[[降低防御]],trans=1,},
	[146]={
		color=0,
		desc=[[攻击力上升]],
		icon=50152,
		name=[[提升伤害]],
		trans=1,
	},
	[147]={
		color=1,
		desc=[[昏睡,无法行动]],
		icon=50149,
		name=[[昏睡]],
		trans=3,
	},
	[148]={
		color=0,
		desc=[[攻击该单位会受到伤害]],
		icon=50139,
		name=[[剑棘]],
		trans=3,
	},
	[149]={
		color=1,
		desc=[[持续减少气血]],
		icon=50131,
		name=[[蛇牙击]],
		trans=1,
	},
	[150]={
		color=1,
		desc=[[物防、法防下降]],
		icon=50051,
		name=[[蛇毒]],
		trans=1,
	},
	[151]={
		color=1,
		desc=[[持续减少气血]],
		icon=50251,
		name=[[灼烧]],
		trans=1,
	},
	[152]={
		color=0,
		desc=[[攻击该单位会受到伤害]],
		icon=50241,
		name=[[炎盾]],
		trans=1,
	},
	[153]={
		color=0,
		desc=[[回合结束攻击一个目标]],
		icon=50221,
		name=[[剑令]],
		trans=1,
	},
	[154]={
		color=0,
		desc=[[攻击防御上升]],
		icon=51605,
		name=[[妖皇之怒]],
		trans=1,
	},
	[155]={
		color=0,
		desc=[[气血暴击上升]],
		icon=51605,
		name=[[妖皇降临]],
		trans=1,
	},
	[156]={
		color=0,
		desc=[[暴击上升]],
		icon=50232,
		name=[[狂暴]],
		trans=1,
	},
	[158]={
		color=1,
		desc=[[物防降低]],
		icon=51104,
		name=[[横扫千军]],
		trans=1,
	},
	[159]={
		color=1,
		desc=[[物防、法防下降]],
		icon=50020,
		name=[[剑破流云]],
		trans=3,
	},
	[160]={
		color=1,
		desc=[[封印普攻和技能]],
		icon=51502,
		name=[[失心符]],
		trans=1,
	},
	[161]={color=1,desc=[[中毒]],icon=50131,name=[[蜃气]],trans=1,},
	[162]={
		color=0,
		desc=[[持续恢复气血]],
		icon=51203,
		name=[[活血]],
		trans=1,
	},
	[163]={
		color=0,
		desc=[[伤害增加]],
		icon=50232,
		name=[[嗜杀]],
		trans=1,
	},
	[164]={
		color=0,
		desc=[[物攻增加]],
		icon=50232,
		name=[[魔兽之印]],
		trans=1,
	},
	[165]={
		color=1,
		desc=[[物攻降低]],
		icon=50127,
		name=[[放下屠刀]],
		trans=1,
	},
	[166]={color=0,desc=[[隐身]],icon=50146,name=[[隐遁]],trans=1,},
	[167]={
		color=1,
		desc=[[封印普攻和技能]],
		icon=51502,
		name=[[失心符]],
		trans=1,
	},
	[168]={
		color=0,
		desc=[[法攻降低]],
		icon=50115,
		name=[[法力削弱]],
		trans=1,
	},
	[169]={
		color=0,
		desc=[[减益效果概率降低]],
		icon=50245,
		name=[[剑魔]],
		trans=1,
	},
	[170]={
		color=0,
		desc=[[只能攻击攻击者]],
		icon=51104,
		name=[[霸剑诀]],
		trans=1,
	},
	[171]={
		color=0,
		desc=[[受到伤害大幅度降低]],
		icon=50006,
		name=[[魔之气]],
		trans=2,
	},
	[172]={
		color=0,
		desc=[[受到伤害大幅度降低]],
		icon=50026,
		name=[[天佛降世]],
		trans=1,
	},
	[173]={
		color=0,
		desc=[[无法被攻击]],
		icon=50229,
		name=[[无敌]],
		trans=1,
	},
	[174]={
		color=1,
		desc=[[受到伤害大幅度增加]],
		icon=50201,
		name=[[易伤]],
		trans=1,
	},
	[175]={
		color=0,
		desc=[[增加物攻]],
		icon=50002,
		name=[[野兽之力]],
		trans=1,
	},
	[176]={
		color=0,
		desc=[[感化点数显示]],
		icon=50002,
		name=[[感化]],
		trans=1,
	},
	[177]={
		color=0,
		desc=[[点化点数显示]],
		icon=50002,
		name=[[点化]],
		trans=1,
	},
	[178]={
		color=0,
		desc=[[增加物防]],
		icon=50002,
		name=[[光辉之甲]],
		trans=2,
	},
	[179]={
		color=0,
		desc=[[增加物防]],
		icon=50002,
		name=[[圣灵之甲]],
		trans=2,
	},
	[180]={
		color=0,
		desc=[[增加速度]],
		icon=50002,
		name=[[流云诀]],
		trans=3,
	},
	[181]={
		color=0,
		desc=[[增加速度]],
		icon=50002,
		name=[[啸风诀]],
		trans=3,
	},
	[182]={
		color=0,
		desc=[[反震伤害]],
		icon=50002,
		name=[[修罗咒]],
		trans=2,
	},
	[183]={
		color=1,
		desc=[[减少物攻]],
		icon=50002,
		name=[[河东狮吼]],
		trans=2,
	},
	[184]={
		color=1,
		desc=[[减少物防]],
		icon=50002,
		name=[[破甲术]],
		trans=2,
	},
	[185]={
		color=1,
		desc=[[减少物防]],
		icon=50002,
		name=[[碎甲术]],
		trans=2,
	},
	[186]={
		color=1,
		desc=[[减少速度]],
		icon=50002,
		name=[[凝滞术]],
		trans=3,
	},
	[187]={
		color=1,
		desc=[[减少速度]],
		icon=50002,
		name=[[停陷术]],
		trans=3,
	},
	[188]={
		color=0,
		desc=[[抵抗所有buff]],
		icon=50002,
		name=[[心如明镜]],
		trans=3,
	},
	[189]={
		color=0,
		desc=[[伤害增加]],
		icon=50002,
		name=[[御灵]],
		trans=2,
	},
	[190]={
		color=0,
		desc=[[有辅助职业存在则逃离战斗]],
		icon=51502,
		name=[[逃避]],
		trans=3,
	},
	[191]={color=1,desc=[[流血]],icon=51502,name=[[掉血]],trans=1,},
	[192]={color=0,desc=[[]],icon=51502,name=[[鬼魂术]],trans=2,},
	[193]={
		color=0,
		desc=[[造成伤害提高]],
		icon=50052,
		name=[[猛击]],
		trans=1,
	},
	[194]={
		color=1,
		desc=[[物防降低]],
		icon=51602,
		name=[[腐蚀术]],
		trans=1,
	},
	[195]={
		color=1,
		desc=[[受到伤害减少]],
		icon=51402,
		name=[[装死]],
		trans=3,
	},
	[196]={
		color=1,
		desc=[[受到伤害减少]],
		icon=50149,
		name=[[止痛药]],
		trans=2,
	},
	[197]={
		color=0,
		desc=[[法术闪避提高]],
		icon=50146,
		name=[[翩鸿一击]],
		trans=3,
	},
	[198]={
		color=0,
		desc=[[暴击提高,溅射]],
		icon=50252,
		name=[[后发制人]],
		trans=1,
	},
	[199]={color=1,desc=[[中毒]],icon=50131,name=[[巫蛊]],trans=2,},
	[200]={
		color=1,
		desc=[[物攻下降]],
		icon=51602,
		name=[[蚀骨]],
		trans=3,
	},
	[201]={
		color=0,
		desc=[[物防下降]],
		icon=51602,
		name=[[护主]],
		trans=1,
	},
	[202]={
		color=1,
		desc=[[强制攻击固定目标]],
		icon=50245,
		name=[[嘲讽]],
		trans=3,
	},
	[203]={
		color=1,
		desc=[[受到伤害降低]],
		icon=51402,
		name=[[防御]],
		trans=3,
	},
	[204]={
		color=1,
		desc=[[物防大幅下降]],
		icon=51602,
		name=[[压制]],
		trans=3,
	},
	[205]={
		color=1,
		desc=[[伤害大幅降低]],
		icon=51605,
		name=[[心魔蚀心]],
		trans=3,
	},
	[206]={
		color=1,
		desc=[[持续掉血]],
		icon=50131,
		name=[[灼烧]],
		trans=3,
	},
	[207]={
		color=0,
		desc=[[攻击提高]],
		icon=51404,
		name=[[反击]],
		trans=3,
	},
	[208]={
		color=1,
		desc=[[持续掉血]],
		icon=50131,
		name=[[箭芒]],
		trans=3,
	},
	[209]={color=1,desc=[[眩晕]],icon=50102,name=[[眩晕]],trans=3,},
	[210]={
		color=0,
		desc=[[攻击提高]],
		icon=51404,
		name=[[剑意]],
		trans=3,
	},
	[211]={
		color=0,
		desc=[[转移伤害]],
		icon=51403,
		name=[[伤害转移]],
		trans=3,
	},
	[212]={
		color=1,
		desc=[[攻击、防御降低]],
		icon=51605,
		name=[[懦弱]],
		trans=3,
	},
	[213]={color=1,desc=[[混乱]],icon=50102,name=[[无能]],trans=3,},
	[214]={color=1,desc=[[中毒]],icon=50131,name=[[中毒]],trans=3,},
	[215]={
		color=0,
		desc=[[特殊状态]],
		icon=50129,
		name=[[失聪]],
		trans=3,
	},
	[216]={
		color=0,
		desc=[[特殊状态]],
		icon=50132,
		name=[[失明]],
		trans=3,
	},
	[217]={
		color=0,
		desc=[[特殊状态]],
		icon=50135,
		name=[[体衰]],
		trans=3,
	},
	[218]={
		color=0,
		desc=[[特殊状态]],
		icon=50145,
		name=[[失语]],
		trans=3,
	},
	[219]={
		color=0,
		desc=[[特殊状态]],
		icon=50149,
		name=[[失闻]],
		trans=3,
	},
	[220]={
		color=0,
		desc=[[攻击提高]],
		icon=50131,
		name=[[仇恨]],
		trans=3,
	},
	[221]={
		color=0,
		desc=[[攻击提高]],
		icon=50131,
		name=[[仇恨]],
		trans=3,
	},
	[222]={
		color=1,
		desc=[[不能复活]],
		icon=50131,
		name=[[禁止复活]],
		trans=3,
	},
	[223]={
		color=0,
		desc=[[攻击提升]],
		icon=50131,
		name=[[星宿之力]],
		trans=3,
	},
	[224]={
		color=0,
		desc=[[回复气血]],
		icon=51202,
		name=[[星宿之息]],
		trans=1,
	},
	[225]={
		color=0,
		desc=[[增加防御]],
		icon=50131,
		name=[[星宿之御]],
		trans=2,
	},
	[226]={
		color=0,
		desc=[[暴击大幅增加]],
		icon=50131,
		name=[[星宿之怒]],
		trans=3,
	},
	[227]={
		color=0,
		desc=[[伤害增加]],
		icon=50232,
		name=[[气势]],
		trans=1,
	},
	[228]={
		color=0,
		desc=[[伤害增加]],
		icon=50232,
		name=[[震慑]],
		trans=1,
	},
	[229]={
		color=0,
		desc=[[物防、法防下降]],
		icon=50051,
		name=[[蚀甲]],
		trans=1,
	},
	[230]={
		color=0,
		desc=[[降低速度]],
		icon=50020,
		name=[[流沙]],
		trans=1,
	},
	[231]={
		color=0,
		desc=[[特殊状态]],
		icon=50020,
		name=[[同甘共苦]],
		trans=1,
	},
	[232]={
		color=0,
		desc=[[暴击大幅增加]],
		icon=50131,
		name=[[狂怒]],
		trans=3,
	},
	[233]={
		color=0,
		desc=[[伤害加深]],
		icon=50201,
		name=[[重伤]],
		trans=3,
	},
	[234]={
		color=0,
		desc=[[增加愤怒]],
		icon=50102,
		name=[[战神附体]],
		trans=3,
	},
	[235]={
		color=0,
		desc=[[减少愤怒]],
		icon=50102,
		name=[[恶魔诅咒]],
		trans=3,
	},
	[236]={
		color=0,
		desc=[[增加法术攻击]],
		icon=50102,
		name=[[法术强化]],
		trans=3,
	},
	[237]={
		color=0,
		desc=[[增加物理攻击]],
		icon=50102,
		name=[[攻击强化]],
		trans=3,
	},
	[238]={
		color=0,
		desc=[[物理免疫]],
		icon=50131,
		name=[[物理免疫]],
		trans=3,
	},
	[239]={
		color=0,
		desc=[[法术免疫]],
		icon=50131,
		name=[[法术免疫]],
		trans=3,
	},
	[240]={
		color=0,
		desc=[[超级隐身]],
		icon=50150,
		name=[[超级隐身]],
		trans=1,
	},
	[241]={
		color=0,
		desc=[[受到伤害降低]],
		icon=50102,
		name=[[抵抗]],
		trans=3,
	},
	[242]={
		color=0,
		desc=[[法力消耗降低]],
		icon=50102,
		name=[[冥想]],
		trans=3,
	},
	[243]={
		color=1,
		desc=[[增加物防]],
		icon=50002,
		name=[[增加物防]],
		trans=2,
	},
	[244]={
		color=0,
		desc=[[伤害降低，受伤害增加]],
		icon=50002,
		name=[[走火入魔]],
		trans=2,
	},
	[245]={
		color=0,
		desc=[[增加攻击力]],
		icon=50002,
		name=[[剑斩灵魂]],
		trans=2,
	},
	[246]={
		color=0,
		desc=[[降低物理防御]],
		icon=50002,
		name=[[碎甲]],
		trans=2,
	},
	[247]={
		color=0,
		desc=[[降低防御力]],
		icon=50002,
		name=[[破甲击]],
		trans=2,
	},
	[248]={
		color=0,
		desc=[[降低双防御]],
		icon=50002,
		name=[[破法]],
		trans=2,
	},
	[249]={color=0,desc=[[复活]],icon=50002,name=[[涅槃]],trans=2,},
}
