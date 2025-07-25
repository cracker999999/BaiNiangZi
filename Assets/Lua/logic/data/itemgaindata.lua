module(...)
--auto generate data
CONFIG={
	[1]={
		gaindesc=[[招式技能]],
		go={sysname=[[技能]],tabname=[[主动技能]],},
		icon=[[h7_jineng_1]],
		id=1,
		open_sys=[[SKILL_ZD]],
		openid=0,
		opentype=4,
		tip=[[20级开启辅助技能]],
	},
	[2]={
		gaindesc=[[帮派技能]],
		go={sysname=[[技能]],tabname=[[帮派技能]],},
		icon=[[h7_jineng_1]],
		id=2,
		open_sys=[[ORG_SKILL]],
		openid=0,
		opentype=4,
		tip=[[32级开启帮派技能]],
	},
	[3]={
		gaindesc=[[商城]],
		go={sysname=[[商城]],tabname=[[商店]],},
		icon=[[h7_shangcheng_1]],
		id=3,
		open_sys=[[SHOP]],
		openid=0,
		opentype=4,
		tip=[[]],
	},
	[4]={
		gaindesc=[[积分商店]],
		go={sysname=[[商城]],tabname=[[积分]],},
		icon=[[h7_shangcheng_1]],
		id=4,
		open_sys=[[SHOP]],
		openid=0,
		opentype=4,
		tip=[[]],
	},
	[5]={
		gaindesc=[[摆摊]],
		go={sysname=[[交易所]],tabname=[[摆摊]],},
		icon=[[h7_jiaoyi_1]],
		id=5,
		open_sys=[[BAITAN]],
		openid=0,
		opentype=4,
		tip=[[]],
	},
	[6]={
		gaindesc=[[商会]],
		go={sysname=[[交易所]],tabname=[[商会]],},
		icon=[[h7_jiaoyi_1]],
		id=6,
		open_sys=[[SHANGHUI]],
		openid=0,
		opentype=4,
		tip=[[]],
	},
	[7]={
		gaindesc=[[拍卖行]],
		go={sysname=[[交易所]],tabname=[[拍卖行]],},
		icon=[[h7_jiaoyi_1]],
		id=7,
		open_sys=[[AUCTION]],
		openid=0,
		opentype=4,
		tip=[[40级开启拍卖行]],
	},
	[8]={
		gaindesc=[[竞技场]],
		go={sysname=[[竞技场]],tabname=[[竞技]],},
		icon=[[h7_jingjichang_1]],
		id=8,
		open_sys=[[JJC_SYS]],
		openid=0,
		opentype=4,
		tip=[[38级开启竞技场]],
	},
	[9]={
		gaindesc=[[npc药店]],
		go={},
		icon=[[h7_duanzao]],
		id=9,
		open_sys=[[SHOP]],
		openid=5002,
		opentype=1,
		tip=[[]],
	},
	[10]={
		gaindesc=[[武器商人]],
		go={},
		icon=[[h7_duanzao]],
		id=10,
		open_sys=[[SHOP]],
		openid=5002,
		opentype=1,
		tip=[[]],
	},
	[11]={
		gaindesc=[[封妖]],
		go={sysname=[[日程]],},
		icon=[[h7_huodong_1]],
		id=11,
		open_sys=[[FENGYAO]],
		openid=1003,
		opentype=4,
		tip=[[28级开启封妖]],
	},
	[12]={
		gaindesc=[[妖王]],
		go={sysname=[[日程]],},
		icon=[[h7_huodong_1]],
		id=12,
		open_sys=[[YAOWANG]],
		openid=1014,
		opentype=4,
		tip=[[45级开启妖王]],
	},
	[13]={
		gaindesc=[[地煞星]],
		go={sysname=[[日程]],},
		icon=[[h7_huodong_1]],
		id=13,
		open_sys=[[TIANMO]],
		openid=1009,
		opentype=4,
		tip=[[50级开启地煞星]],
	},
	[14]={
		gaindesc=[[雷峰塔副本]],
		go={sysname=[[日程]],},
		icon=[[h7_huodong_1]],
		id=14,
		open_sys=[[FUMO]],
		openid=5257,
		opentype=1,
		tip=[[40级开启雷峰塔伏魔]],
	},
	[15]={
		gaindesc=[[化生寺副本]],
		go={sysname=[[日程]],},
		icon=[[h7_huodong_1]],
		id=15,
		open_sys=[[JINGSAN]],
		openid=5257,
		opentype=1,
		tip=[[60级开启化生寺封妖]],
	},
	[16]={
		gaindesc=[[店小二-兑换]],
		go={},
		icon=[[h7_huodong_1]],
		id=16,
		open_sys=[[BAOTASK]],
		openid=5227,
		opentype=1,
		tip=[[]],
	},
	[17]={
		gaindesc=[[三界历练]],
		go={},
		icon=[[h7_renwu]],
		id=17,
		open_sys=[[TASKCHAIN]],
		openid=4,
		opentype=3,
		tip=[[55级开启三界历练]],
	},
	[18]={
		gaindesc=[[异宝收集]],
		go={sysname=[[日程]],},
		icon=[[h7_huodong_1]],
		id=18,
		open_sys=[[YIBAO]],
		openid=1015,
		opentype=4,
		tip=[[45级开启异宝收集]],
	},
	[19]={
		gaindesc=[[门派修行]],
		go={},
		icon=[[h7_renwu]],
		id=19,
		open_sys=[[SHIMEN]],
		openid=4,
		opentype=3,
		tip=[[20级开启门派修行]],
	},
	[20]={
		gaindesc=[[捉鬼任务]],
		go={},
		icon=[[h7_renwu]],
		id=20,
		open_sys=[[ZHUAGUI]],
		openid=5234,
		opentype=3,
		tip=[[25级开启捉鬼任务]],
	},
	[21]={
		gaindesc=[[商城]],
		go={sysname=[[商城]],tabname=[[商店]],},
		icon=[[h7_shangcheng_1]],
		id=21,
		open_sys=[[SHOP]],
		openid=12998,
		opentype=4,
		tip=[[]],
	},
	[22]={
		gaindesc=[[三界斗法]],
		go={sysname=[[日程]],},
		icon=[[h7_huodong_1]],
		id=22,
		open_sys=[[BIWU]],
		openid=1012,
		opentype=4,
		tip=[[40级开启三界斗法]],
	},
	[23]={
		gaindesc=[[物品合成]],
		go={sysname=[[合成]],},
		icon=[[h7_duanzao]],
		id=23,
		open_sys=[[SHOP]],
		openid=1012,
		opentype=4,
		tip=[[]],
	},
	[24]={
		gaindesc=[[物品分解]],
		go={sysname=[[合成]],},
		icon=[[h7_duanzao]],
		id=24,
		open_sys=[[SHOP]],
		openid=2,
		opentype=4,
		tip=[[]],
	},
	[25]={
		gaindesc=[[英雄试炼]],
		go={},
		icon=[[h7_yingxiongshilian]],
		id=25,
		open_sys=[[HEROTRIAL]],
		openid=1027,
		opentype=5,
		tip=[[41级开启英雄试炼]],
	},
	[26]={
		gaindesc=[[藏宝图]],
		go={},
		icon=[[h7_huodong_1]],
		id=26,
		open_sys=[[BAOTU]],
		openid=5227,
		opentype=1,
		tip=[[30级开启藏宝图任务]],
	},
	[27]={
		gaindesc=[[高级藏宝图]],
		go={sysname=[[高级藏宝图]],},
		icon=[[h7_huodong_1]],
		id=27,
		open_sys=[[BAOTASK]],
		openid=5227,
		opentype=1,
		tip=[[]],
	},
	[28]={
		gaindesc=[[珍宝阁]],
		go={sysname=[[帮派]],tabname=[[建筑]],},
		icon=[[h7_bangpai]],
		id=28,
		open_sys=[[ORG_SYS]],
		openid=102,
		opentype=4,
		tip=[[]],
	},
	[29]={
		gaindesc=[[活跃度]],
		go={sysname=[[日程]],},
		icon=[[h7_huodong_1]],
		id=29,
		open_sys=[[SCHEDULE]],
		openid=0,
		opentype=4,
		tip=[[20级开启日程]],
	},
	[30]={
		gaindesc=[[六道传说]],
		go={sysname=[[日程]],},
		icon=[[h7_huodong_1]],
		id=30,
		open_sys=[[JYFUBEN]],
		openid=1010,
		opentype=4,
		tip=[[55级开启六道传说]],
	},
	[31]={
		gaindesc=[[六脉会武]],
		go={sysname=[[日程]],},
		icon=[[h7_huodong_1]],
		id=31,
		open_sys=[[LIUMAI]],
		openid=1012,
		opentype=4,
		tip=[[40级开启六脉会武]],
	},
	[32]={
		gaindesc=[[首充]],
		go={sysname=[[福利]],},
		icon=[[h7_shouchong]],
		id=32,
		open_sys=[[WELFARE]],
		openid=0,
		opentype=4,
		tip=[[]],
	},
	[33]={
		gaindesc=[[全民答题]],
		go={sysname=[[日程]],},
		icon=[[h7_huodong_1]],
		id=33,
		open_sys=[[BAIKE]],
		openid=1021,
		opentype=4,
		tip=[[30级开启全民答题]],
	},
	[34]={
		gaindesc=[[充值返利]],
		go={sysname=[[商城]],tabname=[[充值]],},
		icon=[[h7_huodong_1]],
		id=34,
		open_sys=[[WELFARE_REBATE]],
		openid=2,
		opentype=4,
		tip=[[]],
	},
	[35]={
		gaindesc=[[帮派竞赛]],
		go={},
		icon=[[h7_huodong_1]],
		id=35,
		open_sys=[[ORGWAR]],
		openid=5283,
		opentype=1,
		tip=[[30级开启帮派竞赛]],
	},
	[36]={
		gaindesc=[[活力]],
		go={sysname=[[活力使用]],},
		icon=[[h7_huodong_1]],
		id=36,
		open_sys=[[SCHEDULE]],
		openid=0,
		opentype=4,
		tip=[[]],
	},
	[37]={
		gaindesc=[[武器商店]],
		go={sysname=[[武器商店]],},
		icon=[[h7_shangcheng_1]],
		id=37,
		open_sys=[[STORE_SYS_202]],
		openid=0,
		opentype=4,
		tip=[[]],
	},
	[38]={
		gaindesc=[[防具商店]],
		go={sysname=[[防具商店]],},
		icon=[[h7_shangcheng_1]],
		id=38,
		open_sys=[[STORE_SYS_201]],
		openid=0,
		opentype=4,
		tip=[[]],
	},
	[39]={
		gaindesc=[[药店]],
		go={sysname=[[药店]],},
		icon=[[h7_shangcheng_1]],
		id=39,
		open_sys=[[STORE_SYS_203]],
		openid=0,
		opentype=4,
		tip=[[]],
	},
	[40]={
		gaindesc=[[火眼金睛]],
		go={},
		icon=[[h7_huodong_1]],
		id=40,
		open_sys=[[GUESSGAME]],
		openid=5284,
		opentype=3,
		tip=[[46级开启火眼金睛]],
	},
	[41]={
		gaindesc=[[装备打造]],
		go={sysname=[[打造]],tabname=[[打造]],},
		icon=[[h7_duanzao]],
		id=41,
		open_sys=[[EQUIP_DZ]],
		openid=0,
		opentype=4,
		tip=[[30级开启装备打造]],
	},
	[42]={
		gaindesc=[[商城限购]],
		go={sysname=[[商城]],tabname=[[商店]],},
		icon=[[h7_shangcheng_1]],
		id=42,
		open_sys=[[SHOP]],
		openid=11167,
		opentype=4,
		tip=[[]],
	},
	[43]={
		gaindesc=[[辅助技能]],
		go={sysname=[[技能]],tabname=[[帮派技能]],},
		icon=[[]],
		id=43,
		open_sys=[[ORG_SKILL]],
		openid=4105,
		opentype=4,
		tip=[[32级开启辅助技能]],
	},
	[44]={
		gaindesc=[[辅助技能]],
		go={sysname=[[技能]],tabname=[[帮派技能]],},
		icon=[[]],
		id=44,
		open_sys=[[ORG_SKILL]],
		openid=4106,
		opentype=4,
		tip=[[32级开启辅助技能]],
	},
	[45]={
		gaindesc=[[福缘宝箱]],
		go={sysname=[[商城]],tabname=[[商店]],},
		icon=[[h7_shangcheng_1]],
		id=45,
		open_sys=[[SHOP]],
		openid=-11190,
		opentype=4,
		tip=[[30级开启福缘宝箱]],
	},
	[46]={
		gaindesc=[[九州争霸]],
		go={sysname=[[日程]],},
		icon=[[h7_huodong_1]],
		id=46,
		open_sys=[[THREEBIWU]],
		openid=1034,
		opentype=4,
		tip=[[40级开启九州争霸]],
	},
	[47]={
		gaindesc=[[门派试炼]],
		go={sysname=[[日程]],},
		icon=[[h7_huodong_1]],
		id=47,
		open_sys=[[SCHOOLPASS]],
		openid=1013,
		opentype=4,
		tip=[[35级开启门派试炼]],
	},
	[48]={
		gaindesc=[[二十八星宿]],
		go={sysname=[[日程]],},
		icon=[[h7_huodong_1]],
		id=48,
		open_sys=[[XINGXIU]],
		openid=1029,
		opentype=4,
		tip=[[40级开启二十八星宿]],
	},
	[49]={
		gaindesc=[[帮派封魔]],
		go={sysname=[[日程]],},
		icon=[[h7_huodong_1]],
		id=49,
		open_sys=[[MENGZHU]],
		openid=1019,
		opentype=4,
		tip=[[35级开启帮派封魔]],
	},
	[50]={
		gaindesc=[[帮派篝火]],
		go={sysname=[[日程]],},
		icon=[[h7_huodong_1]],
		id=50,
		open_sys=[[ORG_CAMPFIRE]],
		openid=1018,
		opentype=4,
		tip=[[13级开启帮派篝火]],
	},
	[51]={
		gaindesc=[[三界历练]],
		go={sysname=[[日程]],},
		icon=[[h7_huodong_1]],
		id=51,
		open_sys=[[RUNRING]],
		openid=1030,
		opentype=4,
		tip=[[55级开启三界历练]],
	},
	[52]={
		gaindesc=[[金玉满堂]],
		go={sysname=[[日程]],},
		icon=[[h7_huodong_1]],
		id=52,
		open_sys=[[MONEYTREE]],
		openid=1020,
		opentype=4,
		tip=[[30级开启金玉满堂]],
	},
	[53]={
		gaindesc=[[帮派内政]],
		go={sysname=[[日程]],},
		icon=[[h7_huodong_1]],
		id=53,
		open_sys=[[ORGTASK]],
		openid=1008,
		opentype=4,
		tip=[[35级开启帮派内政]],
	},
	[54]={
		gaindesc=[[帮派卷宗]],
		go={sysname=[[商城]],tabname=[[商店]],},
		icon=[[h7_shangcheng_1]],
		id=54,
		open_sys=[[SHOP]],
		openid=10015,
		opentype=4,
		tip=[[]],
	},
	[55]={
		gaindesc=[[每日礼包]],
		go={sysname=[[福利]],},
		icon=[[h7_fuli]],
		id=55,
		open_sys=[[GIFT_DAY]],
		openid=0,
		opentype=4,
		tip=[[]],
	},
	[56]={
		gaindesc=[[神秘宝箱]],
		go={sysname=[[神秘宝箱]],},
		icon=[[h7_kaibaoxiang_3]],
		id=56,
		open_sys=[[MYSTICALBOX]],
		openid=0,
		opentype=4,
		tip=[[22级开启]],
	},
	[57]={
		gaindesc=[[聚宝盆]],
		go={sysname=[[聚宝盆]],},
		icon=[[h7_fuli_1]],
		id=57,
		open_sys=[[JUBAOPEN]],
		openid=0,
		opentype=4,
		tip=[[20级开启聚宝盆]],
	},
	[58]={
		gaindesc=[[限时首充]],
		go={sysname=[[福利]],},
		icon=[[h7_fuli_1]],
		id=58,
		open_sys=[[FIRST_PAY]],
		openid=0,
		opentype=4,
		tip=[[]],
	},
	[59]={
		gaindesc=[[镇魔塔]],
		go={sysname=[[日程]],},
		icon=[[h7_huodong_1]],
		id=59,
		open_sys=[[ZHENMO]],
		openid=1040,
		opentype=4,
		tip=[[57级开启镇魔塔]],
	},
	[60]={
		gaindesc=[[乱世魔影]],
		go={sysname=[[日程]],},
		icon=[[h7_huodong_1]],
		id=60,
		open_sys=[[LUANSHIMOYING]],
		openid=1038,
		opentype=4,
		tip=[[60级开启乱世魔影]],
	},
	[61]={
		gaindesc=[[蜀山论道]],
		go={sysname=[[日程]],},
		icon=[[h7_huodong_1]],
		id=61,
		open_sys=[[SINGLEWAR]],
		openid=1039,
		opentype=4,
		tip=[[40级开启蜀山论道]],
	},
	[62]={
		gaindesc=[[科举答题]],
		go={sysname=[[日程]],},
		icon=[[h7_huodong_1]],
		id=62,
		open_sys=[[IMPERIALEXAM]],
		openid=1041,
		opentype=4,
		tip=[[30级开启科举答题]],
	},
	[63]={
		gaindesc=[[第二重首充]],
		go={sysname=[[福利]],},
		icon=[[h7_fuli_1]],
		id=63,
		open_sys=[[FIRST_PAY]],
		openid=2,
		opentype=4,
		tip=[[]],
	},
	[64]={
		gaindesc=[[第三重首充]],
		go={sysname=[[福利]],},
		icon=[[h7_fuli_1]],
		id=64,
		open_sys=[[FIRST_PAY]],
		openid=3,
		opentype=4,
		tip=[[]],
	},
}
