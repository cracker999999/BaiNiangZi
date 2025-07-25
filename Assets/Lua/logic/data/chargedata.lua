module(...)
--auto generate data
DAILY={
	gift_day_1={
		charge_goldcoin_need=200,
		cost=1,
		gift_1=1001,
		gift_2=2001,
		goldcoin_first=10,
		key=[[gift_day_1]],
		payid=[[com.cilu.dhxx.giftbag_1]],
	},
	gift_day_2={
		charge_goldcoin_need=200,
		cost=3,
		gift_1=1002,
		gift_2=2002,
		goldcoin_first=30,
		key=[[gift_day_2]],
		payid=[[com.cilu.dhxx.giftbag_3]],
	},
	gift_day_3={
		charge_goldcoin_need=200,
		cost=6,
		gift_1=1003,
		gift_2=2003,
		goldcoin_first=60,
		key=[[gift_day_3]],
		payid=[[com.cilu.dhxx.giftbag_6]],
	},
	gift_day_all={
		charge_goldcoin_need=200,
		cost=60,
		gift_1=0,
		gift_2=0,
		goldcoin_first=600,
		key=[[gift_day_all]],
		payid=[[com.cilu.dhxx.giftbag_60]],
	},
}

YUANBAO={
	goldcoin_gift_1={
		cost=18,
		days=7,
		goldcoin_after=500,
		goldcoin_first=180,
		key=[[goldcoin_gift_1]],
		payid=[[com.cilu.dhxx.card_18]],
	},
	goldcoin_gift_2={
		cost=30,
		days=30,
		goldcoin_after=800,
		goldcoin_first=300,
		key=[[goldcoin_gift_2]],
		payid=[[com.cilu.dhxx.card_30]],
	},
}

BIGPROFIT={
	grade_gift1_0={
		goldcoin=680,
		grade=0,
		key=[[grade_gift1_0]],
		payid=[[com.cilu.dhxx.grow_68]],
	},
	grade_gift1_30={goldcoin=1000,grade=30,key=[[grade_gift1_30]],payid=[[]],},
	grade_gift1_35={goldcoin=1500,grade=35,key=[[grade_gift1_35]],payid=[[]],},
	grade_gift1_40={goldcoin=2000,grade=40,key=[[grade_gift1_40]],payid=[[]],},
	grade_gift1_45={goldcoin=2500,grade=45,key=[[grade_gift1_45]],payid=[[]],},
	grade_gift1_50={goldcoin=3000,grade=50,key=[[grade_gift1_50]],payid=[[]],},
	grade_gift1_55={goldcoin=3500,grade=55,key=[[grade_gift1_55]],payid=[[]],},
	grade_gift1_60={goldcoin=4000,grade=60,key=[[grade_gift1_60]],payid=[[]],},
	grade_gift2_0={
		goldcoin=980,
		grade=0,
		key=[[grade_gift2_0]],
		payid=[[com.cilu.dhxx.grow_98]],
	},
	grade_gift2_63={goldcoin=4500,grade=63,key=[[grade_gift2_63]],payid=[[]],},
	grade_gift2_66={goldcoin=5000,grade=66,key=[[grade_gift2_66]],payid=[[]],},
	grade_gift2_68={goldcoin=5500,grade=68,key=[[grade_gift2_68]],payid=[[]],},
	grade_gift2_70={goldcoin=6000,grade=69,key=[[grade_gift2_70]],payid=[[]],},
}

TEXT={
	[1001]={
		choose={},
		content=[[系统暂未开放]],
		id=1001,
		seconds=0.0,
		type=1003,
	},
	[1002]={
		choose={},
		content=[[还未进行充值]],
		id=1002,
		seconds=0.0,
		type=1003,
	},
	[1003]={
		choose={},
		content=[[你已领取了充值奖励]],
		id=1003,
		seconds=0.0,
		type=1003,
	},
	[1004]={
		choose={},
		content=[[玩家等级不足#grade]],
		id=1004,
		seconds=0.0,
		type=1003,
	},
	[1005]={
		choose={},
		content=[[第二天凌晨5点后生效]],
		id=1005,
		seconds=0.0,
		type=1003,
	},
	[1006]={
		choose={},
		content=[[您的每日礼包已发放到背包]],
		id=1006,
		seconds=0.0,
		type=1003,
	},
	[1007]={
		choose={},
		content=[[累计充值达到#amount#cur_1才可购买]],
		id=1007,
		seconds=0.0,
		type=1003,
	},
}
