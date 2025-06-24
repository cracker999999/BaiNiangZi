module(...)
GCStep = 1024 -- lua gc step 大小
UnloadAtlasCount = 5 -- 达到次数则释放图集

GcAssetReleaseCnt = 5
CloneCacheMaxSize = 150
ObjectCacheMaxSize = 30

ModelCacheTime = 300
CachedTime = 30
CostPerFrame = 5

-- 是否缓存Asset模式
CacheAssetModel = false

DynamicLevel = 
{
	TaskNpc = 12,
	Npc = 11,
	Player = 10,
}

Config = {
	--View缓存
	--需在OnShowView的时候重置界面
	--需在OnHideView的时候清掉不需要的东西
	--["CMainMenuView"] = {cache_time = 60},
	["CGmMainView"] = {cache_time = 120},
	--Box缓存
	["CGmMainView.m_CloneTabBtn"] = {lv=1001},
	["CGmMainView.m_CloneBtnInfoListBtn"] = {lv=1000},

	-- Fmt
	["UI/War/FormationAlly.prefab"] = {cache_time = 300, lv=20},
	["UI/War/FormationEnemy.prefab"] = {cache_time = 300, lv=20},

	-- Path
	["UI/Hud/NameHud.prefab"] = {lv=9},
	["UI/Hud/BloodHud.prefab"] = {lv=9},
	["UI/Hud/WarriorOrderHud.prefab"] = {lv=19},

	-- 模型
	["Model/Character/1110/Prefabs/model1110.prefab"] = {lv=9},
	["Model/Character/1120/Prefabs/model1120.prefab"] = {lv=9},
	["Model/Character/1210/Prefabs/model1210.prefab"] = {lv=9},
	["Model/Character/1220/Prefabs/model1220.prefab"] = {lv=9},
	["Model/Character/1310/Prefabs/model1310.prefab"] = {lv=9},
	["Model/Character/1320/Prefabs/model1320.prefab"] = {lv=9},
	["Model/Character/1130/Prefabs/model1130.prefab"] = {lv=9},
	["Model/Character/1170/Prefabs/model1170.prefab"] = {lv=9},
	["Model/Character/1230/Prefabs/model1230.prefab"] = {lv=9},
	["Model/Character/1270/Prefabs/model1270.prefab"] = {lv=9},
	["Model/Character/1330/Prefabs/model1330.prefab"] = {lv=9},
	["Model/Character/1370/Prefabs/model1370.prefab"] = {lv=9},
	["Model/Character/1410/Prefabs/model1410.prefab"] = {lv=9},--新添加角色：QQ770239839 ---
	["Model/Character/1420/Prefabs/model1420.prefab"] = {lv=9},--新添加角色：QQ770239839 ---
	["Model/Character/1430/Prefabs/model1430.prefab"] = {lv=9},--新添加角色：QQ770239839 ---
	["Model/Character/1440/Prefabs/model1440.prefab"] = {lv=9},--新添加角色：QQ770239839 ---
	["Model/Character/1510/Prefabs/model1510.prefab"] = {lv=9},--新添加角色：QQ770239839 ---
	["Model/Character/1520/Prefabs/model1520.prefab"] = {lv=9},--新添加角色：QQ770239839 ---
	["Model/Character/1530/Prefabs/model1530.prefab"] = {lv=9},--新添加角色：QQ770239839 ---
	["Model/Character/1540/Prefabs/model1540.prefab"] = {lv=9},--新添加角色：QQ770239839 ---
	["Model/Character/1610/Prefabs/model1610.prefab"] = {lv=9},--新添加角色：QQ770239839 ---
	["Model/Character/1620/Prefabs/model1620.prefab"] = {lv=9},--新添加角色：QQ770239839 ---
	["Model/Character/1630/Prefabs/model1630.prefab"] = {lv=9},--新添加角色：QQ770239839 ---
	["Model/Character/1640/Prefabs/model1640.prefab"] = {lv=9},--新添加角色：QQ770239839 ---

	-- 武器
	["Model/Weapon/1110_1/Prefabs/weapon1110_1.prefab"] = {lv=9},
	["Model/Weapon/1120_1/Prefabs/weapon1120_1.prefab"] = {lv=9},
	["Model/Weapon/1210_1/Prefabs/weapon1210_1.prefab"] = {lv=9},
	["Model/Weapon/1220_1/Prefabs/weapon1220_1.prefab"] = {lv=9},
	["Model/Weapon/1310_1/Prefabs/weapon1310_1.prefab"] = {lv=9},
	["Model/Weapon/1320_1/Prefabs/weapon1320_1.prefab"] = {lv=9},
	["Model/Weapon/1410_1/Prefabs/weapon1410_1.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1420_1/Prefabs/weapon1420_1.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1430_1/Prefabs/weapon1430_1.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1440_1/Prefabs/weapon1440_1.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1510_1/Prefabs/weapon1510_1.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1520_1/Prefabs/weapon1520_1.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1530_1/Prefabs/weapon1530_1.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1540_1/Prefabs/weapon1540_1.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1610_1/Prefabs/weapon1610_1.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1620_1/Prefabs/weapon1620_1.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1630_1/Prefabs/weapon1630_1.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1640_1/Prefabs/weapon1640_1.prefab"] = {lv=9},--新添加角色：QQ770239839

	["Model/Weapon/1110_2/Prefabs/weapon1110_2.prefab"] = {lv=9},
	["Model/Weapon/1120_2/Prefabs/weapon1120_2.prefab"] = {lv=9},
	["Model/Weapon/1210_2/Prefabs/weapon1210_2.prefab"] = {lv=9},
	["Model/Weapon/1220_2/Prefabs/weapon1220_2.prefab"] = {lv=9},
	["Model/Weapon/1310_2/Prefabs/weapon1310_2.prefab"] = {lv=9},
	["Model/Weapon/1320_2/Prefabs/weapon1320_2.prefab"] = {lv=9},
	["Model/Weapon/1410_2/Prefabs/weapon1410_2.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1420_2/Prefabs/weapon1420_2.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1430_2/Prefabs/weapon1430_2.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1440_2/Prefabs/weapon1440_2.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1510_2/Prefabs/weapon1510_2.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1520_2/Prefabs/weapon1520_2.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1530_2/Prefabs/weapon1530_2.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1540_2/Prefabs/weapon1540_2.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1610_2/Prefabs/weapon1610_2.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1620_2/Prefabs/weapon1620_2.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1630_2/Prefabs/weapon1630_2.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1640_2/Prefabs/weapon1640_2.prefab"] = {lv=9},--新添加角色：QQ770239839

	["Model/Weapon/1110_3/Prefabs/weapon1110_3.prefab"] = {lv=9},
	["Model/Weapon/1120_3/Prefabs/weapon1120_3.prefab"] = {lv=9},
	["Model/Weapon/1210_3/Prefabs/weapon1210_3.prefab"] = {lv=9},
	["Model/Weapon/1220_3/Prefabs/weapon1220_3.prefab"] = {lv=9},
	["Model/Weapon/1310_3/Prefabs/weapon1310_3.prefab"] = {lv=9},
	["Model/Weapon/1320_3/Prefabs/weapon1320_3.prefab"] = {lv=9},
	["Model/Weapon/1410_3/Prefabs/weapon1410_3.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1420_3/Prefabs/weapon1420_3.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1430_3/Prefabs/weapon1430_3.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1440_3/Prefabs/weapon1440_3.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1510_3/Prefabs/weapon1510_3.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1520_3/Prefabs/weapon1520_3.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1530_3/Prefabs/weapon1530_3.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1540_3/Prefabs/weapon1540_3.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1610_3/Prefabs/weapon1610_3.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1620_3/Prefabs/weapon1620_3.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1630_3/Prefabs/weapon1630_3.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1640_3/Prefabs/weapon1640_3.prefab"] = {lv=9},--新添加角色：QQ770239839

	["Model/Weapon/1110_4/Prefabs/weapon1110_4.prefab"] = {lv=9},
	["Model/Weapon/1120_4/Prefabs/weapon1120_4.prefab"] = {lv=9},
	["Model/Weapon/1210_4/Prefabs/weapon1210_4.prefab"] = {lv=9},
	["Model/Weapon/1220_4/Prefabs/weapon1220_4.prefab"] = {lv=9},
	["Model/Weapon/1310_4/Prefabs/weapon1310_4.prefab"] = {lv=9},
	["Model/Weapon/1320_4/Prefabs/weapon1320_4.prefab"] = {lv=9},
	["Model/Weapon/1410_4/Prefabs/weapon1410_4.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1420_4/Prefabs/weapon1420_4.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1430_4/Prefabs/weapon1430_4.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1440_4/Prefabs/weapon1440_4.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1510_4/Prefabs/weapon1510_4.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1520_4/Prefabs/weapon1520_4.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1530_4/Prefabs/weapon1530_4.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1540_4/Prefabs/weapon1540_4.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1610_4/Prefabs/weapon1610_4.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1620_4/Prefabs/weapon1620_4.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1630_4/Prefabs/weapon1630_4.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1640_4/Prefabs/weapon1640_4.prefab"] = {lv=9},--新添加角色：QQ770239839

	["Model/Weapon/1110_5/Prefabs/weapon1110_5.prefab"] = {lv=9},
	["Model/Weapon/1120_5/Prefabs/weapon1120_5.prefab"] = {lv=9},
	["Model/Weapon/1210_5/Prefabs/weapon1210_5.prefab"] = {lv=9},
	["Model/Weapon/1220_5/Prefabs/weapon1220_5.prefab"] = {lv=9},
	["Model/Weapon/1310_5/Prefabs/weapon1310_5.prefab"] = {lv=9},
	["Model/Weapon/1320_5/Prefabs/weapon1320_5.prefab"] = {lv=9},
	["Model/Weapon/1410_5/Prefabs/weapon1410_5.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1420_5/Prefabs/weapon1420_5.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1430_5/Prefabs/weapon1430_5.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1440_5/Prefabs/weapon1440_5.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1510_5/Prefabs/weapon1510_5.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1520_5/Prefabs/weapon1520_5.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1530_5/Prefabs/weapon1530_5.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1540_5/Prefabs/weapon1540_5.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1610_5/Prefabs/weapon1610_5.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1620_5/Prefabs/weapon1620_5.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1630_5/Prefabs/weapon1630_5.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1640_5/Prefabs/weapon1640_5.prefab"] = {lv=9},--新添加角色：QQ770239839

	["Model/Weapon/1110_6/Prefabs/weapon1110_6.prefab"] = {lv=9},
	["Model/Weapon/1120_6/Prefabs/weapon1120_6.prefab"] = {lv=9},
	["Model/Weapon/1210_6/Prefabs/weapon1210_6.prefab"] = {lv=9},
	["Model/Weapon/1220_6/Prefabs/weapon1220_6.prefab"] = {lv=9},
	["Model/Weapon/1310_6/Prefabs/weapon1310_6.prefab"] = {lv=9},
	["Model/Weapon/1320_6/Prefabs/weapon1320_6.prefab"] = {lv=9},
	["Model/Weapon/1410_6/Prefabs/weapon1410_6.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1420_6/Prefabs/weapon1420_6.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1430_6/Prefabs/weapon1430_6.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1440_6/Prefabs/weapon1440_6.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1510_6/Prefabs/weapon1510_6.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1520_6/Prefabs/weapon1520_6.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1530_6/Prefabs/weapon1530_6.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1540_6/Prefabs/weapon1540_6.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1610_6/Prefabs/weapon1610_6.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1620_6/Prefabs/weapon1620_6.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1630_6/Prefabs/weapon1630_6.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1640_6/Prefabs/weapon1640_6.prefab"] = {lv=9},--新添加角色：QQ770239839

	["Model/Weapon/1110_7/Prefabs/weapon1110_7.prefab"] = {lv=9},
	["Model/Weapon/1120_7/Prefabs/weapon1120_7.prefab"] = {lv=9},
	["Model/Weapon/1210_7/Prefabs/weapon1210_7.prefab"] = {lv=9},
	["Model/Weapon/1220_7/Prefabs/weapon1220_7.prefab"] = {lv=9},
	["Model/Weapon/1310_7/Prefabs/weapon1310_7.prefab"] = {lv=9},
	["Model/Weapon/1320_7/Prefabs/weapon1320_7.prefab"] = {lv=9},
	["Model/Weapon/1410_7/Prefabs/weapon1410_7.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1420_7/Prefabs/weapon1420_7.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1430_7/Prefabs/weapon1430_7.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1440_7/Prefabs/weapon1440_7.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1510_7/Prefabs/weapon1510_7.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1520_7/Prefabs/weapon1520_7.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1530_7/Prefabs/weapon1530_7.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1540_7/Prefabs/weapon1540_7.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1610_7/Prefabs/weapon1610_7.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1620_7/Prefabs/weapon1620_7.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1630_7/Prefabs/weapon1630_7.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1640_7/Prefabs/weapon1640_7.prefab"] = {lv=9},--新添加角色：QQ770239839

	["Model/Weapon/1110_8/Prefabs/weapon1110_8.prefab"] = {lv=9},
	["Model/Weapon/1120_8/Prefabs/weapon1120_8.prefab"] = {lv=9},
	["Model/Weapon/1210_8/Prefabs/weapon1210_8.prefab"] = {lv=9},
	["Model/Weapon/1220_8/Prefabs/weapon1220_8.prefab"] = {lv=9},
	["Model/Weapon/1310_8/Prefabs/weapon1310_8.prefab"] = {lv=9},
	["Model/Weapon/1320_8/Prefabs/weapon1320_8.prefab"] = {lv=9},
	["Model/Weapon/1410_8/Prefabs/weapon1410_8.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1420_8/Prefabs/weapon1420_8.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1430_8/Prefabs/weapon1430_8.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1440_8/Prefabs/weapon1440_8.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1510_8/Prefabs/weapon1510_8.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1520_8/Prefabs/weapon1520_8.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1530_8/Prefabs/weapon1530_8.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1540_8/Prefabs/weapon1540_8.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1610_8/Prefabs/weapon1610_8.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1620_8/Prefabs/weapon1620_8.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1630_8/Prefabs/weapon1630_8.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1640_8/Prefabs/weapon1640_8.prefab"] = {lv=9},--新添加角色：QQ770239839

	["Model/Weapon/1110_9/Prefabs/weapon1110_9.prefab"] = {lv=9},
	["Model/Weapon/1120_9/Prefabs/weapon1120_9.prefab"] = {lv=9},
	["Model/Weapon/1210_9/Prefabs/weapon1210_9.prefab"] = {lv=9},
	["Model/Weapon/1220_9/Prefabs/weapon1220_9.prefab"] = {lv=9},
	["Model/Weapon/1310_9/Prefabs/weapon1310_9.prefab"] = {lv=9},
	["Model/Weapon/1320_9/Prefabs/weapon1320_9.prefab"] = {lv=9},
	["Model/Weapon/1410_9/Prefabs/weapon1410_9.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1420_9/Prefabs/weapon1420_9.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1430_9/Prefabs/weapon1430_9.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1440_9/Prefabs/weapon1440_9.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1510_9/Prefabs/weapon1510_9.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1520_9/Prefabs/weapon1520_9.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1530_9/Prefabs/weapon1530_9.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1540_9/Prefabs/weapon1540_9.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1610_9/Prefabs/weapon1610_9.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1620_9/Prefabs/weapon1620_9.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1630_9/Prefabs/weapon1630_9.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1640_9/Prefabs/weapon1640_9.prefab"] = {lv=9},--新添加角色：QQ770239839


	["Model/Weapon/1110_10/Prefabs/weapon1110_10.prefab"] = {lv=9},
	["Model/Weapon/1120_10/Prefabs/weapon1120_10.prefab"] = {lv=9},
	["Model/Weapon/1210_10/Prefabs/weapon1210_10.prefab"] = {lv=9},
	["Model/Weapon/1220_10/Prefabs/weapon1220_10.prefab"] = {lv=9},
	["Model/Weapon/1310_10/Prefabs/weapon1310_10.prefab"] = {lv=9},
	["Model/Weapon/1320_10/Prefabs/weapon1320_10.prefab"] = {lv=9},
	["Model/Weapon/1410_10/Prefabs/weapon1410_10.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1420_10/Prefabs/weapon1420_10.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1430_10/Prefabs/weapon1430_10.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1440_10/Prefabs/weapon1440_10.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1510_10/Prefabs/weapon1510_10.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1520_10/Prefabs/weapon1520_10.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1530_10/Prefabs/weapon1530_10.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1540_10/Prefabs/weapon1540_10.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1610_10/Prefabs/weapon1610_10.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1620_10/Prefabs/weapon1620_10.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1630_10/Prefabs/weapon1630_10.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1640_10/Prefabs/weapon1640_10.prefab"] = {lv=9},--新添加角色：QQ770239839

	["Model/Weapon/1110_11/Prefabs/weapon1110_11.prefab"] = {lv=9},
	["Model/Weapon/1120_11/Prefabs/weapon1120_11.prefab"] = {lv=9},
	["Model/Weapon/1210_11/Prefabs/weapon1210_11.prefab"] = {lv=9},
	["Model/Weapon/1220_11/Prefabs/weapon1220_11.prefab"] = {lv=9},
	["Model/Weapon/1310_11/Prefabs/weapon1310_11.prefab"] = {lv=9},
	["Model/Weapon/1320_11/Prefabs/weapon1320_11.prefab"] = {lv=9},
	["Model/Weapon/1410_11/Prefabs/weapon1410_11.prefab"] = {lv=9},--新添加角色：
	["Model/Weapon/1420_11/Prefabs/weapon1420_11.prefab"] = {lv=9},--新添加角色：
	["Model/Weapon/1430_11/Prefabs/weapon1430_11.prefab"] = {lv=9},--新添加角色：
	["Model/Weapon/1440_11/Prefabs/weapon1440_11.prefab"] = {lv=9},--新添加角色：Q
	["Model/Weapon/1510_11/Prefabs/weapon1510_11.prefab"] = {lv=9},--新添加角色：Q
	["Model/Weapon/1520_11/Prefabs/weapon1520_11.prefab"] = {lv=9},--新添加角色：Q
	["Model/Weapon/1530_11/Prefabs/weapon1530_11.prefab"] = {lv=9},--新添加角色：
	["Model/Weapon/1540_11/Prefabs/weapon1540_11.prefab"] = {lv=9},--新添加角色：Q
	["Model/Weapon/1610_11/Prefabs/weapon1610_11.prefab"] = {lv=9},--新添加角色：
	["Model/Weapon/1620_11/Prefabs/weapon1620_11.prefab"] = {lv=9},--新添加角色：Q
	["Model/Weapon/1630_11/Prefabs/weapon1630_11.prefab"] = {lv=9},--新添加角色：
	["Model/Weapon/1640_11/Prefabs/weapon1640_11.prefab"] = {lv=9},--新添加角色：

	["Model/Weapon/1110_12/Prefabs/weapon1110_12.prefab"] = {lv=9},
	["Model/Weapon/1120_12/Prefabs/weapon1120_12.prefab"] = {lv=9},
	["Model/Weapon/1210_12/Prefabs/weapon1210_12.prefab"] = {lv=9},
	["Model/Weapon/1220_12/Prefabs/weapon1220_12.prefab"] = {lv=9},
	["Model/Weapon/1310_12/Prefabs/weapon1310_12.prefab"] = {lv=9},
	["Model/Weapon/1320_12/Prefabs/weapon1320_12.prefab"] = {lv=9},
	["Model/Weapon/1410_12/Prefabs/weapon1410_12.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1420_12/Prefabs/weapon1420_12.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1430_12/Prefabs/weapon1430_12.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1440_12/Prefabs/weapon1440_12.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1510_12/Prefabs/weapon1510_12.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1520_12/Prefabs/weapon1520_12.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1530_12/Prefabs/weapon1530_12.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1540_12/Prefabs/weapon1540_12.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1610_12/Prefabs/weapon1610_12.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1620_12/Prefabs/weapon1620_12.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1630_12/Prefabs/weapon1630_12.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1640_12/Prefabs/weapon1640_12.prefab"] = {lv=9},--新添加角色：QQ770239839

	["Model/Weapon/1110_13/Prefabs/weapon1110_13.prefab"] = {lv=9},
	["Model/Weapon/1120_13/Prefabs/weapon1120_13.prefab"] = {lv=9},
	["Model/Weapon/1210_13/Prefabs/weapon1210_13.prefab"] = {lv=9},
	["Model/Weapon/1220_13/Prefabs/weapon1220_13.prefab"] = {lv=9},
	["Model/Weapon/1310_13/Prefabs/weapon1310_13.prefab"] = {lv=9},
	["Model/Weapon/1320_13/Prefabs/weapon1320_13.prefab"] = {lv=9},
	["Model/Weapon/1410_13/Prefabs/weapon1410_13.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1420_13/Prefabs/weapon1420_13.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1430_13/Prefabs/weapon1430_13.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1440_13/Prefabs/weapon1440_13.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1510_13/Prefabs/weapon1510_13.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1520_13/Prefabs/weapon1520_13.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1530_13/Prefabs/weapon1530_13.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1540_13/Prefabs/weapon1540_13.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1610_13/Prefabs/weapon1610_13.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1620_13/Prefabs/weapon1620_13.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1630_13/Prefabs/weapon1630_13.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1640_13/Prefabs/weapon1640_13.prefab"] = {lv=9},--新添加角色：QQ770239839

	["Model/Weapon/1110_14/Prefabs/weapon1110_14.prefab"] = {lv=9},
	["Model/Weapon/1120_14/Prefabs/weapon1120_14.prefab"] = {lv=9},
	["Model/Weapon/1210_14/Prefabs/weapon1210_14.prefab"] = {lv=9},
	["Model/Weapon/1220_14/Prefabs/weapon1220_14.prefab"] = {lv=9},
	["Model/Weapon/1310_14/Prefabs/weapon1310_14.prefab"] = {lv=9},
	["Model/Weapon/1320_14/Prefabs/weapon1320_14.prefab"] = {lv=9},
	["Model/Weapon/1410_14/Prefabs/weapon1410_14.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1420_14/Prefabs/weapon1420_14.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1430_14/Prefabs/weapon1430_14.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1440_14/Prefabs/weapon1440_14.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1510_14/Prefabs/weapon1510_14.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1520_14/Prefabs/weapon1520_14.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1530_14/Prefabs/weapon1530_14.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1540_14/Prefabs/weapon1540_14.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1610_14/Prefabs/weapon1610_14.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1620_14/Prefabs/weapon1620_14.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1630_14/Prefabs/weapon1630_14.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1640_14/Prefabs/weapon1640_14.prefab"] = {lv=9},--新添加角色：QQ770239839

	["Model/Weapon/1110_15/Prefabs/weapon1110_15.prefab"] = {lv=9},
	["Model/Weapon/1120_15/Prefabs/weapon1120_15.prefab"] = {lv=9},
	["Model/Weapon/1210_15/Prefabs/weapon1210_15.prefab"] = {lv=9},
	["Model/Weapon/1220_15/Prefabs/weapon1220_15.prefab"] = {lv=9},
	["Model/Weapon/1310_15/Prefabs/weapon1310_15.prefab"] = {lv=9},
	["Model/Weapon/1320_15/Prefabs/weapon1320_15.prefab"] = {lv=9},
	["Model/Weapon/1410_15/Prefabs/weapon1410_15.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1420_15/Prefabs/weapon1420_15.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1430_15/Prefabs/weapon1430_15.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1440_15/Prefabs/weapon1440_15.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1510_15/Prefabs/weapon1510_15.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1520_15/Prefabs/weapon1520_15.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1530_15/Prefabs/weapon1530_15.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1540_15/Prefabs/weapon1540_15.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1610_15/Prefabs/weapon1610_15.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1620_15/Prefabs/weapon1620_15.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1630_15/Prefabs/weapon1630_15.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1640_15/Prefabs/weapon1640_15.prefab"] = {lv=9},--新添加角色：QQ770239839

	["Model/Weapon/1110_16/Prefabs/weapon1110_16.prefab"] = {lv=9},
	["Model/Weapon/1120_16/Prefabs/weapon1120_16.prefab"] = {lv=9},
	["Model/Weapon/1210_16/Prefabs/weapon1210_16.prefab"] = {lv=9},
	["Model/Weapon/1220_16/Prefabs/weapon1220_16.prefab"] = {lv=9},
	["Model/Weapon/1310_16/Prefabs/weapon1310_16.prefab"] = {lv=9},
	["Model/Weapon/1320_16/Prefabs/weapon1320_16.prefab"] = {lv=9},
	["Model/Weapon/1410_16/Prefabs/weapon1410_16.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1420_16/Prefabs/weapon1420_16.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1430_16/Prefabs/weapon1430_16.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1440_16/Prefabs/weapon1440_16.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1510_16/Prefabs/weapon1510_16.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1520_16/Prefabs/weapon1520_16.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1530_16/Prefabs/weapon1530_16.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1540_16/Prefabs/weapon1540_16.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1610_16/Prefabs/weapon1610_16.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1620_16/Prefabs/weapon1620_16.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1630_16/Prefabs/weapon1630_16.prefab"] = {lv=9},--新添加角色：QQ770239839
	["Model/Weapon/1640_16/Prefabs/weapon1640_16.prefab"] = {lv=9},--新添加角色：QQ770239839
	
	--["Model/Weapon/1110_17/Prefabs/weapon1110_17.prefab"] = {lv=9},
	--["Model/Weapon/1120_17/Prefabs/weapon1120_17.prefab"] = {lv=9},
	--["Model/Weapon/1210_17/Prefabs/weapon1210_17.prefab"] = {lv=9},
	--["Model/Weapon/1220_17/Prefabs/weapon1220_17.prefab"] = {lv=9},
	--["Model/Weapon/1310_17/Prefabs/weapon1310_17.prefab"] = {lv=9},
	--["Model/Weapon/1320_17/Prefabs/weapon1320_17.prefab"] = {lv=9},
	--["Model/Weapon/1410_17/Prefabs/weapon1410_17.prefab"] = {lv=9},
	--["Model/Weapon/1420_17/Prefabs/weapon1420_17.prefab"] = {lv=9},
	--["Model/Weapon/1430_17/Prefabs/weapon1430_17.prefab"] = {lv=9},
	--["Model/Weapon/1440_17/Prefabs/weapon1440_17.prefab"] = {lv=9},
	--["Model/Weapon/1510_17/Prefabs/weapon1510_17.prefab"] = {lv=9},
	--["Model/Weapon/1520_17/Prefabs/weapon1520_17.prefab"] = {lv=9},
	--["Model/Weapon/1530_17/Prefabs/weapon1530_17.prefab"] = {lv=9},
	--["Model/Weapon/1540_17/Prefabs/weapon1540_17.prefab"] = {lv=9},
	--["Model/Weapon/1610_17/Prefabs/weapon1610_17.prefab"] = {lv=9},
	--["Model/Weapon/1620_17/Prefabs/weapon1620_17.prefab"] = {lv=9},
	--["Model/Weapon/1630_17/Prefabs/weapon1630_17.prefab"] = {lv=9},
	--["Model/Weapon/1640_17/Prefabs/weapon1640_17.prefab"] = {lv=9},

	--["Model/Weapon/1110_18/Prefabs/weapon1110_18.prefab"] = {lv=9},
	--["Model/Weapon/1120_18/Prefabs/weapon1120_18.prefab"] = {lv=9},
	--["Model/Weapon/1210_18/Prefabs/weapon1210_18.prefab"] = {lv=9},
	--["Model/Weapon/1220_18/Prefabs/weapon1220_18.prefab"] = {lv=9},
	--["Model/Weapon/1310_18/Prefabs/weapon1310_18.prefab"] = {lv=9},
	--["Model/Weapon/1320_18/Prefabs/weapon1320_18.prefab"] = {lv=9},
	--["Model/Weapon/1410_18/Prefabs/weapon1410_18.prefab"] = {lv=9},
	--["Model/Weapon/1420_18/Prefabs/weapon1420_18.prefab"] = {lv=9},
	--["Model/Weapon/1430_18/Prefabs/weapon1430_18.prefab"] = {lv=9},
	--["Model/Weapon/1440_18/Prefabs/weapon1440_18.prefab"] = {lv=9},
	--["Model/Weapon/1510_18/Prefabs/weapon1510_18.prefab"] = {lv=9},
	--["Model/Weapon/1520_18/Prefabs/weapon1520_18.prefab"] = {lv=9},
	--["Model/Weapon/1530_18/Prefabs/weapon1530_18.prefab"] = {lv=9},
	--["Model/Weapon/1540_18/Prefabs/weapon1540_18.prefab"] = {lv=9},
	--["Model/Weapon/1610_18/Prefabs/weapon1610_18.prefab"] = {lv=9},
	--["Model/Weapon/1620_18/Prefabs/weapon1620_18.prefab"] = {lv=9},
	--["Model/Weapon/1630_18/Prefabs/weapon1630_18.prefab"] = {lv=9},
	--["Model/Weapon/1640_18/Prefabs/weapon1640_18.prefab"] = {lv=9},

}