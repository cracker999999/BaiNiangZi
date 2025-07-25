module(...)
--auto generate data
VIRTUAL={
	[1001]={
		description=[[#gamename中广泛使用的交易货币]],
		gainWayIdStr={[1]=19,[2]=29,},
		icon=10002,
		id=1001,
		introduction=[[购买交易中心的道具]],
		isShowInBag=[[]],
		name=[[金币]],
		quality=4,
		shop_npctype=0,
	},
	[1002]={
		description=[[#gamename中广泛使用的基础货币]],
		gainWayIdStr={[1]=19,[2]=40,[3]=20,},
		icon=10003,
		id=1002,
		introduction=[[购买摆摊道具和学习技能]],
		isShowInBag=[[]],
		name=[[银币]],
		quality=2,
		shop_npctype=0,
	},
	[1003]={
		description=[[通过充值获得的珍贵货币]],
		gainWayIdStr={},
		icon=10001,
		id=1003,
		introduction=[[用于购买商城道具和兑换金币、银币]],
		isShowInBag=[[]],
		name=[[仙玉]],
		quality=4,
		shop_npctype=0,
	},
	[1004]={
		description=[[系统赠送获得的珍贵货币]],
		gainWayIdStr={},
		icon=10221,
		id=1004,
		introduction=[[用于购买商城道具和兑换金币、银币]],
		isShowInBag=[[]],
		name=[[绑定仙玉]],
		quality=4,
		shop_npctype=0,
	},
	[1005]={
		description=[[人物经验]],
		gainWayIdStr={},
		icon=10004,
		id=1005,
		introduction=[[角色升级所需]],
		isShowInBag=[[]],
		name=[[人物经验]],
		quality=2,
		shop_npctype=0,
	},
	[1006]={
		description=[[人物储备经验]],
		gainWayIdStr={},
		icon=10004,
		id=1006,
		introduction=[[完成任务时可获得部分储备经验]],
		isShowInBag=[[]],
		name=[[储备经验]],
		quality=2,
		shop_npctype=0,
	},
	[1007]={
		description=[[宠物经验]],
		gainWayIdStr={},
		icon=10016,
		id=1007,
		introduction=[[宠物升级所需]],
		isShowInBag=[[]],
		name=[[宠物经验]],
		quality=2,
		shop_npctype=0,
	},
	[1008]={
		description=[[帮派贡献，多用于学习帮派技能]],
		gainWayIdStr={[1]=49,[2]=50,[3]=53,[4]=54,},
		icon=10209,
		id=1008,
		introduction=[[可用于学习帮派技能]],
		isShowInBag=[[]],
		name=[[帮贡]],
		quality=2,
		shop_npctype=0,
	},
	[1009]={
		description=[[竞技场非货币积分]],
		gainWayIdStr={},
		icon=10016,
		id=1009,
		introduction=[[可兑换道具]],
		isShowInBag=[[]],
		name=[[竞技场非货币积分]],
		quality=2,
		shop_npctype=0,
	},
	[1010]={
		description=[[挑战积分]],
		gainWayIdStr={},
		icon=10016,
		id=1010,
		introduction=[[可兑换道具]],
		isShowInBag=[[]],
		name=[[挑战积分]],
		quality=2,
		shop_npctype=0,
	},
	[1011]={
		description=[[人物修炼经验]],
		gainWayIdStr={},
		icon=10251,
		id=1011,
		introduction=[[用于提升主角修炼技能]],
		isShowInBag=[[]],
		name=[[人物修炼]],
		quality=2,
		shop_npctype=0,
	},
	[1012]={
		description=[[伙伴修炼经验]],
		gainWayIdStr={},
		icon=10251,
		id=1012,
		introduction=[[用于提升伙伴修炼技能]],
		isShowInBag=[[]],
		name=[[伙伴修炼]],
		quality=2,
		shop_npctype=0,
	},
	[1013]={
		description=[[武勋]],
		gainWayIdStr={[1]=22,[2]=31,},
		icon=10232,
		id=1013,
		introduction=[[武勋商场购买]],
		isShowInBag=1.0,
		name=[[武勋]],
		quality=2,
		shop_npctype=0,
	},
	[1014]={
		description=[[竞技场积分]],
		gainWayIdStr={},
		icon=10233,
		id=1014,
		introduction=[[竞技场积分商店购买]],
		isShowInBag=1.0,
		name=[[竞技积分]],
		quality=2,
		shop_npctype=0,
	},
	[1020]={
		description=[[招式经验]],
		gainWayIdStr={},
		icon=10268,
		id=1020,
		introduction=[[用于提升技能等级]],
		isShowInBag=[[]],
		name=[[招式经验]],
		quality=2,
		shop_npctype=0,
	},
	[1021]={
		description=[[#gamename中队长带队获得的积分]],
		gainWayIdStr={},
		icon=10237,
		id=1021,
		introduction=[[用于队长积分商店购买道具]],
		isShowInBag=1.0,
		name=[[队长积分]],
		quality=2,
		shop_npctype=0,
	},
	[1022]={
		description=[[#gamename中带新人获得的积分]],
		gainWayIdStr={},
		icon=10238,
		id=1022,
		introduction=[[用于侠义值商店购买道具]],
		isShowInBag=1.0,
		name=[[侠义值]],
		quality=2,
		shop_npctype=0,
	},
	[1023]={
		description=[[坐骑经验]],
		gainWayIdStr={},
		icon=10288,
		id=1023,
		introduction=[[用于坐骑升级]],
		isShowInBag=[[]],
		name=[[坐骑经验]],
		quality=2,
		shop_npctype=0,
	},
	[1024]={
		description=[[通过完成剧情任务获得]],
		gainWayIdStr={},
		icon=10273,
		id=1024,
		introduction=[[用于提升剧情技能等级]],
		isShowInBag=[[]],
		name=[[剧情技能点]],
		quality=2,
		shop_npctype=0,
	},
	[1025]={
		description=[[合成积分]],
		gainWayIdStr={},
		icon=10253,
		id=1025,
		introduction=[[用于队长积分商店购买道具]],
		isShowInBag=1.0,
		name=[[宠物积分]],
		quality=2,
		shop_npctype=0,
	},
	[1026]={
		description=[[活跃度达到一定值时获得]],
		gainWayIdStr={[1]=29,},
		icon=10301,
		id=1026,
		introduction=[[用于世界发言和制作辅助技能产品]],
		isShowInBag=[[]],
		name=[[活力]],
		quality=2,
		shop_npctype=0,
	},
	[1027]={
		description=[[完成特定日常活动获得]],
		gainWayIdStr={},
		icon=10331,
		id=1027,
		introduction=[[用于除魔值商店购买道具]],
		isShowInBag=1.0,
		name=[[除魔值]],
		quality=2,
		shop_npctype=0,
	},
}
