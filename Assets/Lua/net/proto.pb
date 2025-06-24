
£
client/vigor.proto"
C2GSOpenVigorChange"7
C2GSVigorChangeStart
change_type (R
changeType"`
C2GSVigorChangeItemStatus"
is_change_all (RisChangeAll
change_type (R
changeType"
C2GSVigorChangeList"
C2GSChangeGoldcoinToVigor".
C2GSBuyGrid
change_type (R
changeType"9
C2GSVigorChangeProduct
change_type (R
changeType"
C2GSVigorChangeALLProducts"M
ChangeOneItem
item_id (RitemId#
change_amount (RchangeAmount"O
C2GSChangeItemToVigor6
changeItemList (2.ChangeOneItemRchangeItemList
¥
client/test.proto"Œ
C2GSTestWar
count (Rcount
level (Rlevel#
active_skills (	RactiveSkills

phy_attack (	R	phyAttack

mag_attack (	R	magAttack
phy_defense (	R
phyDefense
mag_defense (	R
magDefense
speed (	Rspeed
	crit_rate	 (RcritRate

dodge_rate
 (R	dodgeRate
hp (Rhp
mp (Rmp

monster_id (R	monsterId%
passive_skills (	RpassiveSkills
fmt_id (RfmtId
	fmt_grade (RfmtGrade
weather (Rweather
sky_war (RskyWar!
bosswar_type (	RbosswarType
aitype (Raitype
shape (Rshape"M
C2GSTestProto
mask (	Rmask
a (Ra
b
 (	Rb
c (Rc"!
C2GSTestBigPacket
s (	Rs"%
MT1
b1 (Rb1
b2 (Rb2";
MT2
c1 (Rc1
c2 (	Rc2
c3 (2.MT1Rc3"D
C2GSTestCopy
a1 (Ra1
a2 (	Ra2
a3 (2.MT2Ra3"2
C2GSTestOnlineUpdate
a (Ra
b (	Rb
Ø
client/fabao.proto"8
C2GSCombineFaBao
op (Rop
fabao (Rfabao" 
C2GSWieldFaBao
id (Rid""
C2GSUnWieldFaBao
id (Rid"$
C2GSDeComposeFaBao
id (Rid""
C2GSUpGradeFaBao
id (Rid"G
C2GSXianLingFaBao
id (Rid
op (Rop
attr (	Rattr""
C2GSJueXingFaBao
id (Rid")
C2GSJueXingUpGradeFaBao
id (Rid"7
C2GSJueXingHunFaBao
id (Rid
hun (Rhun
ª
client/marry.proto""
C2GSMarryPay
flag (Rflag"
C2GSCancelMarry"#
C2GSSetMarryPic
url (	Rurl"_
C2GSPresentXT
	targetpid (R	targetpid
amount (Ramount
content (	Rcontent"
C2GSMarryWeddingEnd"
C2GSTeamShowWedding"&
C2GSMarryConfirm
flag (Rflag"
C2GSMarryReScene
Á	
client/team.proto"1
C2GSCreateTeam
auto_target (R
autoTarget"&
C2GSTeamInfo
teamid (Rteamid"\
C2GSApplyTeam
teamid (Rteamid
auto_target (R
autoTarget
auto (Rauto"
C2GSTeamApplyInfo"%
C2GSApplyTeamPass
pid (Rpid"
C2GSClearApply"^
C2GSCancelApply
teamid (Rteamid
auto_target (R
autoTarget
auto (Rauto"(
C2GSInviteTeam
target (Rtarget"
C2GSTeamInviteInfo"(
C2GSInvitePass
teamid (Rteamid"
C2GSClearInvite"-
C2GSClearTeamInvite
teamid (Rteamid"
C2GSShortLeave"
C2GSLeaveTeam")
C2GSKickOutTeam
target (Rtarget"
C2GSBackTeam""
C2GSTeamSummon
pid (Rpid"
C2GSApplyLeader"'
C2GSSetLeader
target (Rtarget"ç
C2GSTeamAutoMatch
auto_target (R
autoTarget
	min_grade (RminGrade
	max_grade (RmaxGrade

team_match (R	teamMatch"
C2GSTeamCancelAutoMatch"6
C2GSPlayerAutoMatch
auto_target (R
autoTarget"
C2GSPlayerCancelAutoMatch"8
C2GSGetTargetTeamInfo
auto_target (R
autoTarget"?
C2GSSetAppointMem
pid (Rpid
appoint (Rappoint"K
C2GSSetTeamWarCmd
cmd (	Rcmd
pos (Rpos
type (Rtype"9
C2GSAddTeamWarCmd
type (Rtype
cmd (	Rcmd
Ôr
base/common.protobase"Ü
PosInfo
v (Rv
x (Rx
y (Ry
z (Rz
face_x (RfaceX
face_y (RfaceY
face_z (RfaceZ"∏
	ModelInfo
shape (Rshape
scale (Rscale
color (Rcolor%
mutate_texture (RmutateTexture
weapon (Rweapon
adorn (Radorn
figure (Rfigure
horse (Rhorse

isbianshen	 (R
isbianshen#
ranse_clothes
 (RranseClothes

ranse_hair (R	ranseHair

ranse_pant (R	ransePant!
ranse_summon (RranseSummon
	shizhuang (R	shizhuang'
ranse_shizhuang (RranseShizhuang
fuhun (Rfuhun!
horse_height (RhorseHeight#
follow_spirit (RfollowSpirit
	show_wing (RshowWing"§

SimpleRole
pid (Rpid
name (	Rname
grade (Rgrade.

model_info (2.base.ModelInfoR	modelInfo
icon (Ricon
school (Rschool"T
	TitleInfo
tid (Rtid
name (	Rname!
achieve_time (RachieveTime"w
TouxianInfo
tid (Rtid
name (	Rname
level (Rlevel
score (Rscore
school (Rschool"v
SimplePlayer
pid (Rpid
name (	Rname
grade (Rgrade
school (Rschool
icon (Ricon"d
SecondPropUnit
base (Rbase
extra (Rextra
ratio (Rratio
name (	Rname"Ω

EngageInfo
pid (Rpid
name (	Rname$
equip (2.base.ItemInfoRequip
active (Ractive
etype (Retype
status (Rstatus

marry_time (R	marryTime"Ü
Role
mask (	Rmask
grade (Rgrade
name (	Rname

title_list (	R	titleList
goldcoin (Rgoldcoin
gold (Rgold
silver (Rsilver
exp (Rexp
	chubeiexp	 (R	chubeiexp
max_hp
 (RmaxHp
max_mp (RmaxMp
hp (Rhp
mp (Rmp
energy (Renergy
physique (Rphysique
strength (Rstrength
magic (Rmagic
	endurance (R	endurance
agility (Ragility

phy_attack (R	phyAttack
phy_defense (R
phyDefense

mag_attack (R	magAttack
mag_defense (R
magDefense

cure_power (R	curePower
speed (Rspeed

seal_ratio (R	sealRatio$
res_seal_ratio (RresSealRatio,
phy_critical_ratio (RphyCriticalRatio3
res_phy_critical_ratio (RresPhyCriticalRatio,
mag_critical_ratio (RmagCriticalRatio3
res_mag_critical_ratio (RresMagCriticalRatio.

model_info  (2.base.ModelInfoR	modelInfo
school! (Rschool
point" (Rpoint+
critical_multiple# (RcriticalMultiple
	gold_over$ (RgoldOver
silver_over% (R
silverOver0
	followers& (2.base.FollowerInfoR	followers
sex' (Rsex.

title_info( (2.base.TitleInfoR	titleInfo#
upvote_amount) (RupvoteAmount
achieve* (Rachieve
score+ (Rscore
position, (	Rposition#
position_hide- (RpositionHide
rename. (Rrename
org_id/ (RorgId

org_status0 (R	orgStatus
	org_offer1 (RorgOffer
skill_point2 (R
skillPoint
orgname3 (	Rorgname
icon4 (Ricon
show_id5 (RshowId
org_pos6 (RorgPos
sp7 (Rsp
max_sp8 (RmaxSp=
model_info_changed9 (2.base.ModelInfoRmodelInfoChanged 
rplgoldcoin: (Rrplgoldcoin

fly_height; (R	flyHeight
wuxun< (Rwuxun
jjcpoint= (Rjjcpoint
vigor> (Rvigor 
leaderpoint? (Rleaderpoint

xiayipoint@ (R
xiayipoint 
summonpointA (Rsummonpoint

storypointB (R
storypoint=
title_info_changedC (2.base.TitleInfoRtitleInfoChanged1
	prop_infoD (2.base.SecondPropUnitRpropInfo1
engage_infoE (2.base.EngageInfoR
engageInfo
gold_oweF (RgoldOwe

silver_oweG (R	silverOwe!
goldcoin_oweH (RgoldcoinOwe)
truegoldcoin_oweI (RtruegoldcoinOwe

chumopointJ (R
chumopoint"ô
	WaterWalk

start_time (R	startTime
end_time (RendTime*
	start_pos (2.base.PosInfoRstartPos&
end_pos (2.base.PosInfoRendPos"R
EntityAction
type (Rtype.

water_walk (2.base.WaterWalkR	waterWalk"|
FollowerInfo
name (	Rname.

model_info (2.base.ModelInfoR	modelInfo
title (	Rtitle
type (	Rtype"s
	PlayerAoi*
block (2.base.PlayerAoiBlockRblock(
pos_info (2.base.PosInfoRposInfo
pid (Rpid"C
PosQueueInfo
pos (2.base.PosInfoRpos
time (Rtime"î
PlayerAoiBlock
mask (	Rmask
name (	Rname.

model_info (2.base.ModelInfoR	modelInfo
war_tag (RwarTag0
	followers (2.base.FollowerInfoR	followers.

title_info (2.base.TitleInfoR	titleInfo
icon (Ricon
show_id (RshowId
	dance_tag	 (RdanceTag
touxian_tag
 (R
touxianTag*
action (2.base.EntityActionRaction
org_id (RorgId
state (Rstate

fly_height (R	flyHeight

engage_pid (R	engagePid-
treasureconvoy_tag (RtreasureconvoyTag"h
	EffectAoi
	effect_id (ReffectId(
pos_info (2.base.PosInfoRposInfo
objid (Robjid"™
NpcAoi'
block (2.base.NpcAoiBlockRblock(
pos_info (2.base.PosInfoRposInfo
npctype (Rnpctype
npcid (Rnpcid

func_group (	R	funcGroup"‹
NpcAoiBlock
mask (	Rmask
name (	Rname.

model_info (2.base.ModelInfoR	modelInfo
war_tag (RwarTag
xunluoid (Rxunluoid
title (	Rtitle*
action (2.base.EntityActionRaction"˙
WarriorStatus
mask (	Rmask
hp (Rhp
mp (Rmp
max_hp (RmaxHp
max_mp (RmaxMp.

model_info (2.base.ModelInfoR	modelInfo
name (	Rname
aura (Raura
status	 (Rstatus!
auto_perform
 (RautoPerform
is_auto (RisAuto
max_sp (RmaxSp
sp (Rsp"
item_use_cnt1 (RitemUseCnt1"
item_use_cnt2 (RitemUseCnt2
cmd (Rcmd
school (Rschool
grade (Rgrade
title (	Rtitle
zhenqi (Rzhenqi"2
BuffAttr
key (	Rkey
value (Rvalue"c
BuffUnit
buff_id (RbuffId
bout (Rbout*
attrlist (2.base.BuffAttrRattrlist"2
PerformUnit
pf_id (RpfId
cd (Rcd"Y
StatusBuffUnit
	status_id (RstatusId*
attrlist (2.base.BuffAttrRattrlist"π
PlayerWarrior
wid (Rwid
pid (Rpid
pos (Rpos)
pflist (2.base.PerformUnitRpflist+
status (2.base.WarriorStatusRstatus
appoint (Rappoint
	appointop (R	appointop+
	buff_list (2.base.BuffUnitRbuffList5
status_list	 (2.base.StatusBuffUnitR
statusList"‡

NpcWarrior
wid (Rwid
pos (Rpos+
status (2.base.WarriorStatusRstatus+
	buff_list (2.base.BuffUnitRbuffList

specail_id (R	specailId5
status_list (2.base.StatusBuffUnitR
statusList"ô

SumWarrior
wid (Rwid
pos (Rpos
owner (Rowner
sum_id (RsumId)
pflist (2.base.PerformUnitRpflist+
status (2.base.WarriorStatusRstatus+
	buff_list (2.base.BuffUnitRbuffList5
status_list (2.base.StatusBuffUnitR
statusList"Ç
PartnerWarrior
wid (Rwid
pid (Rpid
pos (Rpos)
pflist (2.base.PerformUnitRpflist+
status (2.base.WarriorStatusRstatus+
	buff_list (2.base.BuffUnitRbuffList5
status_list (2.base.StatusBuffUnitR
statusList"∆
RoPlayerWarrior
wid (Rwid
pos (Rpos+
status (2.base.WarriorStatusRstatus+
	buff_list (2.base.BuffUnitRbuffList5
status_list (2.base.StatusBuffUnitR
statusList"«
RoPartnerWarrior
wid (Rwid
pos (Rpos+
status (2.base.WarriorStatusRstatus+
	buff_list (2.base.BuffUnitRbuffList5
status_list (2.base.StatusBuffUnitR
statusList"∆
RoSummonWarrior
wid (Rwid
pos (Rpos+
status (2.base.WarriorStatusRstatus+
	buff_list (2.base.BuffUnitRbuffList5
status_list (2.base.StatusBuffUnitR
statusList"3
	ApplyInfo
key (	Rkey
value (Rvalue"1
	ValueInfo
id (Rid
value (Rvalue"e
EquipHSInfo
pos (Rpos
grade (Rgrade
color (Rcolor
addattr (	Raddattr"≈
	EquipInfo0
attach_attr (2.base.ApplyInfoR
attachAttr.

fuhun_attr (2.base.ApplyInfoR	fuhunAttr
se (Rse
last (Rlast
score (Rscore
sk (Rsk
is_make (RisMake0
fuhun_extra (2.base.ApplyInfoR
fuhunExtra!
tmp_strength	 (RtmpStrength'
skills
 (2.base.SkillInfoRskills
	tmp_score (RtmpScore)
hunshi (2.base.EquipHSInfoRhunshi

grow_level (R	growLevel
left_minute (R
leftMinute
engage_text (	R
engageText
engage_time (R
engageTime+
fuzhuan (2.base.FuZhuanInfoRfuzhuan"…
StrengthenInfo
pos (Rpos
level (Rlevel
score (Rscore
break_level (R
breakLevel,
success_ratio_base (RsuccessRatioBase*
success_ratio_add (RsuccessRatioAdd"<

HunShiInfo
grade (Rgrade
addattr (	Raddattr"K
FuZhuanInfo
attr (	Rattr
value (Rvalue
time (Rtime"ê
ItemInfo
id (Rid
sid (Rsid
name (	Rname
pos (Rpos
	itemlevel (R	itemlevel
amount (Ramount
time (Rtime
key (Rkey.

apply_info	 (2.base.ApplyInfoR	applyInfo
desc
 (	Rdesc.

equip_info (2.base.EquipInfoR	equipInfoD
treasuremap_info (2.base.TreasureMapItemInfoRtreasuremapInfo&
guild_buy_price (RguildBuyPrice#
cycreate_time (RcycreateTime1
hunshi_info (2.base.HunShiInfoR
hunshiInfo&
stall_buy_price (RstallBuyPrice"—
WashPointInfo
agility (Ragility
strength (Rstrength
magic (Rmagic
physique (Rphysique
	endurance (R	endurance!
remain_point (RremainPoint
plan_id (RplanId"3
ItemPos
itemid (Ritemid
pos (Rpos"ê
AttrInfo
physique (Rphysique
magic (Rmagic
strength (Rstrength
	endurance (R	endurance
agility (Ragility"Ç
AptitudeInfo
attack (Rattack
defense (Rdefense
health (Rhealth
mana (Rmana
speed (Rspeed"è
	SkillInfo
sk (Rsk
level (Rlevel
cost (Rcost
	needgrade (R	needgrade
bind (Rbind
innate (Rinnate"˛

SummonInfo
mask (	Rmask
id (Rid
typeid (Rtypeid
type (Rtype
key (Rkey
name (	Rname

carrygrade (R
carrygrade
grade (Rgrade
exp	 (Rexp,
	attribute
 (2.base.AttrInfoR	attribute
point (Rpoint4
maxaptitude (2.base.AptitudeInfoRmaxaptitude4
curaptitude (2.base.AptitudeInfoRcuraptitude
life (Rlife
race (Rrace
element (Relement
score (Rscore
rank (	Rrank'
talent (2.base.SkillInfoRtalent%
skill (2.base.SkillInfoRskill
max_hp (RmaxHp
max_mp (RmaxMp
hp (Rhp
mp (Rmp
basename (	Rbasename

phy_attack (R	phyAttack
phy_defense (R
phyDefense

mag_attack (R	magAttack
mag_defense (R
magDefense
speed (Rspeed
grow (Rgrow.

model_info  (2.base.ModelInfoR	modelInfo
traceno! (Rtraceno

autoswitch" (R
autoswitch
	freepoint# (R	freepoint
got_time$ (RgotTime!
summon_score% (RsummonScore#
cycreate_time& (RcycreateTime,
	equipinfo' (2.base.ItemInfoR	equipinfo
zhenpin( (Rzhenpin3

speed_unit) (2.base.SecondPropUnitR	speedUnit>
mag_defense_unit* (2.base.SecondPropUnitRmagDefenseUnit>
phy_defense_unit+ (2.base.SecondPropUnitRphyDefenseUnit<
mag_attack_unit, (2.base.SecondPropUnitRmagAttackUnit<
phy_attack_unit- (2.base.SecondPropUnitRphyAttackUnit4
max_hp_unit. (2.base.SecondPropUnitR	maxHpUnit4
max_mp_unit/ (2.base.SecondPropUnitR	maxMpUnit#
advance_level0 (RadvanceLevel
	bind_ride1 (RbindRide 
use_grow_cnt2 (R
useGrowCnt"0
SkllInfo
sk (Rsk
level (Rlevel"]
PartnerEquip
	equip_sid (RequipSid
level (Rlevel
strength (Rstrength"ü
PartnerInfo
mask (	Rmask
id (Rid
sid (Rsid
quality (Rquality
grade (Rgrade
name (	Rname
exp (Rexp
max_hp (RmaxHp
max_mp	 (RmaxMp
hp
 (Rhp
mp (Rmp
physique (Rphysique
strength (Rstrength
magic (Rmagic
	endurance (R	endurance
agility (Ragility

phy_attack (R	phyAttack
phy_defense (R
phyDefense

mag_attack (R	magAttack
mag_defense (R
magDefense

cure_power (R	curePower
speed (Rspeed

seal_ratio (R	sealRatio$
res_seal_ratio (RresSealRatio,
phy_critical_ratio (RphyCriticalRatio3
res_phy_critical_ratio (RresPhyCriticalRatio,
mag_critical_ratio (RmagCriticalRatio3
res_mag_critical_ratio (RresMagCriticalRatio
school (Rschool
upper (Rupper
type (Rtype
race  (Rrace.

model_info! (2.base.ModelInfoR	modelInfo$
skill" (2.base.SkllInfoRskill.
equipsid# (2.base.PartnerEquipRequipsid
score$ (Rscore"ê
FriendProfile
mask (	Rmask
pid (Rpid
name (	Rname
icon (Ricon
grade (Rgrade
school (Rschool
orgid (Rorgid
orgname (	Rorgname#
friend_degree	 (RfriendDegree
relation
 (Rrelation
both (Rboth"û
TreasureMapItemInfo
itemid (Ritemid%
treasure_mapid (RtreasureMapid#
treasure_posx (RtreasurePosx#
treasure_posy (RtreasurePosy"D
MoneyReward

money_type (	R	moneyType
amount (Ramount"7
ValueReward
sid (Rsid
amount (Ramount"6

ItemReward
sid (Rsid
amount (Ramount"/
PosUnit
pid (Rpid
type (Rtype"A
NeedItemGroup
groupid (Rgroupid
amount (Ramount":
NeedItem
itemid (Ritemid
amount (Ramount"7
NeedSum
sumid (Rsumid
amount (Ramount"S
GuideLinkInfo
linkid (	Rlinkid
step (Rstep
exdata (	Rexdata"=
BaikeLinkAnswer
link1 (Rlink1
link2 (Rlink2"M
ClientResFileVersion
	file_name (	RfileName
version (Rversion"M
ClientResFileContent
	file_name (	RfileName
content (Rcontent"ª
MemStatusInfo
mask (	Rmask
name (	Rname.

model_info (2.base.ModelInfoR	modelInfo
school (Rschool
grade (Rgrade
status (Rstatus
hp (Rhp
max_hp (RmaxHp
mp	 (Rmp
max_mp
 (RmaxMp
orgid (Rorgid
icon (Ricon
score (Rscore"Q
TeamMem
pid (Rpid4
status_info (2.base.MemStatusInfoR
statusInfo
Ú
client/player.protobase/common.proto"%
C2GSGetPlayerInfo
pid (Rpid".
C2GSSelectPointPlan
plan_id (RplanId"B
C2GSAddPoint2

point_info (2.base.WashPointInfoR	pointInfo"@
C2GSWashPoint
	prop_name (	RpropName
flag (Rflag"
C2GSWashAllPoint"
C2GSGetSecondProp">
C2GSPlayerItemInfo
pid (Rpid
itemid (Ritemid"D
C2GSPlayerSummonInfo
pid (Rpid
summonid (Rsummonid"C
C2GSPlayerPartnerInfo
pid (Rpid
partner (Rpartner"$
C2GSNameCardInfo
pid (Rpid"$
C2GSUpvotePlayer
pid (Rpid"(
C2GSPlayerUpvoteInfo
pid (Rpid"$
C2GSUpvoteReward
idx (Ridx"$

C2GSRename
rename (	Rrename"&
C2GSHidePosition
hide (Rhide"Y
C2GSObserverWar
camp_id (RcampId
npc_id (RnpcId
target (Rtarget"-
C2GSLeaveObserverWar
war_id (RwarId"O
C2GSSysConfig
on_off (RonOff'
values (2.base.ValueInfoRvalues"+
C2GSRewardGradeGift
grade (Rgrade".
C2GSRewardPreopenGift
sys_id (RsysId"
C2GSGetScore
op (Rop"
C2GSGetPromote"Å
C2GSPlayerRanSe

clothcolor (R
clothcolor
	haircolor (R	haircolor
	pantcolor (R	pantcolor
flag (Rflag"7
C2GSOpenShiZhuang
type (Rtype
sz (Rsz"
	C2GSSetSZ
sz (Rsz"ç
C2GSSZRanse
sz (Rsz

clothcolor (R
clothcolor
	haircolor (R	haircolor
	pantcolor (R	pantcolor
flag (Rflag"6
C2GSSetSZColor
sz (Rsz
color (Rcolor"=
C2GSGamePushConfig'
values (2.base.ValueInfoRvalues"
C2GSGetAllSZInfo".
C2GSSyncPosition
position (	Rposition
·
client/ride.proto"+
C2GSActivateRide
ride_id (RrideId":
C2GSUseRide
ride_id (RrideId
flag (Rflag"%
C2GSUpGradeRide
flag (Rflag"-
C2GSBuyRideUseTime
sell_id (RsellId")
C2GSRandomRideSkill
flag (Rflag"
C2GSShowRandomSkill"/
C2GSLearnRideSkill
skill_id (RskillId"D
C2GSForgetRideSkill
skill_id (RskillId
flag (Rflag";
C2GSSetRideFly
ride_id (RrideId
fly (Rfly"
C2GSGetRideInfo"
C2GSResetSkillInfo"
C2GSResetRideSkill"(
C2GSBreakRideGrade
flag (Rflag"S
C2GSWieldWenShi
rideid (Rrideid
itemid (Ritemid
pos (Rpos"=
C2GSUnWieldWenShi
rideid (Rrideid
pos (Rpos"Y
C2GSControlSummon
rideid (Rrideid
summonid (Rsummonid
pos (Rpos"?
C2GSUnControlSummon
rideid (Rrideid
pos (Rpos
√
client/partner.protobase/common.proto"3
C2GSRecruit
sid (Rsid
flag (Rflag"F
C2GSUpgradeQuality
	partnerid (R	partnerid
flag (Rflag"3
C2GSUpperGradeLimit
	partnerid (R	partnerid"J
C2GSUseUpgradeProp
	partnerid (R	partnerid
itemid (Ritemid"X
C2GSUpgradeSkill
	partnerid (R	partnerid
skid (Rskid
flag (Rflag"F
C2GSWieldEquip
	partnerid (R	partnerid
itemid (Ritemid"a
C2GSSetPartnerPosInfo
lineup (Rlineup
fmt_id (RfmtId
pos_list (RposList"
C2GSGetAllLineupInfo"+
C2GSSetCurrLineup
lineup (Rlineup"o
C2GSSwapProtectSkill

partner_id (R	partnerId
	skill_old (RskillOld
	skill_new (RskillNew"q
C2GSUpgradePartnerEquip

partner_id (R	partnerId
	equip_sid (RequipSid
goldcoin (Rgoldcoin"l
C2GSStrengthPartnerEquip

partner_id (R	partnerId
	equip_sid (RequipSid
quick (Rquick
±
client/newbieguide.protobase/common.proto"1
C2GSNewSysOpenNotified
sys_ids (	RsysIds"}
C2GSUpdateNewbieGuideInfo
mask (	Rmask4
guide_links (2.base.GuideLinkInfoR
guideLinks
exdata (	Rexdata"6
C2GSSelectNewbieSummon
	selection (R	selection"
C2GSGetNewbieGuildInfo
Õ
client/openui.proto"
C2GSOpenScheduleUI"
C2GSWeekSchedule"2
C2GSScheduleReward
	rewardidx (R	rewardidx"
C2GSRewardDoublePoint"'
C2GSOpenInterface
type (Rtype"(
C2GSCloseInterface
type (Rtype")
C2GSOpenFBComfirm
fuben (Rfuben"+
C2GSUseAdvanceMap
itemid (Ritemid"&
C2GSOpenBox
box_sid (RboxSid"<
C2GSQuickBuyItem
sid (Rsid
amount (Ramount"
C2GSFindHDNpc"-
C2GSFindGlobalNpc
npctype (Rnpctype"L
C2GSExchangeCash
	moneytype (R	moneytype
goldcoin (Rgoldcoin" 

C2GSXunLuo
type (Rtype
ƒ
client/mentoring.proto"B
mOption
question_id (R
questionId
answer (Ranswer";
C2GSToBeMentor)
option_list (2.mOptionR
optionList"?
C2GSToBeApprentice)
option_list (2.mOptionR
optionList"0
C2GSDirectBuildReleationship
pid (Rpid"W
C2GSMentoringTaskReward
type (Rtype
target (Rtarget
idx (Ridx"]
C2GSMentoringStepResultReward
type (Rtype
target (Rtarget
idx (Ridx
å
client/guild.proto"=
C2GSOpenGuild
cat_id (RcatId
sub_id (RsubId"C
C2GSBuyGuildItem
good_id (RgoodId
amount (Ramount"D
C2GSSellGuildItem
item_id (RitemId
amount (Ramount",
C2GSGetGuildPrice
good_id (RgoodId
©
client/shop.proto"o
C2GSBuyGood
shop (Rshop
goodid (Rgoodid
	moneytype (R	moneytype
amount (Ramount"#
C2GSEnterShop
shop (Rshop
°
client/chat.proto"H
C2GSChat
cmd (	Rcmd
type (Rtype
forbid (Rforbid"4
C2GSChuanYin
cmd (	Rcmd
type (Rtype"ã
C2GSMatchTeamChat
cmd (	Rcmd
mingrade (Rmingrade
maxgrade (Rmaxgrade
ismatch (Rismatch
type (Rtype
R
client/state.proto"+
C2GSClickState
state_id (RstateId"
C2GSAddBaoShi
_
client/kuafu.proto"8
C2GSTryEnterKS
ks (	Rks
hdname (	Rhdname"
C2GSTryBackGS
á
client/bulletbarrage.proto"(
C2GSWarBulletBarrage
cmd (	Rcmd"Å
C2GSVideoBulletBarrage
video_id (RvideoId
type (Rtype
bout (Rbout
secs (Rsecs
msg (	Rmsg"(
C2GSOrgBulletBarrage
cmd (	Rcmd"Y
C2GSStoryBulletBarrage
story_id (RstoryId
secs (Rsecs
msg (	Rmsg"6
C2GSGetStoryBulletBarrage
story_id (RstoryId
¯
client/artifact.proto"
C2GSArtifactOpenUI"4
C2GSArtifactUpgradeUse
goldcoin (Rgoldcoin"2
C2GSArtifactStrength
goldcoin (Rgoldcoin"S
C2GSArtifactSpiritWakeup
	spirit_id (RspiritId
goldcoin (Rgoldcoin"W
C2GSArtifactSpiritResetSkill
	spirit_id (RspiritId
goldcoin (Rgoldcoin":
C2GSArtifactSpiritSaveSkill
	spirit_id (RspiritId":
C2GSArtifactSetFollowSpirit
	spirit_id (RspiritId"9
C2GSArtifactSetFightSpirit
	spirit_id (RspiritId
é
client/skill.proto"H
C2GSLearnSkill
type (	Rtype
sk (Rsk
flag (Rflag"(
C2GSFastLearnSkill
type (	Rtype"'
C2GSResetActiveSchool
sk (Rsk"=
C2GSLearnCultivateSkill
type (Rtype
sk (Rsk"'
C2GSSetCultivateSkill
sk (Rsk"#
C2GSLearnOrgSkill
sk (Rsk"5
C2GSUseOrgSkill
sk (Rsk
args (Rargs"'
C2GSLearnFuZhuanSkill
sk (Rsk"'
C2GSResetFuZhuanSkill
sk (Rsk")
C2GSProductFuZhuanSkill
sk (Rsk"
C2GSEnergyExchangeSilver
ø
client/store.proto"5
C2GSExchangeGold!
store_itemid (RstoreItemid"7
C2GSExchangeSilver!
store_itemid (RstoreItemid"b
C2GSNpcStoreBuy
buy_id (RbuyId
	buy_count (RbuyCount
	all_money (RallMoney"<
C2GSFastBuyItem
item_id (RitemId
cnt (Rcnt"
C2GSExChangeDanceBook
ˇ
client/summon.protobase/common.proto"<
C2GSWashSummon
summid (Rsummid
flag (Rflag"@
C2GSStickSkill
summid (Rsummid
itemid (Ritemid"F
C2GSFastStickSkill
summid (Rsummid
booksid (Rbooksid"D
C2GSSummonSkillLevelUp
summid (Rsummid
skid (Rskid"B
C2GSSummonChangeName
summid (Rsummid
name (	Rname"B
C2GSSummonSetFight
summid (Rsummid
fight (Rfight"+
C2GSReleaseSummon
summid (Rsummid"W
C2GSSummonAssignPoint
summid (Rsummid&
scheme (2.base.AttrInfoRscheme"\
C2GSSummonAutoAssignScheme
summid (Rsummid&
scheme (2.base.AttrInfoRscheme"F
C2GSSummonOpenAutoAssign
summid (Rsummid
flag (Rflag"/
C2GSSummonRequestAuto
summid (Rsummid"'
C2GSBuySummon
typeid (Rtypeid"[
C2GSCombineSummon
summid1 (Rsummid1
summid2 (Rsummid2
flag (Rflag">
C2GSSummonFollow
summid (Rsummid
flag (Rflag"R
C2GSUseSummonExpBook
summid (Rsummid
cnt (Rcnt
sid (Rsid"_
C2GSUseAptitudePellet
summid (Rsummid
aptitude (Raptitude
flag (Rflag"+
C2GSUseGrowPellet
summid (Rsummid"@
C2GSUsePointPellet
summid (Rsummid
attr (Rattr"U
C2GSUseLifePellet
summid (Rsummid
cnt (Rcnt
itemid (Ritemid"/
C2GSSummonRestPointUI
summid (Rsummid"&
C2GSExchangeSummon
sid (Rsid",
C2GSGetSummonRanse
summid (Rsummid"S
C2GSSummonRanse
summid (Rsummid
color (Rcolor
flag (Rflag"K
C2GSCombineSummonLead
summid1 (Rsummid1
summid2 (Rsummid2"U
C2GSSummonBindSKill
summid (Rsummid
skid (Rskid
flag (Rflag"*
C2GSExtendSummonSize
flag (Rflag"
C2GSExtendSummonCkSize"|
C2GSShenShouExchange
	targetsid (R	targetsid
summid1 (Rsummid1
summid2 (Rsummid2
flag (Rflag"C
C2GSEquipSummon
summid (Rsummid
equipid (Requipid")
C2GSAddCkSummon
summid (Rsummid",
C2GSChangeCkSummon
summid (Rsummid"?
C2GSSummonAdvance
summid (Rsummid
flag (Rflag
Î:
client/huodong.protobase/common.proto"<
C2GSArenaFight
fight (Rfight
enemy (Renemy"
C2GSArenaViewList"@
C2GSArenaFightList
pidlst (Rpidlst
team (Rteam"
C2GSShootCrapOpen"
C2GSShootCrapStart"
C2GSShootCrapEnd"$
C2GSDanceStart
flag (Rflag"
C2GSDanceEnd"
C2GSDanceInspired"
C2GSDanceAuto"]
C2GSCampfireAnswer
id (Rid
answer (Ranswer
fill_answer (	R
fillAnswer"
C2GSCampfireDesireQuestion"+
C2GSCampfireDrink
amount (Ramount"
C2GSCampfireQueryGiftables"C
C2GSCampfireGiftOut
target (Rtarget
quick (Rquick"/
C2GSCampfireThankGift
target (Rtarget"
C2GSSignInDone"
C2GSSignInReplenish"
C2GSSignInLottery"
C2GSSignInMainInfo"
C2GSMengzhuOpenPlayerRank"
C2GSMengzhuOpenOrgRank"
C2GSMengzhuOpenPlunder"
C2GSMengzhuStartFightBoss"1
C2GSMengzhuStartPlunder
target (Rtarget"
C2GSMengzhuMainUI"

C2GSBWRank" 
C2GSBWMakeTeam
op (Rop"
C2GSSchoolPassClickNpc"
C2GSOrgTaskRandTask"
C2GSOrgTaskResetStar"
C2GSOrgTaskReceiveTask"
C2GSOrgTaskFindNPC"
C2GSBaikeOpenUI"\
C2GSBaikeChooseAnswer
id (Rid
answer (Ranswer
	cost_time (RcostTime"q
C2GSBaikeLinkAnswer
id (Rid-
answer (2.base.BaikeLinkAnswerRanswer
	cost_time (RcostTime"
C2GSBaikeGetNextQuestion"
C2GSBaikeWeekRank"E
C2GSChargeRewardGradeGift
type (	Rtype
grade (Rgrade"2
C2GSChargeRewardGoldCoinGift
type (	Rtype"3
C2GSChargeCheckBuy

reward_key (	R	rewardKey"7
C2GSChargeGetDayReward

reward_key (	R	rewardKey"*
C2GSBottleDetail
bottle (Rbottle"B
C2GSBottleSend
bottle (Rbottle
content (	Rcontent"(
C2GSLMLookInfo
school (Rschool"
C2GSLingxiPaticipate"
C2GSLingxiClickAcceptTask"
C2GSLingxiClickMatch"
C2GSLingxiStopMatch",
C2GSRewardFirstPayGift
type (Rtype"F
C2GSRewardWelfareGift
type (	Rtype
gift_key (	RgiftKey"
C2GSJoinJYFuben"2
C2GSRedeemCollectGift
gift_key (	RgiftKey"7
C2GSCaishenStartChoose

reward_key (R	rewardKey"
C2GSCaishenOpenUI"2
C2GSCaishenRefreshRecordList
time (Rtime"4
C2GSOrgWarOpenMatchList
week_day (RweekDay"
C2GSOrgWarTryGotoNpc"
C2GSOrgWarOpenTeamUI"
C2GSOrgWarOpenWarScoreUI".
C2GSOrgWarStartFight
target (Rtarget"
C2GSOrgTaskStarReward"
C2GSTrialOpenUI"
C2GSTiralStartFight"&
C2GSTrialGetReward
pos (Rpos"
C2GSHfdmEnter"A
C2GSHfdmSelect
ques_id (RquesId
answer (Ranswer"W
C2GSHfdmUseSkill
id (Rid
target (Rtarget
	my_answer (RmyAnswer"&
C2GSGrowReward
index (Rindex"/
C2GSReturnGoldCoinGetReturn
key (Rkey"
C2GSReturnGoldCoinGetFreeGift"-
C2GSReturnGoldCoinBuyGift
key (Rkey"
C2GSKFGetTXRank"/
C2GSKFGetOrgLevelReward
level (Rlevel")
C2GSKFGetOrgCntReward
cnt (Rcnt",
C2GSKFGetScoreReward
score (Rscore",
C2GSKFGetGradeReward
grade (Rgrade"
C2GSKFGetRankReward")
C2GSSevenDayGetReward
day (Rday"C
C2GSEveryDayChargeGetReward
day (Rday
flag (	Rflag""
C2GSOnlineGift
key (Rkey"
C2GSSuperRebateGetReward"
C2GSSuperRebateGetRecord"
C2GSSuperRebateLottery"0
C2GSTotalChargeGetReward
level (Rlevel"Z
C2GSTotalChargeSetChoice
level (Rlevel
slot (Rslot
index (Rindex"1
C2GSFightGiftbagGetReward
score (Rscore"
C2GSFightGiftbagGetInfo"[
C2GSFightGiftbagSetChoice
score (Rscore
slot (	Rslot
index (Rindex"U
C2GSDayExpenseGetReward
	group_key (	RgroupKey

reward_key (R	rewardKey"á
C2GSDayExpenseSetRewardOption
	group_key (	RgroupKey

reward_key (R	rewardKey
grid (Rgrid
option (Roption"
C2GSDayExpenseOpenRewardUI"e
C2GSOpenFuYuanBox
box_idx (RboxIdx
times (Rtimes!
use_goldcoin (RuseGoldcoin"
C2GSThreeBWGetFirstReward"
C2GSThreeBWGetFiveReward"
C2GSThreeBWGetRankInfo")
C2GSThreeSetMatch
match (Rmatch"
C2GSRewardSecondPayGift"
C2GSOpenActivePointGiftView"p
 C2GSSetActivePointGiftGridOption
	point_key (RpointKey
grid_id (RgridId
option (Roption"5
C2GSGetActivePointGift
	point_key (RpointKey"?
 C2GSGetActivePointGiftByGoldCoin
	point_key (RpointKey"$
C2GSJuBaoPen
times (Rtimes"/
C2GSJuBaoPenScoreReward
score (Rscore"
C2GSOpenJuBaoPenView"1
C2GSQiFuGetDegreeReward
degree (Rdegree".
C2GSQiFuGetLotteryReward
flag (Rflag"
C2GSDrawCardOpenView"
C2GSDrawCardBuyTimes".
C2GSDrawCardOpenOne
card_id (RcardId"
C2GSDrawCardOpenList"
C2GSDrawCardReset"
C2GSDrawCardStart"<
C2GSDrawCardSetPopupState
popup_state (R
popupState"o
C2GSContinuousChargeSetChoice
type (Rtype
day (Rday
slot (Rslot
index (Rindex".
C2GSContinuousChargeReward
day (Rday"3
C2GSContinuousChargeTotalReward
day (Rday"p
C2GSContinuousExpenseSetChoice
type (Rtype
day (Rday
slot (Rslot
index (Rindex"/
C2GSContinuousExpenseReward
day (Rday"4
 C2GSContinuousExpenseTotalReward
day (Rday"
C2GSFengYaoAutoFindNPC"
C2GSShootCrapsExchangeCnt"
C2GSNianShouFindNPC":
 C2GSGoldCoinPartyGetDegreeReward
degree (Rdegree"Q
!C2GSGoldCoinPartyGetLotteryReward
lottery (Rlottery
flag (Rflag" 
C2GSGoldCoinPartyGetRewardInfo"7
C2GSMysticalboxOperateBox
operator (Roperator"
C2GSJieBaiCreate"&
C2GSJBInvite
target (Rtarget"
C2GSJBArgeeInvite"
C2GSJBDisgrgeeInvite"*
C2GSJBKickInvite
target (Rtarget"
C2GSQuitJieBai"
C2GSReleaseJieBai"
C2GSJBPreStart"
C2GSJBJoinYiShi"&
C2GSJBSetTitle
title (	Rtitle",
C2GSJBSetMingHao
minghao (	Rminghao"
C2GSJBJingJiu")
C2GSJBEnounce
enounce (	Renounce"$
C2GSJBKickMember
pid (Rpid"&
C2GSJBVoteKickMember
op (Rop"
C2GSJBGetValidInviter"2
C2GSJBClickRedPoint
	type_list (RtypeList"
C2GSLuanShiMoYing"y
C2GSJoyExpenseBuyGood
shop (Rshop
goodid (Rgoodid
	moneytype (R	moneytype
amount (Ramount"8
C2GSJoyExpenseGetReward

expense_id (R	expenseId"
C2GSSingleWarStartMatch"
C2GSSingleWarStopMatch"
C2GSSingleWarGetRewardFirst"
C2GSSingleWarGetRewardFive".
C2GSSingleWarRank
group_id (RgroupId"-
C2GSItemInvest
	invest_id (RinvestId"3
C2GSItemInvestReward
	invest_id (RinvestId"H
C2GSItemInvestDayReward
	invest_id (RinvestId
day (Rday"Y
C2GSImperialexamAnswerQuestion
question_id (R
questionId
answer (Ranswer"2
C2GSTreasureConvoySelectTask
type (Rtype")
C2GSTreasureConvoyRob
pid (Rpid"
C2GSTreasureConvoyMatchRob"6
C2GSTreasureConvoyEnterNpcArea
npcid (Rnpcid"5
C2GSTreasureConvoyExitNpcArea
npcid (Rnpcid"'
C2GSBuyDiscountSale
day (Rday"%
C2GSZeroYuanBuy
type (Rtype"(
C2GSZeroYuanReward
type (Rtype"a
C2GSRetrieveExp 
scheduleids (Rscheduleids
nowtime (Rnowtime
type (Rtype"F
C2GSWorldCupSingle
game_id (RgameId
team_id (RteamId"C
C2GSWorldCupChampion
type (Rtype
team_id (RteamId"
C2GSWorldCupHistory"
C2GSZongziOpenUI"D
C2GSZongziExchange
type (Rtype
goldcoin (Rgoldcoin"
C2GSDuanwuQifuOpenUI"
C2GSDuanwuQifuSubmit"*
C2GSDuanwuQifuReward
step (Rstep")
C2GSEnterOrgHuodong
name (	Rname
Ü
client/auction.proto"S
C2GSOpenAuction
cat_id (RcatId
sub_id (RsubId
page (Rpage"6
C2GSAuctionBid
id (Rid
price (Rprice"9
C2GSSetProxyPrice
id (Rid
price (Rprice""
C2GSToggleFollow
id (Rid"
C2GSCloseAuctionUI"&
C2GSCancelProxyPrice
id (Rid"
C2GSClickLink
id (Rid"#
C2GSAuctionDetail
id (Rid
Ω
client/warehouse.proto"'
C2GSSwitchWareHouse
wid (Rwid"
C2GSBuyWareHouse";
C2GSRenameWareHouse
wid (Rwid
name (	Rname"B
C2GSWareHouseWithStore
wid (Rwid
itemid (Ritemid";
C2GSWareHouseWithDraw
wid (Rwid
pos (Rpos"(
C2GSWareHouseArrange
wid (Rwid
^
client/recovery.proto""
C2GSRecoveryItem
id (Rid"!
C2GSRecoverySum
id (Rid
–
client/redpacket.protobase/common.proto"n

C2GSSendRP
bless (	Rbless
goldcoin (Rgoldcoin
count (Rcount
channel (Rchannel"
	C2GSRobRP
id (Rid"(
C2GSQueryAll
channel (Rchannel" 
C2GSQueryBasic
id (Rid"
C2GSQueryHistory"A
C2GSUseRPItem
itemid (Ritemid
channel (Rchannel"s
C2GSActiveSendSYS
index (Rindex
goldcoin (Rgoldcoin
bless (	Rbless
amount (Ramount
·
client/item.proto"S
C2GSItemUse
itemid (Ritemid
target (Rtarget
exarg (	Rexarg"9
UseInfo
itemid (Ritemid
amount (Ramount"d
C2GSItemListUse#
use_list (2.UseInfoRuseList
target (Rtarget
exarg (	Rexarg"&
C2GSItemInfo
itemid (Ritemid"8
C2GSItemMove
itemid (Ritemid
pos (Rpos"
C2GSItemArrage"+
C2GSAddItemExtendSize
size (Rsize";
C2GSDeComposeItem
id (Rid
amount (Ramount"Z
C2GSComposeItem
id (Rid
amount (Ramount
compose_sid (R
composeSid"O
C2GSItemsExchangeItem

exchangeid (R
exchangeid
amount (Ramount"A
C2GSRecycleItem
itemid (Ritemid
amount (Ramount" 
C2GSFixEquip
pos (Rpos"%
C2GSMakeEquipInfo
sid (Rsid"5
C2GSMakeEquip
sid (Rsid
flag (Rflag"M
C2GSEquipStrength
pos (Rpos
flag (Rflag
fast (Rfast"+
C2GSWashEquipInfo
itemid (Ritemid";
C2GSWashEquip
itemid (Ritemid
flag (Rflag"*
C2GSUseWashEquip
itemid (Ritemid"$
C2GSMergeShenHun
sid (Rsid"^
C2GSUseShenHun
equip_id (RequipId

shenhun_id (R	shenhunId
flag (Rflag"$
C2GSStrengthInfo
pos (Rpos"p
C2GSCompoundItem
targetid (Rtargetid"
compoundtype (Rcompoundtype
	moneytype (R	moneytype"
C2GSFixAllEquips"6
C2GSEquipBreak
pos (Rpos
flag (Rflag"7
DeComposeInfo
id (Rid
amount (Ramount"=
C2GSDeComposeItemList$
items (2.DeComposeInfoRitems"+
C2GSRecFuHunPointReward
sid (Rsid"-
C2GSGetFuHunCost
equip_id (RequipId"6
C2GSSummonEquipResetSkill
equip_id (RequipId"0
C2GSSummonEquipCombine
itemid (Ritemid"D
C2GSHSCompose1
itemid (Ritemid
addradio (Raddradio"`
C2GSHSCompose2
itemid1 (Ritemid1
itemid2 (Ritemid2
addradio (Raddradio")
C2GSHSDeCompose
itemid (Ritemid"X
C2GSEquipAddHS
hunshiid (Rhunshiid
equipid (Requipid
pos (Rpos"<
C2GSEquipDelHS
equipid (Requipid
pos (Rpos"P
C2GSChangeHS
itemid (Ritemid
attr (	Rattr
color (Rcolor")
C2GSItemGoldCoinPrice
sid (Rsid"G
C2GSFastBuyItemPrice
sid (Rsid

store_type (R	storeType"=

CItemPrice
sid (Rsid

store_type (R	storeType"D
C2GSFastBuyItemListPrice(
	item_list (2.CItemPriceRitemList"(
C2GSWenShiMake
itemid (Ritemid"G
C2GSWenShiCombine
itemid1 (Ritemid1
itemid2 (Ritemid2"R
C2GSWenShiWash
itemid (Ritemid
locks (Rlocks
flag (Rflag
∞
client/jjc.proto"1
FighterInfo
type (Rtype
id (Rid".
TargetID
type (Rtype
id (Rid"
C2GSOpenJJCMainUI"3
C2GSSetJJCFormation
	formation (R	formation".
C2GSSetJJCSummon
summonid (Rsummonid"3
C2GSSetJJCPartner

partnerids (R
partnerids"=
C2GSQueryJJCTargetLineup!
target (2	.TargetIDRtarget"6
C2GSJJCStartFight!
target (2	.TargetIDRtarget"
C2GSJJCGetFightLog"
C2GSJJCBuyFightTimes"
C2GSJJCClearCD"
C2GSOpenChallengeUI"'
C2GSChooseChallenge
idx (Ridx"9
C2GSSetChallengeFormation
	formation (R	formation"4
C2GSSetChallengeSummon
summonid (Rsummonid"C
C2GSSetChallengeFighter(
fighters (2.FighterInfoRfighters"
C2GSResetChallengeTarget"7
C2GSStartChallenge!
target (2	.TargetIDRtarget"
C2GSGetChallengeReward">
C2GSChallengeTargetLineup!
target (2	.TargetIDRtarget"
C2GSReceiveFirstGift"
C2GSRefreshJJCTarget
˚
client/formation.protobase/common.proto"
C2GSAllFormationInfo"0
C2GSSingleFormationInfo
fmt_id (RfmtId"q
C2GSSetPlayerPosInfo
fmt_id (RfmtId
player_list (R
playerList!
partner_list (RpartnerList":
BookInfo
itemid (Ritemid
amount (Ramount"U
C2GSUpgradeFormation
fmt_id (RfmtId&
	book_list (2	.BookInfoRbookList
ß
client/npc.proto"$
C2GSClickNpc
npcid (Rnpcid">
C2GSNpcRespond
npcid (Rnpcid
answer (Ranswer"-
C2GSFindPathToNpc
npctype (Rnpctype
≈	
client/war.proto"Ü
C2GSWarSkill
war_id (RwarId!
action_wlist (RactionWlist!
select_wlist (RselectWlist
skill_id (RskillId"j
C2GSWarNormalAttack
war_id (RwarId

action_wid (R	actionWid

select_wid (R	selectWid"e
C2GSWarProtect
war_id (RwarId

action_wid (R	actionWid

select_wid (R	selectWid"E
C2GSWarEscape
war_id (RwarId

action_wid (R	actionWid"F
C2GSWarDefense
war_id (RwarId

action_wid (R	actionWid"\
C2GSWarSummon
war_id (RwarId

action_wid (R	actionWid
sum_id (RsumId"U
C2GSWarAutoFight
war_id (RwarId
type (Rtype
aitype (Raitype"c
C2GSChangeAutoPerform
war_id (RwarId
wid (Rwid!
auto_perform (RautoPerform"~
C2GSWarUseItem
war_id (RwarId

action_wid (R	actionWid

select_wid (R	selectWid
item_id (RitemId"y
C2GSWarCommand
war_id (RwarId

action_wid (R	actionWid

select_wid (R	selectWid
scmd (	Rscmd"X
C2GSWarCommandOP
war_id (RwarId

action_wid (R	actionWid
op (Rop"E
C2GSWarAnimationEnd
war_id (RwarId
bout_id (RboutId"
C2GSReEnterWar
∂
client/other.protobase/common.proto"
C2GSHeartBeat"
	C2GSGMCmd
cmd (	Rcmd"4

CommitItem
id (Rid
amount (Ramount"©
C2GSCallback

sessionidx (R
sessionidx
answer (Ranswer'
itemlist (2.CommitItemRitemlist

summonlist (R
summonlist
reenter (Rreenter"'
C2GSSetActive
active (Ractive"c
C2GSBigPacket
type (Rtype
total (Rtotal
index (Rindex
data (Rdata"`
C2GSQueryClientUpdateResD
res_file_version (2.base.ClientResFileVersionRresFileVersion")
C2GSOpSession
session (	Rsession"x
C2GSRequestPay
product_key (	R
productKey%
product_amount (RproductAmount
is_demi_sdk (R	isDemiSdk"'
C2GSUseRedeemCode
code (	Rcode"5
FeedBackPictureUrl
picture_url (	R
pictureUrl"Ë
C2GSFeedBackQuestion
type (Rtype
context (	Rcontext.
url_list (2.FeedBackPictureUrlRurlList
qq_no (	RqqNo
phone_no (	RphoneNo
net_type (	RnetType'
signal_strength (RsignalStrength"
C2GSFeedBackSetCheckState
˙
client/mail.protobase/common.proto"&
C2GSOpenMail
mailid (Rmailid"*
C2GSAcceptAttach
mailid (Rmailid"
C2GSAcceptAllAttach"*
C2GSDeleteMail
mailids (Rmailids";
C2GSDeleteAllMail&
cnt_only_client (RcntOnlyClient
J
client/title.proto"4
C2GSUseTitle
tid (Rtid
flag (Rflag
…
client/org.proto"'
C2GSOrgList
version (Rversion"#
C2GSSearchOrg
text (	Rtext"5
C2GSCreateOrg
name (	Rname
aim (	Raim"<
C2GSApplyJoinOrg
orgid (Rorgid
flag (Rflag"
C2GSMultiApplyJoinOrg"
C2GSReadyOrgList"(
C2GSReadyOrgInfo
orgid (Rorgid":
C2GSRespondOrg
orgid (Rorgid
flag (Rflag"
C2GSMultiRespondOrg"%
C2GSOrgMainInfo
flag (Rflag"-
C2GSOrgMemberList
version (Rversion"*
C2GSOrgApplyJoinList
flag (Rflag"8
C2GSOrgDealApply
pid (Rpid
deal (Rdeal"
C2GSAgreeAllApply"B
C2GSOrgSetPosition
pid (Rpid
position (Rposition"
C2GSLeaveOrg")
C2GSRequestOrgAim
orgid (Rorgid"
C2GSSpreadOrg"!
C2GSUpdateAim
aim (	Raim""
C2GSKickMember
pid (Rpid"
C2GSApplyOrgLeader"'
C2GSVoteOrgLeader
flag (Rflag"#
C2GSInvited2Org
pid (Rpid";
C2GSDealInvited2Org
pid (Rpid
flag (Rflag"
C2GSClearApplyAndRespond")
C2GSGetOnlineMember
flag (Rflag"
C2GSGetBuildInfo"$
C2GSUpGradeBuild
bid (Rbid"<
C2GSQuickBuild
bid (Rbid
quickid (Rquickid"
C2GSGetShopInfo"7
C2GSBuyItem
itemid (Ritemid
cnt (Rcnt"
C2GSGetBoonInfo"
C2GSOrgSign
msg (	Rmsg"
C2GSReceiveBonus"
C2GSReceivePosBonus"
C2GSGetAchieveInfo"*
C2GSReceiveAchieve
achid (Rachid"
C2GSEnterOrgScene")
C2GSNextPageLog
lastid (Rlastid"7
C2GSChatBan
banid (Rbanid
flag (Rflag".
C2GSClickOrgBuild
build_id (RbuildId"%
C2GSSetAutoJoin
flag (Rflag"
C2GSClearApplyList"
C2GSOrgPrestigeInfo"+
C2GSSendOrgMail
context (	Rcontext")
C2GSRenameNormalOrg
name (	Rname
Â
client/engage.proto")
C2GSEngageCondition
type (Rtype"%
C2GSStartEngage
type (Rtype")
C2GSConfirmEngage
agree (Ragree"'
C2GSSetEngageText
text (	Rtext"
C2GSDissolveEngage"
C2GSCancelEngage
≈
client/scene.protobase/common.proto"m
C2GSSyncPosQueue
scene_id (RsceneId
eid (Reid,
poslist (2.base.PosQueueInfoRposlist"\
C2GSTransfer
scene_id (RsceneId
eid (Reid
transfer_id (R
transferId"W
C2GSClickWorldMap
scene_id (RsceneId
eid (Reid
map_id (RmapId"H
C2GSClickTrapMineMap
scene_id (RsceneId
map_id (RmapId",
C2GSStartWaterWalk
walkid (Rwalkid
Â
client/task.proto"'
C2GSClickTask
taskid (Rtaskid"=
C2GSTaskEvent
taskid (Rtaskid
npcid (Rnpcid"(
C2GSCommitTask
taskid (Rtaskid")
C2GSAbandonTask
taskid (Rtaskid"C
C2GSStepTask
taskid (Rtaskid
	rest_step (RrestStep">
C2GSAcceptTask
taskid (Rtaskid
npcid (Rnpcid"g
C2GSExtendTaskUIClick
taskid (Rtaskid

sessionidx (R
sessionidx
answer (Ranswer"+
C2GSYibaoSeekHelp
taskid (Rtaskid"b
C2GSYibaoGiveHelp
target (Rtarget
taskid (Rtaskid

create_day (R	createDay"d
C2GSYibaoHelpSubmit
target (Rtarget
taskid (Rtaskid

create_day (R	createDay"
C2GSYibaoAccept"2
C2GSRewardStoryChapter
chapter (Rchapter"W
C2GSAnimeQteEnd
anime_id (RanimeId
qte_id (RqteId
succ (Rsucc"0
C2GSRewardEverydayTask
taskid (Rtaskid"U
C2GSLingxiUseSeed
taskid (Rtaskid
put_x (RputX
put_y (RputY"2
C2GSLingxiCloseToGrowPos
taskid (Rtaskid"1
C2GSLingxiCloseToFlower
taskid (Rtaskid"2
C2GSLingxiAwayFromFlower
taskid (Rtaskid"`
C2GSLingxiQuestionAnswer
taskid (Rtaskid
round (Rround
answer (Ranswer"
C2GSAcceptBaotuTask"z
C2GSRunringGiveHelp
target (Rtarget
taskid (Rtaskid
create_week (R
createWeek
ring (Rring"
C2GSOpenXuanShangView"1
C2GSAcceptXuanShangTask
taskid (Rtaskid"9
C2GSRefreshXuanShang!
fastbuy_flag (RfastbuyFlag"e
C2GSXuanShangStarTip
confirm (Rconfirm
tip (Rtip!
fastbuy_flag (RfastbuyFlag",
C2GSZhenmoEnterLayer
layer (Rlayer"
C2GSZhenmoSpecialReward"(
C2GSZhenmoPlayAnim
anim (Ranim"
C2GSZhenmoOpenView
™
client/wing.proto"
C2GSWingWield",
C2GSWingUpStar
goldcoin (Rgoldcoin"-
C2GSWingUpLevel
goldcoin (Rgoldcoin")
C2GSActiveWing
wing_id (RwingId">
C2GSAddWingTime
wing_id (RwingId
time (Rtime"*
C2GSSetShowWing
wing_id (RwingId"
C2GSOpenWingUI
÷
client/rank.proto"7
C2GSGetRankInfo
idx (Ridx
page (Rpage"#
C2GSGetRankTop3
idx (Ridx"'
C2GSGetUpvoteAmount
pid (Rpid":
C2GSGetRankSumInfo
idx (Ridx
rank (Rrank
,
client/touxian.proto"
C2GSUpgradeTouxian
ë
client/stall.proto"o
C2GSAddSellItem
pos_id (RposId
item_id (RitemId
amount (Ramount
price (Rprice"Q
SellItem
item_id (RitemId
amount (Ramount
price (Rprice"=
C2GSAddSellItemList&
	item_list (2	.SellItemRitemList"
C2GSAddOverTimeItem"A
C2GSResetItemPrice
pos_id (RposId
price (Rprice"8
	PriceUnit
pos_id (RposId
price (Rprice"A
C2GSResetItemListPrice'
	item_list (2
.PriceUnitRitemList"C
C2GSRemoveSellItem
pos_id (RposId
amount (Ramount"
C2GSWithdrawAllCash",
C2GSWithdrawOneGrid
pos_id (RposId"
C2GSUnlockGrid"W
C2GSBuySellItem
cat_id (RcatId
pos_id (RposId
amount (Ramount"B
C2GSSellItemDetail
cat_id (RcatId
pos_id (RposId"
C2GSOpenStall"m
C2GSOpenCatalog
cat_id (RcatId
page (Rpage
first (Rfirst
item_sid (RitemSid"?
C2GSRefreshCatalog
cat_id (RcatId
gold (Rgold"'
C2GSGetDefaultPrice
sid (Rsid
¡
client/friend.proto"3
C2GSQueryFriendProfile
pid_list (RpidList"g

C2GSChatTo
pid (Rpid
msg (	Rmsg

message_id (	R	messageId
forbid (Rforbid"B
C2GSAckChatFrom
pid (Rpid

message_id (	R	messageId"&
C2GSApplyAddFriend
pid (Rpid"&
C2GSApplyDelFriend
pid (Rpid"6
C2GSFindFriend
pid (Rpid
name (	Rname"$
C2GSFriendShield
pid (Rpid"&
C2GSFriendUnshield
pid (Rpid"Å
C2GSSendFlower
pid (Rpid
type (Rtype
amount (Ramount
bless (	Rbless
	sys_bless (RsysBless"(
C2GSOpenSendFlowerUI
pid (Rpid"6
C2GSVerifyFriend
pid (Rpid
msg (	Rmsg"C
C2GSVerifyFriendComfirm
pid (Rpid
result (Rresult"G
C2GSQueryPlayerProfile
pid_list (RpidList
flag (Rflag
¯
client/login.protobase/common.proto"ä
C2GSLoginAccount
account (	Raccount
pwd (	Rpwd
token (	Rtoken
device (	Rdevice
platform (Rplatform
mac (	Rmac
app_ver (	RappVer
imei (	Rimei
os	 (	Ros

client_ver
 (	R	clientVer
udid (	Rudid"X
C2GSRegistAccount
account (	Raccount
pwd (	Rpwd
app_ver (	RappVer"=
C2GSLoginVerify
account (	Raccount
pwd (	Rpwd"7
C2GSLoginRole
pid (Rpid
force (Rforce"x
C2GSCreateRole
	role_type (RroleType
name (	Rname
school (Rschool

server_key (	R	serverKey"
C2GSQuitLoginQueue"
C2GSGetLoginWaitInfo"[
C2GSReLoginRole
pid (Rpid

role_token (	R	roleToken
app_ver (	RappVer"4
C2GSSetInviteCode
invite_code (	R
inviteCode"V
C2GSQueryLoginD
res_file_version (2.base.ClientResFileVersionRresFileVersion"ÿ
C2GSGMLoginPid
pid (Rpid
device (	Rdevice
platform (Rplatform
mac (	Rmac
app_ver (	RappVer
imei (	Rimei
os (	Ros

client_ver (	R	clientVer
udid	 (	Rudid"ç
C2GSKSLoginRole
pid (Rpid
token (	Rtoken
	serverkey (	R	serverkey
device (	Rdevice
platform (Rplatform
mac (	Rmac
app_ver (	RappVer
imei (	Rimei
os	 (	Ros

client_ver
 (	R	clientVer
udid (	Rudid"Ò
C2GSBackLoginRole
pid (Rpid
token (	Rtoken
device (	Rdevice
platform (Rplatform
mac (	Rmac
app_ver (	RappVer
imei (	Rimei
os (	Ros

client_ver	 (	R	clientVer
udid
 (	Rudid
R
client/tempitem.proto"#
C2GSTranToItemBag
id (Rid"
C2GSOpenTempItemUI
¸
server/vigor.proto";
	VigorGrid
timeout (Rtimeout
value (Rvalue"ñ
	VigorItem"
is_change_all (RisChangeAll
	grid_size (RgridSize
change_type (R
changeType'
	grid_info (2
.VigorGridRgridInfo"_
GS2CVigorChangeInfo
vigor_value (R
vigorValue'
	list_info (2
.VigorItemRlistInfo"W
GS2CVigorItemGetNewGrid
change_type (R
changeType
	grid_size (RgridSize"B
GS2CVigorItemGetProduct'
	item_info (2
.VigorItemRitemInfo"N

HasProduct
change_type (R
changeType
grid_amount (R
gridAmount"K
GS2CVigorItemHasProduct0
products_info (2.HasProductRproductsInfo"
GS2CVigorRedPoint"`
GS2CVigorChangeItemStatus"
is_change_all (RisChangeAll
change_type (R
changeType
€
server/test.protobase/common.proto"}
GS2CTestNet
a (Ra
b (Rb
c (Rc
d (Rd
e (	Re
f (	Rf
g (	Rg
h (	Rh"!
GS2CTestBigPacket
s (	Rs"@
GS2CTestOnlineUpdate
a (Ra
b (	Rb
c (Rc"!
GS2CTestOnlineAdd
a (Ra",
GS2CTestEncode
a (Ra
b (	Rb
˛
server/fabao.proto"É
	FaBaoInfo
id (Rid
fabao (Rfabao
equippos (Requippos
level (Rlevel
exp (Rexp
xianling (Rxianling)
	skilllist (2.FaBaoSkillR	skilllist/
promotelist (2.FaBaoPromoteRpromotelist
score	 (Rscore"D

FaBaoSkill
sk (Rsk
level (Rlevel
exp (Rexp"<
FaBaoPromote
attr (	Rattr
promote (Rpromote"0
GS2CAddFaBao 
fabao (2
.FaBaoInfoRfabao"!
GS2CRemoveFaBao
id (Rid"4
GS2CRefreshFaBao 
fabao (2
.FaBaoInfoRfabao"8
GS2CAllFaBao(
	fabaolist (2
.FaBaoInfoR	fabaolist"f
GS2CWieldFaBao
wield_id (RwieldId

unwield_id (R	unwieldId
equippos (Requippos"1
GS2CUnWieldFaBao

unwield_id (R	unwieldId
¿
server/marry.protobase/common.proto"B
GS2CMarryPayUI
seconds (Rseconds
status (Rstatus"
GS2CMarryCancel"
GS2CSuccessDivorce"
GS2CPickItemXT"£
MarryPlayer
pid (Rpid
name (	Rname
grade (Rgrade
school (Rschool
sex (Rsex.

model_info (2.base.ModelInfoR	modelInfo"‡
GS2CMarryWedding
marry_no (RmarryNo&
player1 (2.MarryPlayerRplayer1&
player2 (2.MarryPlayerRplayer2

marry_type (R	marryType!
wedding_time (RweddingTime
wedding_sec (R
weddingSec"0
GS2CMarryWeddingEnd
marry_no (RmarryNo"
GS2CTeamShowWedding"F
GS2CMarryConfirmUI
seconds (Rseconds
status (Rstatus
—
server/yunying.proto"É
YunYingForeShow
channel (Rchannel
showname (	Rshowname
picture_url (	R
pictureUrl
link_url (	RlinkUrl"D
GS2CYunYingForeShow-
	show_list (2.YunYingForeShowRshowList"m
GS2CCustServInfo
channel (Rchannel
platform (Rplatform#
official_info (	RofficialInfo
ê
server/team.protobase/common.proto"π
	ApplyInfo
pid (Rpid
name (	Rname.

model_info (2.base.ModelInfoR	modelInfo
school (Rschool
grade (Rgrade
icon (Ricon
orgid (Rorgid"Ü

TargetInfo
auto_target (R
autoTarget
	min_grade (RminGrade
	max_grade (RmaxGrade

team_match (R	teamMatch"è
TeamInfo
teamid (Rteamid
leader (Rleader%
member (2.base.TeamMemRmember,
target_info (2.TargetInfoR
targetInfo"Ã
TargetTeamInfo
teamid (Rteamid
leader (Rleader
status (Rstatus%
member (2.base.TeamMemRmember,
target_info (2.TargetInfoR
targetInfo

match_time (R	matchTime"9
TeamMemStatus
pid (Rpid
status (Rstatus"˜
GS2CAddTeam
teamid (Rteamid
leader (Rleader%
member (2.base.TeamMemRmember,
target_info (2.TargetInfoR
targetInfo/
partner_list (2.TeamPartnerRpartnerList
fmt_id (RfmtId
	fmt_grade (RfmtGrade"
GS2CDelTeam"=
GS2CAddTeamMember(
mem_info (2.base.TeamMemRmemInfo"H
GS2CRefreshTeamStatus/
team_status (2.TeamMemStatusR
teamStatus"_
GS2CRefreshMemberInfo
pid (Rpid4
status_info (2.base.MemStatusInfoR
statusInfo"R
GS2CTeamApplyInfo)

apply_info (2
.ApplyInfoR	applyInfo
open (Ropen"(
GS2CDelTeamApplyInfo
pid (Rpid"A
GS2CAddTeamApplyInfo)

apply_info (2
.ApplyInfoR	applyInfo"M
GS2CInviteInfo%
teaminfo (2	.TeamInfoRteaminfo
login (Rlogin"*
GS2CRemoveInvite
teamid (Rteamid":
GS2CAddInviteInfo%
teaminfo (2	.TeamInfoRteaminfo">
GS2CTargetInfo,
target_info (2.TargetInfoR
targetInfo"Y
GS2CNotifyAutoMatch!
player_match (RplayerMatch
auto_target (R
autoTarget"A
GS2CTargetTeamInfo+
teaminfo (2.TargetTeamInfoRteaminfo"f
GS2CTargetTeamInfoList+
teaminfo (2.TargetTeamInfoRteaminfo
auto_target (R
autoTarget"w
GS2CCountAutoMatch
auto_target (R
autoTarget!
member_count (RmemberCount

team_count (R	teamCount"0
GS2CLeaderActiveStatus
active (Ractive"F
GS2CTargetTeamStatus
teamid (Rteamid
status (Rstatus"*
GS2CRefreshTeamAppoint
pid (Rpid"0
WarCmd
type (Rtype
cmds (	Rcmds"<
GS2CRefreshDelWarCmd
type (Rtype
pos (Rpos"6
GS2CRefreshWarCmd!
warcmds (2.WarCmdRwarcmds"O
GS2CRefreshTeamWarCmd
type (Rtype
pos (Rpos
cmd (	Rcmd"P
GS2CInviteeStatus
target (Rtarget#
target_status (RtargetStatus"u
TeamPartner
id (Rid
sid (Rsid
grade (Rgrade.

model_info (2.base.ModelInfoR	modelInfo"W
GS2CGetTeamAllPos
player_list (R
playerList!
partner_list (RpartnerList"C
GS2CTeamPartners/
partner_list (2.TeamPartnerRpartnerList"G
GS2CTeamLeaderFmt
fmt_id (RfmtId
	fmt_grade (RfmtGrade"ç
GS2CButtonState
leave (Rleave
kick (Rkick

shortleave (R
shortleave
back (Rback
	setleader (R	setleader
ï
server/player.protobase/common.proto"J
PropInfo
extra (Rextra
ratio (Rratio
name (	Rname"0
GS2CPropChange
role (2
.base.RoleRrole"m
GS2CServerGradeInfo!
server_grade (RserverGrade
days (Rdays
server_type (	R
serverType"ê
GS2CUpdateStrengthenInfo
mask (	Rmask=
strengthen_info (2.base.StrengthenInfoRstrengthenInfo!
master_score (RmasterScore"•
GS2CGetPlayerInfo
grade (Rgrade
name (	Rname.

model_info (2.base.ModelInfoR	modelInfo
school (Rschool
team_id (RteamId
	team_size (RteamSize
pid (Rpid
org_id (RorgId
org_name	 (	RorgName
	org_level
 (RorgLevel
org_pos (RorgPos
position (	Rposition#
position_hide (RpositionHide
icon (Ricon
org_chat (RorgChat"|
GS2CLoginPointPlanInfoList#
selected_plan (RselectedPlan9
wash_info_list (2.base.WashPointInfoRwashInfoList"E
GS2CPointPlanInfo0
	wash_info (2.base.WashPointInfoRwashInfo"{
GS2CWashPoint*
remain_wash_point (RremainWashPoint
	prop_name (	RpropName!
remain_point (RremainPoint";
GS2CGetSecondProp&
	prop_info (2	.PropInfoRpropInfo"R
GS2CPlayerItemInfo
pid (Rpid*
itemdata (2.base.ItemInfoRitemdata"Z
GS2CPlayerSummonInfo
pid (Rpid0

summondata (2.base.SummonInfoR
summondata"^
GS2CPlayerPartnerInfo
pid (Rpid3
partnerdata (2.base.PartnerInfoRpartnerdata"Ÿ
GS2CNameCardInfo
pid (Rpid
name (	Rname.

title_info (2.base.TitleInfoR	titleInfo
grade (Rgrade#
upvote_amount (RupvoteAmount
isupvote (Risupvote
orgname (	Rorgname
partner (	Rpartner
achieve	 (Rachieve
score
 (Rscore
position (	Rposition#
position_hide (RpositionHide
school (Rschool
rank (Rrank
show_id (RshowId.

model_info (2.base.ModelInfoR	modelInfo"<
GS2CPlayerUpvoteInfo$
info (2.base.SimpleRoleRinfo",
GS2CUpvotePlayer
succuss (Rsuccuss":
UpvoteReward
idx (Ridx
success (Rsuccess"8
GS2CAllUpvoteReward!
info (2.UpvoteRewardRinfo"5
GS2CUpvoteReward!
info (2.UpvoteRewardRinfo"s
GlobalNpcAppearence
npctype (Rnpctype
reset (Rreset
figure (Rfigure
title (	Rtitle"ß
GS2CLoginVisibility#
npcs (2.base.ValueInfoRnpcs4
scene_effects (2.base.ValueInfoRsceneEffects5
npc_appears (2.GlobalNpcAppearenceR
npcAppears"®
GS2CChangeVisibility#
npcs (2.base.ValueInfoRnpcs4
scene_effects (2.base.ValueInfoRsceneEffects5
npc_appears (2.GlobalNpcAppearenceR
npcAppears"%
GS2CSetGhostEye
open (Ropen"'
GS2CLoginGhostEye
open (Ropen"`
GS2CShowNpcCloseup
npctype (Rnpctype
parnter (Rparnter
summon (Rsummon"™
GS2CPromote
radio (Rradio
score (Rscore
sumscore (Rsumscore
result (Rresult
open (Ropen'
reference_score (RreferenceScore"O
GS2CSysConfig
on_off (RonOff'
values (2.base.ValueInfoRvalues"4
GS2CLoginGradeGiftInfo
rewarded (Rrewarded"+
GS2CRewardGradeGift
grade (Rgrade"6
GS2CLoginPreopenGiftInfo
rewarded (Rrewarded".
GS2CRewardPreopenGift
sys_id (RsysId"4
GS2CGetScore
op (Rop
score (Rscore"9
GS2COpenRanSe
type (Rtype
color (Rcolor"(
GS2CSyncTesterKeys
keys (	Rkeys"=
GS2CGamePushConfig'
values (2.base.ValueInfoRvalues"ù
	ShiZhuang
sz (Rsz

curclothes (R
curclothes
curhair (Rcurhair
curpant (Rcurpant
forever (Rforever
time (Rtime"8
GS2CRefreshShiZhuang 
szobj (2
.ShiZhuangRszobj"6
GS2CAllShiZhuang"
szlist (2
.ShiZhuangRszlist"T
GS2CAssistExp

assist_exp (R	assistExp$
max_assist_exp (RmaxAssistExp"8
GS2CLoginShiZhuang"
szlist (2
.ShiZhuangRszlist
ã	
server/ride.protobase/common.proto"m
RideSkillInfo
sk (Rsk
level (Rlevel
type (Rtype
row (Rrow
col (Rcol"3
PosInfo
pos (Rpos
summon (Rsummon"‡
RideInfo
ride_id (RrideId
got_time (RgotTime
	left_time (RleftTime"
summons (2.PosInfoRsummons&
wenshi (2.base.ItemInfoRwenshi
skill (Rskill!
skill_effect (RskillEffect"Ã
PlayerRideInfo
mask (	Rmask
grade (Rgrade
exp (Rexp
point (Rpoint
use_ride (RuseRide#
choose_skills (RchooseSkills
learn_sk (RlearnSk&
skills (2.RideSkillInfoRskills(

ride_infos	 (2	.RideInfoR	rideInfos%
attrs
 (2.base.ApplyInfoRattrs
score (Rscore"9
GS2CPlayerRideInfo#
info (2.PlayerRideInfoRinfo"5
GS2CAddRide&
	ride_info (2	.RideInfoRrideInfo")
GS2CDeleteRide
ride_id (RrideId"8
GS2CUpdateRide&
	ride_info (2	.RideInfoRrideInfo",
GS2CUpdateUseRide
ride_id (RrideId"+
GS2CShowRandomSkill
skill (Rskill"[
GS2CResetSKillInfo
cost_exp (RcostExp
grade (Rgrade
point (Rpoint
¯
server/partner.protobase/common.proto"t
GS2CLoginPartner-
partners (2.base.PartnerInfoRpartners
lineup (Rlineup
pos_list (RposList"b
GS2CPartnerPropChange
	partnerid (R	partnerid+
partner (2.base.PartnerInfoRpartner"=
GS2CAddPartner+
partner (2.base.PartnerInfoRpartner"V

LineupUnit
lineup (Rlineup
fmt_id (RfmtId
pos_list (RposList"U
GS2CAllLineupInfo
curr_lineup (R
currLineup
info (2.LineupUnitRinfo"X
GS2CSingleLineupInfo
curr_lineup (R
currLineup
info (2.LineupUnitRinfo"+
GS2CSetCurrLineup
lineup (Rlineup
‡
server/newbieguide.protobase/common.proto".
GS2CSysOpenNotified
sys_ids (	RsysIds"~
GS2CNewbieGuideInfo4
guide_links (2.base.GuideLinkInfoR
guideLinks
exdata (	Rexdata
no_guide (RnoGuide"N
GS2CNewibeSummonGot
succ (Rsucc#
had_selection (RhadSelection"1
GS2CGetNewbieGuildInfo
org_cnt (RorgCnt
Ù+
server/openui.protobase/common.protoclient/openui.proto"f

GS2CLoadUI

sessionidx (R
sessionidx
type (Rtype
tip (Rtip
time (Rtime"_
GS2CPopTaskItem

sessionidx (R
sessionidx
taskid (Rtaskid
owner (Rowner"a
GS2CPopTaskSummon

sessionidx (R
sessionidx
taskid (Rtaskid
owner (Rowner"c
GS2COpenShopForTask

sessionidx (R
sessionidx
taskid (Rtaskid
owner (Rowner"d
GS2CHelpTaskGiveItem

sessionidx (R
sessionidx
taskid (Rtaskid
owner (Rowner""
GS2CShortWay
type (Rtype"â
GS2CConfirmUI

sessionidx (R
sessionidx
sContent (	RsContent
sConfirm (	RsConfirm
sCancle (	RsCancle
time (Rtime
default (Rdefault!
extend_close (RextendClose
replace (Rreplace
	close_btn	 (RcloseBtn"~
HuodongState

scheduleid (R
scheduleid
state (Rstate
time (	Rtime$
opentimestamp (Ropentimestamp"Ç
ScheduleInfo

scheduleid (R
scheduleid
times (Rtimes 
activepoint (Ractivepoint
maxtimes (Rmaxtimes"˝
GS2CSchedule%
hdlist (2.HuodongStateRhdlist+
	schedules (2.ScheduleInfoR	schedules 
activepoint (Ractivepoint
	rewardidx (R	rewardidx
curtime (Rcurtime
db_point (RdbPoint$
db_point_limit (RdbPointLimit"E
SchedulePerHour
time (	Rtime

scheduleid (R
scheduleid"^
SchedulePerDay
weekday (Rweekday2
daychedules (2.SchedulePerHourRdaychedules"G
GS2CWeekSchedule3
weekschedule (2.SchedulePerDayRweekschedule"5
GS2CGetScheduleReward
	rewardidx (R	rewardidx"'
GS2COpenShop
shop_id (RshopId"b
GS2CRefreshSchedule)
schedule (2.ScheduleInfoRschedule 
activepoint (Ractivepoint" 

GS2CXunLuo
type (Rtype"
GS2COpenCultivateUI"4
GS2CCloseConfirmUI

sessionidx (R
sessionidx"Y
GS2CRefreshDoublePoint
db_point (RdbPoint$
db_point_limit (RdbPointLimit"@
GS2CRefreshHuodongState%
hdlist (2.HuodongStateRhdlist"C
GS2CRefreshAllHuodongState%
hdlist (2.HuodongStateRhdlist"5
GS2COpenScheduleUI
schedule_id (R
scheduleId":
GS2COpenTeamAutoMatchUI
auto_target (R
autoTarget"ü
YibaoTaskInfo
taskid (Rtaskid
name (	Rname*
needitem (2.base.NeedItemRneeditem
star (RstarB
valuereward_preview (2.base.ValueRewardRvaluerewardPreview?
itemreward_preview (2.base.ItemRewardRitemrewardPreview

yibao_kind (R	yibaoKind"ÿ
GS2COpenYibaoUI
mask (	Rmask
owner (Rowner

create_day (R	createDay*
seek_gather_tasks (RseekGatherTasks&
seek_gather_max (RseekGatherMax6
done_yibao_info (2.YibaoTaskInfoRdoneYibaoInfo8
doing_yibao_info (2.YibaoTaskInfoRdoingYibaoInfo6
main_yibao_info (2.YibaoTaskInfoRmainYibaoInfo"Q
GS2CYibaoTaskDone
taskid (Rtaskid$
is_gather_help (RisGatherHelp"E
GS2CYibaoTaskRefresh-

yibao_info (2.YibaoTaskInfoR	yibaoInfo"/
GS2CYibaoSeekHelpSucc
taskid (Rtaskid"
GS2COpenArenaUI"
GS2COpenOrgUI"$
GS2COpenOrgBuild
bid (Rbid"w
GS2CPlayQte

sessionidx (R
sessionidx
qteid (Rqteid
lasts (Rlasts
	forthdone (R	forthdone"J
GS2CPlayAnime

sessionidx (R
sessionidx
anime_id (RanimeId"
GS2COpenEquipMake"W
GS2CPlayLottery

sessionidx (R
sessionidx
type (Rtype
idx (Ridx"&
GS2COpenFBChoice
flag (Rflag"4
GS2CCloseFBComfirm

sessionidx (R
sessionidx"F
GS2CFBComfirmEnter

sessionidx (R
sessionidx
pid (Rpid"8
FBComfirmState
pid (Rpid
state (Rstate"Ä
GS2CFBComfirm
fuben (Rfuben
time (Rtime%
plist (2.FBComfirmStateRplist

sessionidx (R
sessionidx"á
GS2CRefreshFBComfirm
fuben (Rfuben
time (Rtime%
plist (2.FBComfirmStateRplist

sessionidx (R
sessionidx"@
FBRewardItem
itemsid (Ritemsid
amount (Ramount"·

GS2CFBOver
fuben (Rfuben
exp (Rexp
expradio (Rexpradio
silver (Rsilver 
silverradio (Rsilverradio
level (	Rlevel
point (Rpoint)
itemlist (2.FBRewardItemRitemlist"
GS2CMaintainUI",
GS2COpenAdvanceMap
itemid (Ritemid"[
GS2COpenBoxUI
box_sid (RboxSid1
reward_item (2.base.ItemRewardR
rewardItem"P
GS2CQuickBuyItemUI
sid (Rsid
amount (Ramount
msg (	Rmsg"(
GS2CQuickBuyItemSucc
sid (Rsid"D
GS2CCustomShowItem
flag (Rflag
itemlist (Ritemlist"6
GS2CCloseProgressBar

sessionidx (R
sessionidx"»
GS2CShowProgressBar

sessionidx (R
sessionidx
msg (	Rmsg
sec (Rsec
	start_sec (RstartSec(
uninterruptable (Runinterruptable
modal (Rmodal
pos (Rpos"A
GS2CRemoveConfirmUI
msg (	Rmsg
session (Rsession"/
GS2CGuideBehavior
behavior (Rbehavior"c
GS2CExchangeMoney
	moneytype (R	moneytype
goldcoin (Rgoldcoin
value (Rvalue"@
ExchangeItem
itemsid (Ritemsid
amount (Ramount"Ä
GS2CExecAfterExchange
	moneytype (R	moneytype
goldcoin (Rgoldcoin

moneyvalue (R
moneyvalue)
itemlist (2.ExchangeItemRitemlist

sessionidx (R
sessionidx.
exchangemoneyvalue (Rexchangemoneyvalue
flag (Rflag"G
FubenReward
fuben_id (RfubenId

reward_cnt (R	rewardCnt"J
GS2CRefreshFubenRewardCnt-
reward_list (2.FubenRewardR
rewardList"$
GS2CShowIntruction
id (Rid
Ù
server/mentoring.protobase/common.proto"A
Option
question_id (R
questionId
answer (Ranswer"X
GS2CMentoringStartAnswer
type (Rtype(
option_list (2.OptionR
optionList"S
GS2CMentoringRecommendMentor3
mentor_list (2.base.SimplePlayerR
mentorList">
TaskUnit
task_id (RtaskId
task_cnt (RtaskCnt"H

RewardUnit
	reward_id (RrewardId

reward_cnt (R	rewardCnt"§
GS2CMentoringTask&
	task_list (2	.TaskUnitRtaskList
progress (Rprogress,
reward_list (2.RewardUnitR
rewardList
key (	Rkey&
	step_list (2	.StepUnitRstepList!
target_grade (RtargetGrade!
target_score (RtargetScore

growup_num (R	growupNum"V
StepUnit
step_id (RstepId
status (Rstatus
step_cnt (RstepCnt"L
GS2CMentorEvalutaion
grade (Rgrade

sessionidx (R
sessionidx
◊
server/guild.proto"ô
GS2CItemUnit
sid (Rsid
amount (Ramount
price (Rprice
up_flag (RupFlag
good_id (RgoodId
has_buy (RhasBuy"`
GS2COpenGuild
cat_id (RcatId
sub_id (RsubId!
data (2.GS2CItemUnitRdata"C
GS2CGuildItemPrice
good_id (RgoodId
price (Rprice
œ
server/shop.proto"I
	ShopMoney
	moneytype (R	moneytype

moneyvalue (R
moneyvalue"Ù
ShopGood
goodid (Rgoodid
itemsid (Ritemsid
discount (Rdiscount
	dayamount (R	dayamount

weekamount (R
weekamount 
money (2
.ShopMoneyRmoney
limit (Rlimit$
foreveramount (Rforeveramount"D
GS2CRefreshGood
shop (Rshop
good (2	.ShopGoodRgood"J
GS2CEnterShop
shop (Rshop%
goodlist (2	.ShopGoodRgoodlist"E
RewardMoney
source (Rsource

moneyvalue (R
moneyvalue"û
GS2CDailyRewardMoneyInfo
	moneytype (R	moneytype,
dailyrewardamount (Rdailyrewardamount6
rewardmoneylist (2.RewardMoneyRrewardmoneylist
™
server/chat.protobase/common.proto"º
RoleInfo
pid (Rpid
grade (Rgrade
name (	Rname
icon (Ricon
position (Rposition
honor (Rhonor.

title_info (2.base.TitleInfoR	titleInfo"X
GS2CChat
cmd (	Rcmd
type (Rtype&
	role_info (2	.RoleInfoRroleInfo"â
GS2CChatHistory(

world_chat (2	.GS2CChatR	worldChat$
org_chat (2	.GS2CChatRorgChat&
	team_chat (2	.GS2CChatRteamChat"a
GS2CSysChat
tag_type (RtagType
content (	Rcontent

horse_race (R	horseRace">
GS2CConsumeMsg
type (Rtype
content (	Rcontent"\
GS2CChuanYin
type (Rtype
cmd (	Rcmd&
	role_info (2	.RoleInfoRroleInfo"2

ForbidInfo
id (Rid
words (	Rwords":
GS2CAllForbinInfo%
forbids (2.ForbidInfoRforbids":
GS2CAddForbinInfo%
forbids (2.ForbidInfoRforbids"0
GS2CRemoveForbinInfo
forbids (Rforbids
ö
server/state.proto"ñ
	StateInfo
state_id (RstateId
time (Rtime
name (	Rname
desc (	Rdesc
data (2
.StateAttrRdata
hide (	Rhide"3
	StateAttr
key (	Rkey
value (Rvalue";
GS2CLoginState)

state_info (2
.StateInfoR	stateInfo"9
GS2CAddState)

state_info (2
.StateInfoR	stateInfo",
GS2CRemoveState
state_id (RstateId"=
GS2CRefreshState)

state_info (2
.StateInfoR	stateInfo"=
GS2CAddBaoShi
count (Rcount
sliver (Rsliver"
GS2CBaoShiSilver
∏
server/kuafu.proto"}
GS2CTryEnterKS
host (	Rhost
port (Rport
errcode (Rerrcode
pid (Rpid
gs_host (	RgsHost"#
GS2CTryBackGS
host (	Rhost
—
server/bulletbarrage.proto"{
GS2CWarBulletBarrage
war_id (RwarId
bout (Rbout
secs (Rsecs
name (	Rname
msg (	Rmsg"R
GS2COrgBulletBarrage
orgid (Rorgid
name (	Rname
msg (	Rmsg"9
BulletBarrageBase
name (	Rname
msg (	Rmsg"I
BulletBarrage
sec (Rsec&
base (2.BulletBarrageBaseRbase"H
WarBulletBarrage
bout (Rbout 
lst (2.BulletBarrageRlst"r
GS2CWarBulletBarrageData
war_id (RwarId
type (Rtype+
barrage (2.WarBulletBarrageRbarrage"Y
GS2CStoryBulletBarrageData
story_id (RstoryId 
lst (2.BulletBarrageRlst"C
GS2CWarInfoBulletBarrage
war_id (RwarId
msg (	Rmsg
‰
server/notify.proto"

GS2CNotify
cmd (	Rcmd"I
GS2CWarNotify
cmd (	Rcmd
type (Rtype
flag (Rflag"N
GS2CItemNotify
sid (Rsid
amount (Ramount
type (Rtype"P
GS2CSummonNotify
sid (Rsid
amount (Ramount
type (Rtype"@
GS2CUIEffectNotify
effect (Reffect
cmds (	Rcmds
Õ
server/sysopen.proto"-
GS2CLoginOpenSys
open_sys (	RopenSys"3
SysOpenInfo
sys (	Rsys
open (Ropen";
GS2COpenSysChange&
changes (2.SysOpenInfoRchanges"Y
SysSwitchInfo
systype (Rsystype
channel (Rchannel
state (Rstate"9
GS2CSysSwitch(
syslist (2.SysSwitchInfoRsyslist
ı	
server/artifact.proto"0
AttrUnit
attr (	Rattr
val (Rval"ñ

SpiritInfo
	spirit_id (RspiritId

skill_list (R	skillList$
bak_skill_list (RbakSkillList&
	attr_list (2	.AttrUnitRattrList"‡
Artifact
mask (	Rmask
id (Rid
exp (Rexp
grade (Rgrade
strength_lv (R
strengthLv!
strength_exp (RstrengthExp

phy_attack (R	phyAttack
phy_defense (R
phyDefense

mag_attack	 (R	magAttack
mag_defense
 (R
magDefense

cure_power (R	curePower
speed (Rspeed

seal_ratio (R	sealRatio$
res_seal_ratio (RresSealRatio,
phy_critical_ratio (RphyCriticalRatio3
res_phy_critical_ratio (RresPhyCriticalRatio,
mag_critical_ratio (RmagCriticalRatio3
res_mag_critical_ratio (RresMagCriticalRatio
score (Rscore!
fight_spirit (RfightSpirit#
follow_spirit (RfollowSpirit,
spirit_list (2.SpiritInfoR
spiritList$
phy_damage_add (RphyDamageAdd$
mag_damage_add (RmagDamageAdd
max_hp (RmaxHp
max_mp (RmaxMp"3
GS2COpenArtifactUI
info (2	.ArtifactRinfo"8
GS2CRefreshArtifactInfo
info (2	.ArtifactRinfo"?
GS2CRefreshOneSpiritInfo#
spirit (2.SpiritInfoRspirit
õ
server/skill.proto"Å
	SkillInfo
sk (Rsk
level (Rlevel
type (Rtype
	needmoney (R	needmoney
	needpoint (R	needpoint"m
CultivateSkillInfo
sk (Rsk
level (Rlevel
extra_level (R
extraLevel
exp (Rexp"4
OrgSkillInfo
sk (Rsk
level (Rlevel"h
ItemUseLimit
itemsid (Ritemsid
count_limit (R
countLimit

flag_limit (R	flagLimit"p
GS2CLoginSkill-
active_skill (2
.SkillInfoRactiveSkill/
passive_skill (2
.SkillInfoRpassiveSkill"=
GS2CRefreshSkill)

skill_info (2
.SkillInfoR	skillInfo"Î
GS2CAllCultivateSkill
role_sk (RroleSk

partner_sk (R	partnerSk2

skill_info (2.CultivateSkillInfoR	skillInfo

upperlevel (R
upperlevel
limit (Rlimit0
item_useinfo (2.ItemUseLimitRitemUseinfo"∑
GS2CRefreshCultivateSkill2

skill_info (2.CultivateSkillInfoR	skillInfo

upperlevel (R
upperlevel
limit (Rlimit0
item_useinfo (2.ItemUseLimitRitemUseinfo"'
GS2CSetCultivateSkill
sk (Rsk"P
GS2CRefreshSkillMaxLevel

upperlevel (R
upperlevel
limit (Rlimit";
GS2COrgSkills*
	org_skill (2.OrgSkillInfoRorgSkill"4
ItemInfo
itemid (Ritemid
cnt (Rcnt"2
GS2CUseOrgSkill
infos (2	.ItemInfoRinfos"4
FuZhuanSkill
sk (Rsk
level (Rlevel"C
GS2CAllFuZhuanSkill,

skill_list (2.FuZhuanSkillR	skillList"?
GS2CRefreshFuZhuanSkill
sk (Rsk
level (Rlevel";
GS2CMarrySkill)

skill_list (2
.SkillInfoR	skillList
°
server/store.proto"®
StoreItemInfo
item_id (RitemId 
week_buy_cnt (R
weekBuyCnt&
forever_buy_cnt (RforeverBuyCnt
day_buy_cnt (R	dayBuyCnt
limit (Rlimit"A
GS2CLoginStoreInfo+
	item_info (2.StoreItemInfoRitemInfo"B
GS2CUpdateStoreInfo+
	item_info (2.StoreItemInfoRitemInfo"Y
GS2CLimitTimeDiscountInfo!
discount_end (RdiscountEnd
show_tip (RshowTip
∂	
server/summon.protobase/common.proto"í
GS2CLoginSummon0

summondata (2.base.SummonInfoR
summondata
extsize (Rextsize
fightid (Rfightid
wash_cnt (RwashCnt"A
GS2CAddSummon0

summondata (2.base.SummonInfoR
summondata"5
GS2CDelSummon
id (Rid
newid (Rnewid"X
GS2CSummonPropChange
id (Rid0

summondata (2.base.SummonInfoR
summondata"$
GS2CSummonSetFight
id (Rid"l
GS2CSummonAutoAssignScheme
id (Rid
switch (Rswitch&
scheme (2.base.AttrInfoRscheme"
GS2CWashSummonUI"Y
GS2CSummonCombineResult
id1 (Rid1
id2 (Rid2
resultid (Rresultid""
GS2CSummonFollow
id (Rid"Z
GS2CSummonInitAttrInfo
id (Rid0
initaddattr (2.base.AttrInfoRinitaddattr"?
GS2CSummonRanse
summid (Rsummid
color (Rcolor"0
GS2CSummonExtendSize
extsize (Rextsize"6
GS2CSummonCkExtendSize
	extcksize (R	extcksize"_
GS2CLoginCkSummon0

summondata (2.base.SummonInfoR
summondata
extsize (Rextsize"C
GS2CAddCkSummon0

summondata (2.base.SummonInfoR
summondata"!
GS2CDelCkSummon
id (Rid",
GS2CSummonWashTips
summid (Rsummid
¸Î
server/huodong.protobase/common.proto"é
ArenaTeamMem
pid (Rpid
name (	Rname
icon (Ricon
school (Rschool
grade (Rgrade
status (Rstatus"f
ArenaTeamInfo
teamid (Rteamid
leader (Rleader%
member (2.ArenaTeamMemRmember"è
ArenaSingleInfo
pid (Rpid
grade (Rgrade
icon (Ricon
school (Rschool
score (Rscore
name (	Rname"à
GS2CArenaFighterList
team (Rteam0

singlelist (2.ArenaSingleInfoR
singlelist*
teamlist (2.ArenaTeamInfoRteamlist"è
ArenaBattelInfo
pid (Rpid
grade (Rgrade
icon (Ricon
school (Rschool
count (Rcount
name (	Rname"_
ViewFightList&
fight (2.ArenaBattelInfoRfight&
enemy (2.ArenaBattelInfoRenemy"5
GS2CArenaNameList 
lst (2.ViewFightListRlst"%
GS2CArenaFightEnd
pid (Rpid"
GS2CShootCrapOpen
maxcount (Rmaxcount
count (Rcount 
goldcoincnt (Rgoldcoincnt
sixcnt (Rsixcnt"•
GS2CShootCrapUpdate
maxcount (Rmaxcount
count (Rcount 
goldcoincnt (Rgoldcoincnt
sixcnt (Rsixcnt"
sixlitemlist (Rsixlitemlist"c
GS2CShootCrapEnd
	point_lst (RpointLst
flowerid (Rflowerid
sixcnt (Rsixcnt",
GS2CDanceStart
lefttime (Rlefttime"
GS2CDanceEnd".
GS2CDanceActiveStart
active (Ractive"
GS2CDanceActiveEnd",
GS2CDanceLeftCnt
leftcnt (Rleftcnt")
GS2CDanceActive
active (Ractive"A
GS2CDanceDoubleReward
exp (Rexp
double (Rdouble"¶
GS2CCampfireQuestion
id (Rid
type (Rtype
choices (	Rchoices
time (Rtime
	cur_round (RcurRound
total_round (R
totalRound"¨
GS2CCampfireQuestionState
	cur_round (RcurRound
total_round (R
totalRound
answered (Ranswered
state (Rstate
correct_cnt (R
correctCnt"Ç
GS2CCampfireCorrectAnswer
id (Rid
answer (Ranswer
	iscorrect (R	iscorrect
correct_cnt (R
correctCnt"Ä
GS2CCampfireInfo
mask (	Rmask
state (Rstate&
drink_buff_adds (RdrinkBuffAdds
lefttime (Rlefttime")
GS2CCampfirePreOpen
time (Rtime"`
GS2CCampfireGotGift
fromer (Rfromer
fromer_name (	R
fromerName
exp (Rexp"•

PlayerInfo
pid (Rpid
name (	Rname
icon (Ricon
grade (Rgrade.

title_info (2.base.TitleInfoR	titleInfo
org_pos (RorgPos"B
GS2CCampfireShowGiftables%
players (2.PlayerInfoRplayers"π
GS2CCampfireGiftTimes
given_times (R
givenTimes(
give_times_limit (RgiveTimesLimit%
received_times (RreceivedTimes.
receive_times_limit (RreceiveTimesLimit"1
GS2CCampfireInHuodongScene
is_in (RisIn"T
GS2CCampfireThankGift
thanker (Rthanker!
thanker_name (	RthankerName"
GS2CSignInOpenUI"‚
GS2CSignInMainInfo&
extrasignincnt (Rextrasignincnt
	rewardset (R	rewardset
fortune (Rfortune
lottery (Rlottery
today (Rtoday
	signincnt (R	signincnt

firstmonth (R
firstmonth"ñ
PlayerPointUnit
pid (Rpid
name (	Rname
school (Rschool
grade (Rgrade
org_name (	RorgName
point (Rpoint"à
OrgPointUnit
org_id (RorgId
org_name (	RorgName
chairman (	Rchairman
total (Rtotal
point (Rpoint"À
PlunderUnit&
role (2.base.SimplePlayerRrole
score (Rscore!
protect_time (RprotectTime*
tx_info (2.base.TouxianInfoRtxInfo
grade (Rgrade
org_name (	RorgName"Í
GS2CMengzhuOpenPlayerRank1
player_list (2.PlayerPointUnitR
playerList
my_rank (RmyRank
my_point (RmyPoint
	boss_time (RbossTime!
plunder_time (RplunderTime&
game_start_time (RgameStartTime"Ë
GS2CMengzhuOpenOrgRank(
org_list (2.OrgPointUnitRorgList
my_rank (RmyRank
my_point (RmyPoint
total (Rtotal
chairman (	Rchairman
	boss_time (RbossTime!
plunder_time (RplunderTime"G
GS2CMengzhuOpenPlunder-
player_list (2.PlunderUnitR
playerList"5
GS2CMengzhuEventList

event_list (	R	eventList"1
GS2CMengzhuGameStart
ret_time (RretTime"0

ResultUnit
sid (Rsid
die (Rdie"Ô
GS2CMengzhuPlunderResult
win_side (RwinSide
name (	Rname
score (Rscore
grade (Rgrade
school (Rschool%
partner (2.ResultUnitRpartner#
player (2.ResultUnitRplayer
point (Rpoint"L
GS2CMengzhuPlunderNotify
target (Rtarget
timeout (Rtimeout"Y
GS2CMengzhuBossResult
point (Rpoint
bout (Rbout
damage (Rdamage")
GS2CMengzhuMainUI
state (Rstate"ƒ
GS2CBWMyRank
rank (Rrank
point (Rpoint
maxwin (Rmaxwin
fail (Rfail
	starttime (R	starttime
	matchtime (R	matchtime"
matchendtime (Rmatchendtime"∞
BWRank
rank (Rrank
point (Rpoint
name (	Rname
grade (Rgrade
pid (Rpid
school (Rschool
war (Rwar
maxwin (Rmaxwin"M

GS2CBWRank#
ranklist (2.BWRankRranklist
maketeam (Rmaketeam" 
GS2CBWMakeTeam
op (Rop"å
BWBattle
icon (Ricon
point (Rpoint
name (	Rname
school (Rschool
grade (Rgrade
score (Rscore"h
GS2CBWBattle!
match1 (2	.BWBattleRmatch1!
match2 (2	.BWBattleRmatch2
time (Rtime">

ItemReward
itemsid (Ritemsid
amount (Ramount"Õ
GS2CBWReward'
itemlist (2.ItemRewardRitemlist
wincount (Rwincount
exp (Rexp
silver (Rsilver
sumexp (Rsumexp
point (Rpoint 
prewincount (Rprewincount"?
OrgTaskItem
itemsid (Ritemsid
amount (Ramount"à
GS2COpenOrgTaskUI
task (Rtask
starlist (Rstarlist
ringcnt (Rringcnt
star (Rstar
starexp (Rstarexp"
starorgoffer (Rstarorgoffer(
staritem (2.OrgTaskItemRstaritem
taskexp (Rtaskexp"
taskorgoffer	 (Rtaskorgoffer(
taskitem
 (2.OrgTaskItemRtaskitem
bout (Rbout1
pretaskinfo (2.OrgTaskPreTaskRpretaskinfo"Ü
GS2COrgTaskRandTask
task (Rtask
star (Rstar
ringcnt (Rringcnt
taskexp (Rtaskexp"
taskorgoffer (Rtaskorgoffer(
taskitem (2.OrgTaskItemRtaskitem
bout (Rbout1
pretaskinfo (2.OrgTaskPreTaskRpretaskinfo"t
OrgTaskPreTask
npctype (Rnpctype
mapid (Rmapid
itemsid (Ritemsid
npcname (	Rnpcname">
GS2COrgTaskResetStar
task (Rtask
star (Rstar"
GS2COrgTaskCleanStarlist"2
BKChoice
text (	Rtext
icon (Ricon" 
GS2CBaikeQuestion
id (Rid
type (Rtype
content (	Rcontent#
choices (2	.BKChoiceRchoices
ring (Rring

answer_cnt (R	answerCnt
answer_time (R
answerTime"R
GS2CBaikeChooseResult
result (Rresult!
right_answer (RrightAnswer"g
GS2CBaikeLinkResult
result (Rresult8
right_answer (2.base.BaikeLinkAnswerRrightAnswer"
GS2CBaikeFinish"G
	BaikeUnit
pid (Rpid
name (	Rname
score (Rscore"2
GS2CBaikeCurRank
unit (2
.BaikeUnitRunit"-
GS2CBaikeCurRankScore
score (Rscore"I
GS2CBaikeWeekRank
unit (2
.BaikeUnitRunit
score (Rscore"D

ChargeUnit
key (	Rkey
val (Rval
days (Rdays"…
GS2CChargeGiftInfo
mask (	Rmask/
gift_day_list (2.ChargeUnitRgiftDayList9
gift_goldcoin_list (2.ChargeUnitRgiftGoldcoinList3
gift_grade_list (2.ChargeUnitRgiftGradeList"8
GS2CChargeRefreshUnit
unit (2.ChargeUnitRunit"L
GS2CChargeCheckBuy

reward_key (	R	rewardKey
can_buy (RcanBuy"(
GS2CBottleRecv
bottle (Rbottle"æ
GS2CBottleDetail
bottle (Rbottle
send_id (RsendId
name (	Rname
content (	Rcontent
	send_time (RsendTime.

model_info (2.base.ModelInfoR	modelInfo"/
GS2CLingxiMatching
rest_sec (RrestSec"(
GS2CLingxiMatchEnd
succ (Rsucc"
GS2CLingxiShowFlowerUsePos",
GS2CLingxiShowFlowerPoem
sec (Rsec"π
GS2CLMMyPoint
point (Rpoint
win (Rwin
fail (Rfail
	gamestate (R	gamestate
rank (Rrank
	starttime (R	starttime
	matchtime (R	matchtime"ù
LMPointRank
rank (Rrank
point (Rpoint
name (	Rname
grade (Rgrade
pid (Rpid
school (Rschool
war (Rwar";
GS2CLMPointRank(
ranklist (2.LMPointRankRranklist"ã
	LMBattler
name (	Rname
pid (Rpid
icon (Ricon
grade (Rgrade.

model_info (2.base.ModelInfoR	modelInfo"Ç
LMBattle&
fighter1 (2
.LMBattlerRfighter1&
fighter2 (2
.LMBattlerRfighter2
win (Rwin
jijun (Rjijun"t
GS2CLMBatte)

battlelist (2	.LMBattleR
battlelist
step (Rstep
time (Rtime
open (Ropen"ä
LMSXInfo
name (	Rname
pid (Rpid
school (Rschool
grade (Rgrade
point (Rpoint
first (Rfirst"1
GS2CLMShouXi!
sxlist (2	.LMSXInfoRsxlist"'
GS2CLMGameState
state (Rstate"?
GS2CShootCrapReward
exp (Rexp
silver (Rsilver"6
GS2CCloseJYFBComfirm

sessionidx (R
sessionidx"H
GS2CJYFBComfirmEnter

sessionidx (R
sessionidx
pid (Rpid":
JYFBComfirmState
pid (Rpid
state (Rstate"n
GS2CJYFBComfirm
time (Rtime'
plist (2.JYFBComfirmStateRplist

sessionidx (R
sessionidx"u
GS2CRefreshJYFBComfirm
time (Rtime'
plist (2.JYFBComfirmStateRplist

sessionidx (R
sessionidx"B
JYFBRewardItem
itemsid (Ritemsid
amount (Ramount"—
GS2CJYFBGameOver
exp (Rexp
silver (Rsilver
point (Rpoint+
itemlist (2.JYFBRewardItemRitemlist
open (Ropen
expradio (Rexpradio 
silverradio (Rsilverradio"@
GS2CJYFubenFloorName
floor (Rfloor
name (	Rname"µ
GS2CWelfareGiftInfo
mask (	Rmask1
first_pay_gift (2.ChargeUnitRfirstPayGift,
rebate_gift (2.ChargeUnitR
rebateGift*

login_gift (2.ChargeUnitR	loginGift 
new_day_time (R
newDayTime3
second_pay_gift (2.ChargeUnitRsecondPayGift>
first_pay_gift_second (2.ChargeUnitRfirstPayGiftSecond<
first_pay_gift_third (2.ChargeUnitRfirstPayGiftThird(
store_charge_rmb	 (RstoreChargeRmb".
UnitInfo
key (	Rkey
val (Rval"î
CollectGiftInfo
collect_key (	R
collectKey&
	gift_list (2	.UnitInfoRgiftList

start_time (R	startTime
end_time (RendTime"J
GS2CCollectGiftInfo3
collect_gift (2.CollectGiftInfoRcollectGift"~
GS2CUpdateCollectStatus
collect_key (	R
collectKey
status (Rstatus*
collect (2.CollectGiftInfoRcollect"+
GS2CGuessGameDone
silver (Rsilver"&
GS2CHuodongIntroduce
id (	Rid"
GS2CGuessGameIntroduce"“
GS2CCaishenRefreshRewardKey
	group_key (	RgroupKey

reward_key (R	rewardKey

start_time (R	startTime
end_time (RendTime%
reward_surplus (RrewardSurplus
status (Rstatus"E
CaishenRewardRecord
name (	Rname
multiple (Rmultiple"t
GS2CCaishenRefreshRewardRecord5
record_list (2.CaishenRewardRecordR
recordList
	last_time (RlastTime"ù
OrgWarMatchUnit
org_id (RorgId
org_show_id (R	orgShowId
org_name (	RorgName
org_boom (RorgBoom

org_status (R	orgStatus"o
OrgWarMatchPair-
	org_unit1 (2.OrgWarMatchUnitRorgUnit1-
	org_unit2 (2.OrgWarMatchUnitRorgUnit2"J
GS2COrgWarOpenMatchList/

match_list (2.OrgWarMatchPairR	matchList"^
GS2COrgWarEnterPrepareRoom!
action_point (RactionPoint

fight_time (R	fightTime"k
OrgWarTeamUnit
team_id (RteamId
leader (Rleader(
mem_list (2.base.TeamMemRmemList"w
GS2COrgWarOpenTeamUI1
single_list (2.base.SimpleRoleR
singleList,
	team_list (2.OrgWarTeamUnitRteamList">
GS2COrgWarEnterFightScene!
action_point (RactionPoint"A
GS2COrgWarRefreshActionPoint!
action_point (RactionPoint"J
WarScoreUnit
pid (Rpid
name (	Rname
score (Rscore"ã
OrgScoreUnit
org_id (RorgId
org_name (	RorgName
	org_score (RorgScore,

score_list (2.WarScoreUnitR	scoreList"D
GS2COrgWarOpenWarScoreUI(
org_list (2.OrgScoreUnitRorgList"z
	TrialUnit
pid (Rpid-
	base_info (2.base.SimpleRoleRbaseInfo
score (Rscore
status (Rstatus"m
GS2CTrialOpenUI)

trial_list (2
.TrialUnitR	trialList
ret_time (RretTime
total (Rtotal"S
GS2CTrialRefreshUnit)

trial_unit (2
.TrialUnitR	trialUnit
pos (Rpos"†
GS2CHfdmQuesState
total_round (R
totalRound
correct_cnt (R
correctCnt
wait_sec (RwaitSec
state (Rstate
winners (	Rwinners"q
GS2CHfdmQuestion
round (Rround
ques_id (RquesId
title (	Rtitle
choices (	Rchoices"≤
GS2CHfdmAnswerResult
ques_id (RquesId
	iscorrect (R	iscorrect
correct_cnt (R
correctCnt%
correct_answer (RcorrectAnswer
	my_answer (RmyAnswer"G
GS2CHfdmSelectAnswer
ques_id (RquesId
select (Rselect"s
GS2CHfdmNeedCorrectRewardInfo
	total_cnt (RtotalCnt
need_cnt (RneedCnt
rewardid (Rrewardid"&
GS2CHfdmInScene
is_in (RisIn"+
	HfdmSkill
id (Rid
cd (Rcd"9
GS2CHfdmSkillStatus"
skills (2
.HfdmSkillRskills"Z
HfdmRank
rank (Rrank
pid (Rpid
name (	Rname
score (Rscore"3
GS2CHfdmRankInfo
ranks (2	.HfdmRankRranks":
GS2CHfdmMyRank
rank (Rrank
score (Rscore"
GS2CHfdmIntro"W
GS2CRefreshGrow
index (Rindex
reward (Rreward
finish (Rfinish"U
GrowLevelInfo
reward (Rreward
finish (Rfinish
index (Rindex"=
GS2CAllGrowInfo*
growinfo (2.GrowLevelInfoRgrowinfo"‰
GS2CReturnGoldCoinRefresh
cbtpay (Rcbtpay
reward (Rreward
	free_gift (RfreeGift
gift_1_time (R	gift1Time

gift_1_buy (Rgift1Buy
gift_2_time (R	gift2Time

gift_2_buy (Rgift2Buy"_
KFTouxianRank
level (Rlevel
pid (Rpid
name (	Rname
rank (Rrank"E
GS2CKFTouxianRank0
touxianrank (2.KFTouxianRankRtouxianrank":
KFRewardUnit
flag (Rflag
reward (Rreward"k
KFReward-

rewarddata (2.KFRewardUnitR
rewarddata
endtime (Rendtime
orgcnt (Rorgcnt"ó
GS2CKaiFuRankReward!
orgcnt (2	.KFRewardRorgcnt%
orglevel (2	.KFRewardRorglevel+
playerscore (2	.KFRewardRplayerscore+
playergrade (2	.KFRewardRplayergrade
	txendtime (R	txendtime

sumendtime (R
sumendtime

createtime (R
createtime"
GS2CShowGradeGiftUI"K
GS2CSevenDayStart
endtime (Rendtime
	starttime (R	starttime"
GS2CSevenDayEnd"4
GS2CSevenDayReward

rewardlist (R
rewardlist"R
GS2CEveryDayChargeStart
endtime (Rendtime

reward_key (	R	rewardKey"
GS2CEveryDayChargeEnd"p
EveryDayChargeReward
flag (	Rflag
day (Rday
reward (Rreward
rewarded (Rrewarded"i
GS2CEveryDayChargeReward5

rewardlist (2.EveryDayChargeRewardR
rewardlist
curday (Rcurday"6

OnlineGift
key (Rkey
status (Rstatus"ñ
GS2COnlineGift+

statuslist (2.OnlineGiftR
statuslist

start_time (R	startTime
end_time (RendTime

login_time (R	loginTime"5
GS2COnlineGiftUnit
unit (2.OnlineGiftRunit"0
GS2CSuperRebateStart
endtime (Rendtime"
GS2CSuperRebateEnd"e
GS2CSuperRebateReward

lotterycnt (R
lotterycnt
value (Rvalue
rebate (Rrebate"=
SuperRebateRecord
name (	Rname
value (Rvalue"K
GS2CSuperRebateRecord2

recordlist (2.SuperRebateRecordR
recordlist"D
GS2CTotalChargeStart
endtime (Rendtime
mode (Rmode"
GS2CTotalChargeEnd";
TotalChargeSlot
slot (Rslot
index (Rindex"ã
TotalChargeReward
level (Rlevel
reward (Rreward
rewarded (Rrewarded,
slotlist (2.TotalChargeSlotRslotlist"q
GS2CTotalChargeReward2

rewardlist (2.TotalChargeRewardR
rewardlist$
todaygoldcoin (Rtodaygoldcoin"<
FightGiftbagSlot
slot (Rslot
index (Rindex"π
FightGiftbagReward
score (Rscore
reward (Rreward
rewarded (Rrewarded-
slotlist (2.FightGiftbagSlotRslotlist
rank (Rrank
inrank (Rinrank"g
GS2CFightGiftbagReward3

rewardlist (2.FightGiftbagRewardR
rewardlist
endtime (Rendtime"H
ServerDayExpenseRewardGrid
grid (Rgrid
option (Roption"í
DayExpenseRewardList

reward_key (R	rewardKey!
reward_state (RrewardState8
	grid_list (2.ServerDayExpenseRewardGridRgridList"∏
GS2CDayExpenseReward
	group_key (	RgroupKey6
reward_list (2.DayExpenseRewardListR
rewardList
goldcoin (Rgoldcoin
end_time (RendTime
state (Rstate"O
GS2COpenFuYuanBoxView
box_idx (RboxIdx

reward_ids (R	rewardIds"
GS2CCloseFuYuanBoxView"9
FuYuanBoxReward
id (Rid
amount (Ramount"W
GS2CFuYuanBoxReward
times (Rtimes*
rewards (2.FuYuanBoxRewardRrewards"C
GS2CFuYuanLottery

sessionidx (R
sessionidx
id (Rid"Ò
GS2CThreeBWMyRank
rank (Rrank
point (Rpoint
lastwin (Rlastwin
win (Rwin
fight (Rfight
	starttime (R	starttime
match (Rmatch
endtime (Rendtime"
matchendtime	 (Rmatchendtime"e
ThreeRankData
rank (Rrank
point (Rpoint
maxwin (Rmaxwin
name (	Rname"@
GS2CThreeBWEndRank*
rankdata (2.ThreeRankDataRrankdata"Ë
GS2CThreeBWNomalRank*
rankdata (2.ThreeRankDataRrankdata
point (Rpoint
rank (Rrank
win (Rwin
lastwin (Rlastwin
firstwin (Rfirstwin
fivewin (Rfivewin
endtime (Rendtime"ë
ThreeBWBattle
icon (Ricon
point (Rpoint
name (	Rname
school (Rschool
grade (Rgrade
score (Rscore"w
GS2CThreeBWBattle&
match1 (2.ThreeBWBattleRmatch1&
match2 (2.ThreeBWBattleRmatch2
time (Rtime")
GS2CQiFuStart
endtime (Rendtime"
GS2CQiFuEnd"[
QiFuLotteryReward
itemsid (Ritemsid
amount (Ramount
baoji (Rbaoji"F
GS2CQiFuReward
point (Rpoint

rewardlist (R
rewardlist"E
GS2CQiFuLottery2

rewardlist (2.QiFuLotteryRewardR
rewardlist"F
ActivePointGiftGrid
grid_id (RgridId
option (Roption"Ñ
ActivePointGift
	point_key (RpointKey!
reward_state (RrewardState1
	grid_list (2.ActivePointGiftGridRgridList"L
GS2COpenActivePointGiftView-
	gift_list (2.ActivePointGiftRgiftList"@
GS2CActivePointGiftTotalPoint
total_point (R
totalPoint"K
GS2CActivePointGiftState
state (Rstate
end_time (RendTime"r
"GS2CActivePointSetGridOptionResult
	point_key (RpointKey
grid_id (RgridId
option (Roption"@
JuBaoPenScoreState
score (Rscore
state (Rstate"∆
GS2CJuBaoPenInfo

free_count (R	freeCount!
free_endtime (RfreeEndtime"
ten_ext_times (RtenExtTimes6
score_reward (2.JuBaoPenScoreStateRscoreReward
score (Rscore"V
JuBaoPenRecord
rolename (	Rrolename
itemid (Ritemid
num (Rnum"?
GS2CJuBaoPenRecord)
records (2.JuBaoPenRecordRrecords"8
JuBaoPenReward
id (Rid
amount (Ramount"Ä
GS2CJuBaoPen
times (Rtimes)
rewards (2.JuBaoPenRewardRrewards/

extrewards (2.JuBaoPenRewardR
extrewards"I
GS2CJuBaoPenStart
showrank (Rshowrank
endtime (Rendtime"-
GS2CJuBaoPenEnd
showrank (Rshowrank"D
GS2CDrawCardState
state (Rstate
end_time (RendTime"R
GS2CDrawCardTimes
times (Rtimes'
purchased_times (RpurchasedTimes"c
DrawCardCard
	card_info (RcardInfo

card_state (R	cardState
card_id (RcardId"`
GS2CDrawCardGetList*
	card_list (2.DrawCardCardRcardList

card_count (R	cardCount"}
GS2CDrawCardDrawResult
success (Rsuccess

card_count (R	cardCount*
	card_list (2.DrawCardCardRcardList"g
GS2CContinuousChargeStart
	starttime (R	starttime
endtime (Rendtime
mode (Rmode"
GS2CContinuousChargeEnd"?
ContinuousChargeState
day (Rday
state (Rstate"D
ContinuousChargeTotalState
day (Rday
state (Rstate"N
ContinuousChoice
day (Rday
slot (Rslot
index (Rindex"À
GS2CContinuousChargeReward.
states (2.ContinuousChargeStateRstates=
totalstates (2.ContinuousChargeTotalStateRtotalstates
curday (Rcurday 
curgoldcoin (Rcurgoldcoin$
totalcoldcoin (Rtotalcoldcoin)
choice (2.ContinuousChoiceRchoice3
totalchoice (2.ContinuousChoiceRtotalchoice"h
GS2CContinuousExpenseStart
	starttime (R	starttime
endtime (Rendtime
mode (Rmode"
GS2CContinuousExpenseEnd"@
ContinuousExpenseState
day (Rday
state (Rstate"E
ContinuousExpenseTotalState
day (Rday
state (Rstate"Œ
GS2CContinuousExpenseReward/
states (2.ContinuousExpenseStateRstates>
totalstates (2.ContinuousExpenseTotalStateRtotalstates
curday (Rcurday 
curgoldcoin (Rcurgoldcoin$
totalcoldcoin (Rtotalcoldcoin)
choice (2.ContinuousChoiceRchoice3
totalchoice (2.ContinuousChoiceRtotalchoice"l
GS2CEveryDayRankStart
rank_idx (RrankIdx

start_time (R	startTime
end_time (RendTime"
GS2CEveryDayRankEnd"ÿ
NSClientNpc
npctype (Rnpctype
npcid (Rnpcid
name (	Rname
title (	Rtitle
map_id (RmapId(
pos_info (2.base.PosInfoRposInfo.

model_info (2.base.ModelInfoR	modelInfo"<
GS2CNSGetPlayerNPC&
npclist (2.NSClientNpcRnpclist"-
GS2CNSRemovePlayerNPC
npcid (Rnpcid"*
GS2CNSYanHua
x (Rx
y (Ry"
GS2CGoldCoinPartyStart"
GS2CGoldCoinPartyEnd"F
GoldCoinPartyLotteryReward
pos (Rpos
amount (Ramount"W
GoldCoinPartyRecord
name (	Rname
pos (Rpos
goldcoin (Rgoldcoin"¡
GS2CGoldCoinPartyReward
point (Rpoint

rewardlist (R
rewardlist4

recordlist (2.GoldCoinPartyRecordR
recordlist 
allgoldcoin (Rallgoldcoin
endtime (Rendtime"W
GS2CGoldCoinPartyLottery;

rewardlist (2.GoldCoinPartyLotteryRewardR
rewardlist"u
GS2CGoldCoinPartyUpdateInfo 
allgoldcoin (Rallgoldcoin4

recordlist (2.GoldCoinPartyRecordR
recordlist"L
GS2CMysticalboxGetState
state (Rstate
	open_time (RopenTime"!

HotTopicHD
hd_id (RhdId"8
GS2CHotTopicList$
hd_list (2.HotTopicHDRhdList"ì
JBInviterInfo
pid (Rpid

invitetime (R
invitetime 
invitestate (Rinvitestate
minghao (	Rminghao
owner (Rowner"ü
JBFullInviteInfo
id (Rid
owner (Rowner

createtime (R
createtime
state (Rstate/
invite_info (2.JBInviterInfoR
inviteInfo"w
JBMemberInfo
pid (Rpid
memtime (Rmemtime
minghao (	Rminghao!
free_minghao (RfreeMinghao"ä

JBKickVote
owner (Rowner
pid (Rpid
time (Rtime
	agreelist (R	agreelist"
disagreelist (Rdisagreelist"<
JBInviteAnnounce
pid (Rpid
target (Rtarget"
	JBAllInfo
id (Rid
owner (Rowner
state (Rstate

createtime (R
createtime.

allinviter (2.JBInviterInfoR
allinviter+
	allmember (2.JBMemberInfoR	allmember"
createystime (Rcreateystime
ysstate (Rysstate
title	 (	Rtitle 
ysstarttime
 (Rysstarttime
enounce (	Renounce
jieyi (Rjieyi%
kickout (2.JBKickVoteRkickout:
invite_announce (2.JBInviteAnnounceRinviteAnnounce!
invite_limit (RinviteLimit"(
GS2CJiaBaiClickNpc
flag (Rflag"?
GS2CJiaBaiCreate+
jiebai_info (2
.JBAllInfoR
jiebaiInfo"C
GS2CJBAddInviter/
invite_info (2.JBInviterInfoR
inviteInfo"Q
GS2CJBBecomeInviter:
fullinvite_info (2.JBFullInviteInfoRfullinviteInfo"R
GS2CJBInviterOnLogin:
fullinvite_info (2.JBFullInviteInfoRfullinviteInfo"C
GS2CJBInvitedOnLogin+
jiebai_info (2
.JBAllInfoR
jiebaiInfo"'
GS2CJBRemoveInviter
pid (Rpid"G
GS2CJBRefreshInviter/
invite_info (2.JBInviterInfoR
inviteInfo"B
GS2CJBMemberOnLogin+
jiebai_info (2
.JBAllInfoR
jiebaiInfo";
GS2CJBAddMember(
mem_info (2.JBMemberInfoRmemInfo"A
GS2CJBBecomeMember+
jiebai_info (2
.JBAllInfoR
jiebaiInfo"&
GS2CJBRemoveMember
pid (Rpid"?
GS2CJBRefreshMember(
mem_info (2.JBMemberInfoRmemInfo"
GS2CJBRemoveJieBai"<
GS2CJBRefresh+
jiebai_info (2
.JBAllInfoR
jiebaiInfo"
GS2CJBHejiu"
GS2CJBYiShiChuiCu"*
GS2CJBValidInviter
plist (Rplist"-
GS2CJBRedPoint
	red_point (RredPoint"_
GS2CJoyExpenseState
state (Rstate
end_time (RendTime
mode_id (RmodeId"T
JoyExpenseReward

expense_id (R	expenseId!
reward_state (RrewardState"O
GS2CJoyExpenseRewardState2
reward_list (2.JoyExpenseRewardR
rewardList"4
GS2CJoyExpenseGoldCoin
goldcoin (Rgoldcoin"E
GS2CRplGoldCoinGift
multiple (Rmultiple
flag (Rflag"ß
SingleWarInfo
mask (	Rmask
pid (Rpid!
prepare_time (RprepareTime

start_time (R	startTime
end_time (RendTime
win (Rwin 
win_seri_max (R
winSeriMax
war_cnt (RwarCnt
rank	 (Rrank
point
 (Rpoint!
reward_first (RrewardFirst
reward_five (R
rewardFive"
win_seri_curr (RwinSeriCurr
group_id (RgroupId
is_match (RisMatch"7
GS2CSingleWarInfo"
info (2.SingleWarInfoRinfo"X
GS2CSingleWarMatchResult&
role (2.base.SimplePlayerRrole
score (Rscore"
GS2CSingleWarStartMatch"î
RankUnit
pid (Rpid
grade (Rgrade
point (Rpoint
score (Rscore 
win_seri_max (R
winSeriMax
name (	Rname"R
SingleWarRank
group_id (RgroupId&
	rank_info (2	.RankUnitRrankInfo"è
GS2CSingleWarFinalRank
group_id (RgroupId
my_rank (RmyRank
point (Rpoint+
	rank_list (2.SingleWarRankRrankList"7
GS2CSingleWarRank"
rank (2.SingleWarRankRrank"=
ItemInvestInfoDay
day (Rday
status (Rstatus"\
ItemInvestInfo
	invest_id (RinvestId-
day_info (2.ItemInvestInfoDayRdayInfo"ç
GS2CItemInvestState
state (Rstate%
invest_endtime (RinvestEndtime%
reward_endtime (RrewardEndtime
mode (Rmode"5
GS2CItemInvest#
info (2.ItemInvestInfoRinfo"`
GS2CItemInvestUnit
	invest_id (RinvestId-
day_info (2.ItemInvestInfoDayRdayInfo"-
GS2CImperialexamState
state (Rstate"w
GS2CImperialexamGiveQuestion
question_id (R
questionId
use_time (RuseTime
	cur_round (RcurRound"
GS2CImperialexamGiveAnswer
question_id (R
questionId!
right_answer (RrightAnswer

wrong_time (R	wrongTime"J
GS2CTreasureConvoyState
state (Rstate
end_time (RendTime"À
GS2CTreasureConvoyInfo!
convoy_count (RconvoyCount
	rob_count (RrobCount!
robbed_count (RrobbedCount'
convoy_pregress (RconvoyPregress%
convoy_endtime (RconvoyEndtime"
GS2CTreasureConvoyOpenView",
GS2CTreasureConvoyFlag
flag (Rflag"3
BuyUnit
day (Rday
status (Rstatus"V
GS2CDiscountSale

start_time (R	startTime#
buy_info (2.BuyUnitRbuyInfo"J
ForeShowInfo

content_id (R	contentId
	show_type (RshowType">
GS2CForeShowInfo*
	info_list (2.ForeShowInfoRinfoList"~
ZeroYuanUnit
type (Rtype
status (Rstatus
buy_endtime (R
buyEndtime!
back_endtime (RbackEndtime"`
GS2CZeroYuanInfo)
activity_endtime (RactivityEndtime!
info (2.ZeroYuanUnitRinfo"B
GS2CZeroYuanInfoUnit*
	unit_info (2.ZeroYuanUnitRunitInfo"D
RetrieveUnit

scheduleid (R
scheduleid
count (Rcount">
GS2CRetrieveExp+
	retrieves (2.RetrieveUnitR	retrieves")
GS2CWorldCupState
state (Rstate"Ú
OneGameInfo
id (Rid
phase (Rphase
round (Rround

start_time (R	startTime
	home_team (RhomeTeam
	away_team (RawayTeam
status (Rstatus
win_team (RwinTeam
	has_match	 (RhasMatch"R
GS2CWorldCupSingleInfo
phase (Rphase"
games (2.OneGameInfoRgames"A
OneGameGuessInfo
id (Rid

guess_team (R	guessTeam"O
GS2CWorldCupSingleGuessInfo0

guess_info (2.OneGameGuessInfoR	guessInfo"\
GS2CWorldCupSingleGuessInfoUnit9
guess_info_unit (2.OneGameGuessInfoRguessInfoUnit"¥
WorldCupGuess
id (Rid
	home_team (RhomeTeam
	away_team (RawayTeam
win_team (RwinTeam

guess_team (R	guessTeam
create_time (R
createTime"w
GS2CWorldCupHistory(
history (2.WorldCupGuessRhistory
	suc_count (RsucCount
suc_rate (RsucRate"8
TeamSupport
team_id (RteamId
num (Rnum"â
GS2CWorldCupChampionInfo!
support_team (RsupportTeam
out_team (RoutTeam/
support_info (2.TeamSupportRsupportInfo"X
GS2CWorldCupChampionInfoUnit8
support_info_unit (2.TeamSupportRsupportInfoUnit")
GS2CZongziGameState
open (Ropen"π
GS2CRefreshZongziGame
zongzi1 (Rzongzi1
zongzi2 (Rzongzi2
	starttime (R	starttime
endtime (Rendtime
vote_num (RvoteNum
vote_buy (RvoteBuy")
GS2CDuanwuQifuState
open (Ropen"ö
GS2CRefreshDuanwuQifu
mask (	Rmask
	starttime (R	starttime
endtime (Rendtime
total (Rtotal
reward_step (R
rewardStep
ﬂ
server/auction.protobase/common.proto"ô
SellUnit
id (Rid
type (Rtype
sid (Rsid
price (Rprice

money_type (R	moneyType
bidder (Rbidder
	show_time (RshowTime

price_time (R	priceTime
	is_follow	 (RisFollow!
proxy_bidder
 (RproxyBidder
proxy_price (R
proxyPrice
	view_time (RviewTime
sys_idx (RsysIdx
quality (Rquality

base_price (R	basePrice"ë
GS2COpenAuction
cat_id (RcatId
sub_id (RsubId&
	sell_list (2	.SellUnitRsellList
total (Rtotal
page (Rpage"4
GS2CRefreshSellUnit
unit (2	.SellUnitRunit"æ
GS2CShowLink
cat_id (RcatId
sub_id (RsubId&
	sell_list (2	.SellUnitRsellList
total (Rtotal
page (Rpage
status (Rstatus
target (Rtarget"u
GS2CAuctionPriceChange
id (Rid
price (Rprice

price_time (R	priceTime
bidder (Rbidder"ï
GS2CAuctionDetail
id (Rid
type (Rtype*
itemdata (2.base.ItemInfoRitemdata0

summondata (2.base.SummonInfoR
summondata
¶
server/warehouse.protobase/common.proto"C
GS2CWareHouseInfo
size (Rsize
namelist (	Rnamelist"h
GS2CRefreshWareHouse
wid (Rwid
name (	Rname*
itemdata (2.base.ItemInfoRitemdata"9
GS2CWareHouseName
wid (Rwid
name (	Rname"T
GS2CAddWareHouseItem
wid (Rwid*
itemdata (2.base.ItemInfoRitemdata"@
GS2CDelWareHouseItem
wid (Rwid
itemid (Ritemid"O
GS2CWHItemArrange
wid (Rwid(
pos_info (2.base.ItemPosRposInfo"T
GS2CWHItemAmount
wid (Rwid
itemid (Ritemid
amount (Ramount"P
GS2CUpdateWHItem
wid (Rwid*
itemdata (2.base.ItemInfoRitemdata
˝
server/recovery.protobase/common.proto"B
GS2COpenRecoveryItem*
itemdata (2.base.ItemInfoRitemdata"%
GS2CDelRecoveryItem
id (Rid"A
GS2COpenRecoverySum*
sumdata (2.base.SummonInfoRsumdata"#
GS2CDelRecoverSum
id (Rid
¿
server/redpacket.protobase/common.proto"o
ReceiveInfo
pid (Rpid
icon (Ricon
name (	Rname
time (Rtime
cash (Rcash"Å
	BasicInfo
id (Rid
name (	Rname
cashsum (Rcashsum
count (Rcount

createtime (R
createtime
	ownername (	R	ownername
	ownericon (R	ownericon.
receiveinfo (2.ReceiveInfoRreceiveinfo
bless	 (	Rbless"ƒ
SubBasicInfo
id (Rid
name (	Rname
	ownername (	R	ownername
valid (Rvalid
finish (Rfinish
se (Rse

createtime (R
createtime
bless (	Rbless"0
	GS2CNewRB#
newrb (2.SubBasicInfoRnewrb"9
	GS2CBasic,
rpbasicinfo (2
.BasicInfoRrpbasicinfo"l
GS2CAll
channel (Rchannel#
allrp (2.SubBasicInfoRallrp"
activerplist (Ractiverplist"'
GS2CDelActiveRP
index (Rindex"7
GS2CAddActiveRP
index (Rindex
rp (Rrp"l
GS2CRobSuccess
id (Rid
name (	Rname
	ownername (	R	ownername
robcash (Rrobcash"K
GS2CRefresh
id (Rid
valid (Rvalid
finish (Rfinish"

GS2CRemove
id (Rid"‹
GS2CHistory
rob_org_cnt (R	robOrgCnt"
rob_world_cnt (RrobWorldCnt
rob_gold (RrobGold 
sent_org_cnt (R
sentOrgCnt$
sent_world_cnt (RsentWorldCnt"
send_org_gold (RsendOrgGold*
send_org_goldcoin (RsendOrgGoldcoin&
send_world_gold (RsendWorldGold.
send_world_goldcoin	 (RsendWorldGoldcoin"b

GS2CRPItem
name (	Rname
count (Rcount
goldcoin (Rgoldcoin
id (Rid
ó
server/item.protobase/common.proto"U
GS2CLoginItem*
itemdata (2.base.ItemInfoRitemdata
extsize (Rextsize"l
GS2CAddItem*
itemdata (2.base.ItemInfoRitemdata
from_wh (RfromWh
refresh (Rrefresh"
GS2CDelItem
id (Rid"k
GS2CItemAmount
id (Rid
amount (Ramount
from_wh (RfromWh
refresh (Rrefresh""
GS2CItemQuickUse
id (Rid".
GS2CItemExtendSize
extsize (Rextsize";
GS2CItemArrange(
pos_info (2.base.ItemPosRposInfo";
GS2CEquipLast
itemid (Ritemid
last (Rlast"4
CostInfo
sid (Rsid
amount (Ramount"e
GS2CEquipMake
sid (Rsid&
	make_info (2	.CostInfoRmakeInfo
goldcoin (Rgoldcoin"X
WashEquipInfo.

apply_info (2.base.ApplyInfoR	applyInfo
se_list (RseList"k
GS2CWashEquipInfo)
now_info (2.WashEquipInfoRnowInfo+
	wash_info (2.WashEquipInfoRwashInfo"l
GS2CStrengthInfo,
success_ratio_base (RsuccessRatioBase*
success_ratio_add (RsuccessRatioAdd":
GS2CLoadTreasureProgress

sessionidx (R
sessionidx"’
GS2CStartShowRewardByType
reward_type (	R
rewardType<
moneyreward_info (2.base.MoneyRewardRmoneyrewardInfo9
itemreward_info (2.base.ItemRewardRitemrewardInfo

sessionidx (R
sessionidx",
GS2CContinueFindTreasure
sid (Rsid"*
GS2CEquipNeedFix
silver (Rsilver"+
GS2CEquipLogin
fh_point (RfhPoint"1
GS2CUpdateFuHunPoint
fh_point (RfhPoint"R
GS2CFuHunCost
equip_id (RequipId&
	cost_info (2	.CostInfoRcostInfo"@
GS2CUpdateItemInfo*
itemdata (2.base.ItemInfoRitemdata"(
GS2CSummonEquipCombine
id (Rid"E
GS2CItemGoldCoinPrice
sid (Rsid
goldcoin (Rgoldcoin"]
GS2CFastBuyItemPrice
sid (Rsid

money_type (R	moneyType
price (Rprice"T
GSItemPrice
sid (Rsid

money_type (R	moneyType
price (Rprice"E
GS2CFastBuyItemListPrice)
	item_list (2.GSItemPriceRitemList"-
GS2CWenShiCombineResult
flag (Rflag
¡
server/jjc.protobase/common.proto"Ä
JJCTop3Info
type (Rtype
id (Rid
rank (Rrank
name (	Rname%
model (2.base.ModelInfoRmodel"^
JJCFighterInfo
id (Rid
icon (Ricon
lv (Rlv
quality (Rquality"Û
JJCTargetInfo
type (Rtype
id (Rid
rank (Rrank
name (	Rname
score (Rscore%
model (2.base.ModelInfoRmodel
grade (Rgrade
school (Rschool+
fighters	 (2.JJCFighterInfoRfighters"¥
JJCLineupInfo
fmtid (Rfmtid
fmtlv (Rfmtlv
summid (Rsummid
summicon (Rsummicon
summlv (Rsummlv+
fighters (2.JJCFighterInfoRfighters"a
JJCFightLog
fighter (	Rfighter
win (Rwin
rank (Rrank
time (Rtime"¥
ChallengeTargetInfo
type (Rtype
id (Rid
name (	Rname
grade (Rgrade
score (Rscore%
model (2.base.ModelInfoRmodel
icon (Ricon"x
ChallengeFighterInfo
type (Rtype
id (Rid
icon (Ricon
lv (Rlv
quality (Rquality"¿
ChallengeLineupInfo
fmtid (Rfmtid
fmtlv (Rfmtlv
summid (Rsummid
summicon (Rsummicon
summlv (Rsummlv1
fighters (2.ChallengeFighterInfoRfighters"7
ChallengeTargetID
type (Rtype
id (Rid"Ï
GS2CJJCMainInfo
mask (	Rmask
rank (Rrank$
infos (2.JJCTargetInfoRinfos&
lineup (2.JJCLineupInfoRlineup

fighttimes (R
fighttimes
fightcd (Rfightcd
hasbuy (Rhasbuy"
top3 (2.JJCTargetInfoRtop3

nextseason	 (R
nextseason*
first_gift_status
 (RfirstGiftStatus!
refresh_time (RrefreshTime"m
GS2CJJCTargetLineupInfo*
target (2.ChallengeTargetIDRtarget&
lineup (2.JJCLineupInfoRlineup"3
GS2CJJCFightLog 
logs (2.JJCFightLogRlogs"â
GS2CJJCFightEndInfo
oldrank (Roldrank
newrank (Rnewrank
result (Rresult&
items (2.base.ItemRewardRitems"1
GS2CChallengeChooseRank
reward (Rreward"È
GS2CChallengeMainInfo
mask (	Rmask

difficulty (R
difficulty.
targets (2.ChallengeTargetInfoRtargets,
lineup (2.ChallengeLineupInfoRlineup(
beats (2.ChallengeTargetIDRbeats
times (Rtimes"u
GS2CChallengeTargetLineup*
target (2.ChallengeTargetIDRtarget,
lineup (2.ChallengeLineupInfoRlineup"
GS2CJJCNotifyLog"1
GS2CJJCLeftTimes

left_times (R	leftTimes
Ä
server/formation.proto"H
FmtUnit
fmt_id (RfmtId
exp (Rexp
grade (Rgrade"¬
GS2CAllFormationInfo
fmt_curr (RfmtCurr
player_list (R
playerList!
partner_list (RpartnerList#
fmt_list (2.FmtUnitRfmtList&
fmt_learn_limit (RfmtLearnLimit"f
GS2CSingleFormationInfo#
fmt_info (2.FmtUnitRfmtInfo&
fmt_learn_limit (RfmtLearnLimit"o
GS2CFmtPosInfo
fmt_curr (RfmtCurr
player_list (R
playerList!
partner_list (RpartnerList
ñ
server/npc.protobase/common.proto"Ó

GS2CNpcSay

sessionidx (R
sessionidx
npcid (Rnpcid.

model_info (2.base.ModelInfoR	modelInfo
name (	Rname
text (	Rtext
type (Rtype
lv2 (Rlv2
time (Rtime
default	 (Rdefault
ô$
server/war.protobase/common.proto"Ì
GS2CShowWar
war_id (RwarId
war_type (RwarType
sky_war (RskyWar
weather (Rweather

is_bosswar (R	isBosswar%
tollgate_group (	RtollgateGroup
tollgate_id (R
tollgateId!
barrage_show (RbarrageShow!
barrage_send	 (RbarrageSend
map_id
 (RmapId
x (Rx
y (Ry
sys_type (RsysType"?
GS2CWarResult
war_id (RwarId
bout_id (RboutId"_
GS2CWarBoutStart
war_id (RwarId
bout_id (RboutId
	left_time (RleftTime"'
GS2CWarBoutEnd
war_id (RwarId"¶
GS2CWarAddWarrior
war_id (RwarId
camp_id (RcampId
type (Rtype-
warrior (2.base.PlayerWarriorRwarrior0

npcwarrior (2.base.NpcWarriorR
npcwarrior0

sumwarrior (2.base.SumWarriorR
sumwarrior<
partnerwarrior (2.base.PartnerWarriorRpartnerwarrior?
roplayerwarrior (2.base.RoPlayerWarriorRroplayerwarriorB
ropartnerwarrior	 (2.base.RoPartnerWarriorRropartnerwarrior?
rosummonwarrior
 (2.base.RoSummonWarriorRrosummonwarrior
add_type (RaddType
	is_summon (RisSummon"i
GS2CWarDelWarrior
war_id (RwarId
wid (Rwid
type (Rtype
war_end (RwarEnd"j
GS2CWarNormalAttack
war_id (RwarId

action_wid (R	actionWid

select_wid (R	selectWid"°
GS2CWarSkill
war_id (RwarId!
action_wlist (RactionWlist!
select_wlist (RselectWlist
skill_id (RskillId
magic_id (RmagicId"e
GS2CWarProtect
war_id (RwarId

action_wid (R	actionWid

select_wid (R	selectWid"_
GS2CWarEscape
war_id (RwarId

action_wid (R	actionWid
success (Rsuccess"ü
GS2CWarDamage
war_id (RwarId
wid (Rwid
type (Rtype
iscrit (Riscrit
damage (Rdamage!
hited_effect (RhitedEffect"Ä
GS2CWarWarriorStatus
war_id (RwarId
wid (Rwid
type (Rtype+
status (2.base.WarriorStatusRstatus"E
GS2CWarGoback
war_id (RwarId

action_wid (R	actionWid"í
GS2CWarAddBuff
war_id (RwarId
wid (Rwid
buff_id (RbuffId
bout (Rbout*
attrlist (2.base.BuffAttrRattrlist"R
GS2CWarDelBuff
war_id (RwarId
wid (Rwid
buff_id (RbuffId"©
GS2CWarBuffBout
war_id (RwarId
wid (Rwid
buff_id (RbuffId
bout (Rbout
stack (Rstack*
attrlist (2.base.BuffAttrRattrlist"Z
GS2CWarPasssiveSkill
war_id (RwarId
wid (Rwid
skill_id (RskillId"\
GS2CPlayerWarriorEnter
war_id (RwarId
wid (Rwid
sum_list (RsumList"Ü
GS2CWarriorSpeek
war_id (RwarId
wid (Rwid
content (	Rcontent
flag (Rflag
	show_type (RshowType"7
	SpeekInfo
wid (Rwid
content (	Rcontent"é
GS2CWarriorSeqSpeek
war_id (RwarId"
speeks (2
.SpeekInfoRspeeks
block_ms (RblockMs!
block_action (RblockAction"M
GS2CWarCapture
war_id (RwarId
wid (Rwid
succ (Rsucc"U
GS2CStartObserver
pid (Rpid
war_id (RwarId
camp_id (RcampId"=

WarCommand

select_wid (R	selectWid
cmd (	Rcmd"X
GS2CWarCommand
war_id (RwarId
op (Rop
lcmd (2.WarCommandRlcmd"j
GS2CWarCommandOP
war_id (RwarId
op (Rop

select_wid (R	selectWid
cmd (	Rcmd"e
GS2CUpdateWarCommand
war_id (RwarId
appoint (Rappoint
	appointop (R	appointop"~
GS2CWarUseItem
war_id (RwarId

action_wid (R	actionWid

select_wid (R	selectWid
item_id (	RitemId"W
GS2CWarStatus
war_id (RwarId
bout (Rbout
	left_time (RleftTime"õ
GS2CWarCampFmtInfo
war_id (RwarId
fmt_id1 (RfmtId1

fmt_grade1 (R	fmtGrade1
fmt_id2 (RfmtId2

fmt_grade2 (R	fmtGrade2"1
KeyUnit
key (	Rkey
value (Rvalue"{
GS2CTriggerPassiveSkill
war_id (RwarId
pfid (Rpfid#
key_list (2.KeyUnitRkeyList
wid (Rwid"N
GS2CWarAddMp
war_id (RwarId
wid (Rwid
add_mp (RaddMp"j
GS2CRefreshPerformCD
war_id (RwarId
wid (Rwid)
pflist (2.base.PerformUnitRpflist">
GS2CWarObCount
war_id (RwarId
ob_cnt (RobCnt"@
GS2CWarFail
war_id (RwarId
gameplay (	Rgameplay"X
GS2CWarDelStatus
war_id (RwarId
wid (Rwid
	status_id (RstatusId"l
GS2CWarUpdateStatus
war_id (RwarId
wid (Rwid,
status (2.base.StatusBuffUnitRstatus
¸
server/other.protobase/common.proto"#
GS2CHeartBeat
time (Rtime"!
GS2CGMMessage
msg (	Rmsg"ë
SummonCountInfo
sid (Rsid
sname (	Rsname
stype (	Rstype
num (Rnum
percent (Rpercent
carry (Rcarry"µ
GS2CSummonCount
sid1 (Rsid1
sid2 (Rsid2
cnt (Rcnt,
infolist (2.SummonCountInfoRinfolist
	bypercent (R	bypercent
	xypercent (R	xypercent"

GS2COnline
pid (Rpid"
GS2COffline
pid (Rpid"c
GS2CBigPacket
type (Rtype
total (Rtotal
index (Rindex
data (Rdata"*
GS2CClientUpdateCode
code (	Rcode"1
GS2COpSessionResponse
session (	Rsession"@
GS2CQRCToken
token (	Rtoken
validity (Rvalidity"
GS2CQRCScanSuccess"\
GS2CQRCAccountInfo!
account_info (RaccountInfo#
transfer_info (RtransferInfo"
GS2CQRCInvalid"∏
GS2CPayInfo
order_id (	RorderId
product_key (	R
productKey%
product_amount (RproductAmount#
product_value (RproductValue!
callback_url (	RcallbackUrl"2
GoldCoinUnit
key (	Rkey
val (Rval"H
GS2CPayForGoldInfo2
goldcoin_list (2.GoldCoinUnitRgoldcoinList"<
GS2CRefreshGoldCoinUnit!
unit (2.GoldCoinUnitRunit"4
GS2CQrpayScan#
transfer_info (RtransferInfo"+
GS2CMergePacket
packets (Rpackets"M
GS2CClientUpdateResVersion
res_file (	RresFile
delay (Rdelay"m
GS2CClientUpdateRes5
res_file (2.base.ClientResFileContentRresFile
delete_file (	R
deleteFile"7
GS2CShowInstruction 
instruction (Rinstruction"≠
FeedBackQuestion
question_id (R
questionId
question (	Rquestion#
question_time (RquestionTime
answer (	Ranswer
answer_time (R
answerTime"q
GS2CFeedBackAnswerList6
question_list (2.FeedBackQuestionRquestionList
check_state (R
checkState
í
server/mail.protobase/common.proto"≤
MailSimpleInfo
mailid (Rmailid
title (	Rtitle
	validtime (R	validtime
	hasattach (R	hasattach
opened (Ropened
	readtodel (R	readtodel

createtime (R
createtime
mailtype (Rmailtype
icon	 (	Ricon
openicon
 (	Ropenicon
audio (	Raudio"@
GS2CLoginMail/

simpleinfo (2.MailSimpleInfoR
simpleinfo"D

AttachInfo
type (Rtype
sid (Rsid
val (Rval"ó
GS2CMailInfo
mailid (Rmailid
title (	Rtitle
context (	Rcontext

createtime (R
createtime
	validtime (R	validtime
pid (Rpid
name (	Rname
opened (Ropened
	hasattach	 (R	hasattach%
attachs
 (2.AttachInfoRattachs"'
GS2CDelMail
mailids (Rmailids">
GS2CAddMail/

simpleinfo (2.MailSimpleInfoR
simpleinfo"*
GS2CMailOpened
mailids (Rmailids
ó
server/title.proto"å
	TitleInfo
tid (Rtid
name (	Rname!
achieve_time (RachieveTime
	left_time (RleftTime
use_time (RuseTime"5
GS2CTitleInfoList 
infos (2
.TitleInfoRinfos"4
GS2CAddTitleInfo 
infos (2
.TitleInfoRinfos"&
GS2CDelTitleInfo
tids (Rtids"&
GS2CUpdateUseTitle
tid (Rtid"5
GS2CUpdateTitleInfo
info (2
.TitleInfoRinfo
»,
server/org.protobase/common.proto"≈
OrgListInfo
orgid (Rorgid
name (	Rname
level (Rlevel
leaderid (Rleaderid

leadername (	R
leadername
memcnt (Rmemcnt
hasapply (Rhasapply"
leaderschool (	Rleaderschool
isfriend	 (Risfriend
maxcnt
 (Rmaxcnt
showid (Rshowid
optype (Roptype"Ä
GS2COrgList"
infos (2.OrgListInfoRinfos
	left_time (RleftTime
version (Rversion
update (Rupdate"7
GS2COrgResultList"
infos (2.OrgListInfoRinfos"†
ReadyOrgInfo
orgid (Rorgid
name (	Rname

respondcnt (R
respondcnt
leaderid (Rleaderid

leadername (	R
leadername

hasrespond (R
hasrespond
school (	Rschool

createtime (R
createtime
isfriend	 (Risfriend
showid
 (Rshowid"7
GS2CReadyOrgList#
infos (2.ReadyOrgInfoRinfos"t
GS2CReadyOrgInfo
orgid (Rorgid
aim (	Raim
	left_time (RleftTime
	spread_cd (RspreadCd"N
OrgHistoryInfo
time (Rtime
text (	Rtext
logid (Rlogid"å
OrgMainMemInfo
hisoffer (Rhisoffer
position (Rposition
honor (Rhonor
offer (Roffer
huoyue (Rhuoyue"π
GS2COrgMainInfo
mask (	Rmask
orgid (Rorgid
name (	Rname
aim (	Raim
level (Rlevel
leaderid (Rleaderid

leadername (	R
leadername
	membercnt (R	membercnt"
maxmembercnt	 (Rmaxmembercnt
	onlinemem
 (R	onlinemem
xuetucnt (Rxuetucnt 
maxxuetucnt (Rmaxxuetucnt 
onlinexuetu (Ronlinexuetu
cash (Rcash
boom (Rboom+
historys (2.OrgHistoryInfoRhistorys#
info (2.OrgMainMemInfoRinfo
	applyname (	R	applyname 
applyschool (Rapplyschool$
applylefttime (Rapplylefttime
applypid (Rapplypid&
canapplyleader (Rcanapplyleader"
leaderschool (Rleaderschool
showid (Rshowid"
left_mail_cnt (RleftMailCnt 
left_mail_cd (R
leftMailCd
left_aim_cd (R	leftAimCd"π
OrgMemberInfo
pid (Rpid
name (	Rname
grade (Rgrade
school (Rschool
position (Rposition
hisoffer (Rhisoffer

weekhuoyue (R
weekhuoyue
offline (Roffline
honor	 (Rhonor
jointime
 (Rjointime
optype (Roptype
touxian (Rtouxian"Q
GS2COrgMemberInfo$
infos (2.OrgMemberInfoRinfos
update (Rupdate"ü
OrgApplyJoinInfo
pid (Rpid
name (	Rname
grade (Rgrade
school (Rschool

apply_type (R	applyType
touxian (Rtouxian"\
GS2COrgApplyJoinInfo'
infos (2.OrgApplyJoinInfoRinfos
	auto_join (RautoJoin"4

GS2COrgAim
orgid (Rorgid
aim (	Raim"
GS2CCreateOrg"<
GS2CApplyJoinOrg
flag (Rflag
orgid (Rorgid"Z
GS2CRespondOrg
flag (Rflag
orgid (Rorgid

respondcnt (R
respondcnt"
GS2CUpdateAimResult"!
GS2CDelMember
pid (Rpid"3
GS2CAddMember"
info (2.OrgMemberInfoRinfo"q
GS2CInvited2Org
pid (Rpid
pname (	Rpname
org_name (	RorgName
	org_level (	RorgLevel"=
GS2CJoinOrgResult
orgid (Rorgid
flag (Rflag"%
GS2CDelApplyOrg
pids (Rpids"-
GS2CDelResponseList
orgids (Rorgids"E
GS2CSetPositionResult
pid (Rpid
position (Rposition"M
GS2CApplyJoinOrgResult
orgids (Rorgids
	left_time (RleftTime"(
GS2CDelOrgList
orgids (Rorgids"¡
GS2CApplyLeaderResult
	applyname (	R	applyname 
applyschool (Rapplyschool$
applylefttime (Rapplylefttime
applypid (Rapplypid&
canapplyleader (Rcanapplyleader"H
GS2CSpreadOrgResult
orgid (Rorgid
	spread_cd (RspreadCd"I
OrgRefreshResInfo
orgid (Rorgid

respondcnt (R
respondcnt">
GS2CRefreshRespond(
infos (2.OrgRefreshResInfoRinfos"Ï
OrgFlagInfo
mask (	Rmask
	has_apply (RhasApply(
apply_leader_pid (RapplyLeaderPid
sign_status (R
signStatus!
bonus_status (RbonusStatus

pos_status (R	posStatus
shop_status (R
shopStatus"/
GS2COrgFlag 
info (2.OrgFlagInfoRinfo"?
GS2CGetOnlineMember(
infos (2.base.SimplePlayerRinfos"å
	BuildInfo
bid (Rbid
level (Rlevel

build_time (R	buildTime
	quick_sec (RquickSec
	quick_num (RquickNum"4
GS2CGetBuildInfo 
infos (2
.BuildInfoRinfos"@
ShopItemInfo
item_id (RitemId
buy_cnt (RbuyCnt"6
GS2CGetShopInfo#
items (2.ShopItemInfoRitems"J
GS2COrgRefreshShopUnit
item_id (RitemId
buy_cnt (RbuyCnt"
GS2CBuyItemResult"“
GS2CGetBoonInfo
sign_status (R
signStatus!
bonus_status (RbonusStatus!
bonus_reward (RbonusReward

pos_status (R	posStatus
position (Rposition

pos_reward (R	posReward"\
AchieveInfo
achid (Rachid

ach_status (R	achStatus
process (Rprocess">
GS2CGetAchieveInfo(
achieves (2.AchieveInfoRachieves"K
OrgBaseInfo
mask (	Rmask
cash (Rcash
level (Rlevel"5
GS2COrgInfoChange 
info (2.OrgBaseInfoRinfo"?
GS2CUpdateAchieveInfo&
achieve (2.AchieveInfoRachieve"8
GS2CAddHistoryLog#
info (2.OrgHistoryInfoRinfo"8
GS2CNextPageLog%
infos (2.OrgHistoryInfoRinfos"7
GS2CChatBan
binid (Rbinid
flag (Rflag"F

SimpleInfo
	active_id (RactiveId
	extra_msg (	RextraMsg"A
GS2COrgFaneActiveInfo(
	info_list (2.SimpleInfoRinfoList".
GS2CSetAutoJoin
	auto_join (RautoJoin"O
GS2COrgPrestigeInfo
my_rank (RmyRank
my_prestige (R
myPrestige
Ω
server/engage.proto"ä

MemberInfo
pid (Rpid
name (	Rname
sex (Rsex
grade (Rgrade
degree (Rdegree
couple (Rcouple"h
GS2CEngageCondition%
members (2.MemberInfoRmembers
type (Rtype
status (Rstatus"
GS2CStartEngageResult"
GS2CCancelEngage"
GS2CSetEngageTextUI"
GS2CSetEngageTextRusult"'
GS2CEngageSuccess
type (Rtype"'
GS2CEngageOperate
type (Rtype
±
server/scene.protobase/common.proto"|
GS2CShowScene
scene_id (RsceneId
map_id (RmapId

scene_name (	R	sceneName
x (Rx
y (Ry"g
GS2CEnterScene
scene_id (RsceneId
eid (Reid(
pos_info (2.base.PosInfoRposInfo"÷
GS2CEnterAoi
scene_id (RsceneId
eid (Reid
type (Rtype.

aoi_player (2.base.PlayerAoiR	aoiPlayer%
aoi_npc (2.base.NpcAoiRaoiNpc.

aoi_effect (2.base.EffectAoiR	aoiEffect";
GS2CLeaveAoi
scene_id (RsceneId
eid (Reid"≈
GS2CSyncAoi
scene_id (RsceneId
eid (Reid
type (Rtype>
aoi_player_block (2.base.PlayerAoiBlockRaoiPlayerBlock5
aoi_npc_block (2.base.NpcAoiBlockRaoiNpcBlock"d
GS2CSyncPos
scene_id (RsceneId
eid (Reid(
pos_info (2.base.PosInfoRposInfo"m
GS2CSyncPosQueue
scene_id (RsceneId
eid (Reid,
poslist (2.base.PosQueueInfoRposlist"h
GS2CTrunBackPos
scene_id (RsceneId
eid (Reid(
pos_info (2.base.PosInfoRposInfo"“
GS2CAutoFindPath
npcid (Rnpcid
map_id (RmapId
pos_x (RposX
pos_y (RposY
autotype (Rautotype/
callback_sessionidx (RcallbackSessionidx
functype (Rfunctype"d
GS2CSceneCreateTeam
scene_id (RsceneId
team_id (RteamId
pid_list (RpidList"I
GS2CSceneRemoveTeam
scene_id (RsceneId
team_id (RteamId"d
GS2CSceneUpdateTeam
scene_id (RsceneId
team_id (RteamId
pid_list (RpidList")
GS2CSceneEffect
effect (Reffect"U
GS2CNpcBubbleTalk
npcid (Rnpcid
msg (	Rmsg
timeout (Rtimeout"
GS2CWaterWalkSuccess
ﬂ)
server/task.protobase/common.proto"{
TaskItem
itemid (Ritemid
map_id (RmapId
pos_x (RposX
pos_y (RposY
radius (Rradius"c
PickItem
pickid (Rpickid
map_id (RmapId
pos_x (RposX
pos_y (RposY"œ
	ClientNpc
npctype (Rnpctype
npcid (Rnpcid
name (	Rname
title (	Rtitle
map_id (RmapId(
pos_info (2.base.PosInfoRposInfo.

model_info (2.base.ModelInfoR	modelInfo
xunluoid (Rxunluoid
	ghost_eye	 (RghostEye

func_group
 (	R	funcGroup
no_turnface (R
noTurnface"ö
TaskInfo
taskid (Rtaskid
tasktype (Rtasktype
name (	Rname

targetdesc (	R
targetdesc

detaildesc (	R
detaildesc
target (Rtarget*
needitem (2.base.NeedItemRneeditem'
needsum (2.base.NeedSumRneedsum(
	clientnpc	 (2
.ClientNpcR	clientnpc
isdone
 (Risdone
time (Rtime

rewardinfo (R
rewardinfo%
taskitem (2	.TaskItemRtaskitem%
pickitem (2	.PickItemRpickitem9
needitemgroup (2.base.NeedItemGroupRneeditemgroup
create_time (R
createTime5
ext_apply_info (2.base.ApplyInfoRextApplyInfo(
	follownpc (2
.ClientNpcR	follownpc
isreach (Risreach"6
GS2CLoginTask%
taskdata (2	.TaskInfoRtaskdata"4
GS2CAddTask%
taskdata (2	.TaskInfoRtaskdata">
GS2CDelTask
taskid (Rtaskid
is_done (RisDone"Ä

DialogInfo
type (Rtype
preId (RpreId
content (	Rcontent
voice (Rvoice
timeout (Rtimeout"–

GS2CDialog

sessionidx (R
sessionidx#
dialog (2.DialogInfoRdialog
npc_name (	RnpcName.

model_info (2.base.ModelInfoR	modelInfo
taskid (Rtaskid
noanswer (Rnoanswer"é
GS2CRefreshTask
mask (	Rmask
taskid (Rtaskid
target (Rtarget
name (	Rname

targetdesc (	R
targetdesc

detaildesc (	R
detaildesc
isreach (Risreach5
ext_apply_info (2.base.ApplyInfoRextApplyInfo
time	 (Rtime"¶
GS2CTargetTaskNeeds
taskid (Rtaskid
owner (Rowner
tasktype (Rtasktype*
needitem (2.base.NeedItemRneeditem'
needsum (2.base.NeedSumRneedsum9
needitemgroup (2.base.NeedItemGroupRneeditemgroup5
ext_apply_info (2.base.ApplyInfoRextApplyInfo"B
GS2CSubmitTaskFail
taskid (Rtaskid
npcid (Rnpcid"\
GS2CRefreshTaskClientNpc
taskid (Rtaskid(
	clientnpc (2
.ClientNpcR	clientnpc"Y
GS2CRemoveTaskNpc
taskid (Rtaskid
npcid (Rnpcid
target (Rtarget"G
GS2CRemoveTaskFollowNpc
taskid (Rtaskid
npcid (Rnpcid"G
GS2CConfigTaskFollowNpc
shape (Rshape
config (Rconfig"/
GS2CAcceptableTasks
taskids (Rtaskids"+
GS2CLoginUnlockedTags
tags (Rtags"9
GS2CUnlockTag
tag (Rtag
unlock (Runlock"D
ChapterSection
chapter (Rchapter
section (Rsection"y
GS2CLoginStoryInfo8
chapter_section (2.ChapterSectionRchapterSection)
chapter_rewarded (RchapterRewarded"P
GS2CStoryChapterInfo8
chapter_section (2.ChapterSectionRchapterSection"4
GS2CStoryChapterRewarded
chapter (Rchapter"o
GS2CShimenInfo

done_daily (R	doneDaily
done_weekly (R
doneWeekly

daily_full (R	dailyFull"t
EverydayTask
taskid (Rtaskid
max_cnt (RmaxCnt
cur_cnt (RcurCnt
rewarded (Rrewarded":
GS2CAllEverydayTaskInfo
all (2.EverydayTaskRall"B
GS2CUpdateEverydayTasks'
updates (2.EverydayTaskRupdates"a
GS2COpenTaskSayUI

sessionidx (R
sessionidx
text (	Rtext
channel (Rchannel"8
ExtendOption
text (	Rtext
state (Rstate"ç
GS2CExtendTaskUI
taskid (Rtaskid

sessionidx (R
sessionidx'
options (2.ExtendOptionRoptions
refresh (Rrefresh"/
GS2CExtendTaskUIClose
taskid (Rtaskid"R
GS2CLingxiInfo
mask (	Rmask
taskid (Rtaskid
phase (Rphase"S
GS2CLingxiUseSeed
taskid (Rtaskid&
	seed_item (2	.TaskItemRseedItem"b
GS2CLingxiQteCnt
taskid (Rtaskid
	total_cnt (RtotalCnt
done_cnt (RdoneCnt"–
GS2CLingxiQuestion
taskid (Rtaskid
round (Rround
ques (Rques
total_round (R
totalRound
correct_cnt (R
correctCnt
rest_sec (RrestSec
	my_answer (RmyAnswer"{
GS2CLingxiQuestionAnswered
taskid (Rtaskid
round (Rround
ques (Rques
	my_answer (RmyAnswer"1
GS2CLingxiQuestionClose
taskid (Rtaskid"
GS2CRunringIntro"i
XuanShangTask
taskid (Rtaskid
npcid (Rnpcid
star (Rstar
status (Rstatus"f
GS2CRefreshXuanShang
mask (	Rmask$
tasks (2.XuanShangTaskRtasks
count (Rcount">
GS2CRefreshXuanShangUnit"
task (2.XuanShangTaskRtask"
GS2COpenXuanShangView"
GS2CXuanShangStarTip"W
ZhenmoLayer
layer (Rlayer
reward (Rreward
complete (Rcomplete"V
GS2CZhenmoRefresh$
layers (2.ZhenmoLayerRlayers
	is_newday (RisNewday"6
ZhenmoReward
id (Rid
amount (Ramount"ä
GS2CZhenmoSpecialReward
mask (	Rmask'
rewards (2.ZhenmoRewardRrewards
is_open (RisOpen
war_time (RwarTime"
GS2CZhenmoOpenView
…
server/wing.proto";
TimeWing
wing_id (RwingId
expire (Rexpire"º
WingInfo
mask (	Rmask
id (Rid
exp (Rexp
star (Rstar
level (Rlevel
score (Rscore

phy_attack (R	phyAttack
phy_defense (R
phyDefense

mag_attack	 (R	magAttack
mag_defense
 (R
magDefense

cure_power (R	curePower
speed (Rspeed

seal_ratio (R	sealRatio$
res_seal_ratio (RresSealRatio,
phy_critical_ratio (RphyCriticalRatio3
res_phy_critical_ratio (RresPhyCriticalRatio,
mag_critical_ratio (RmagCriticalRatio3
res_mag_critical_ratio (RresMagCriticalRatio/
time_wing_list (2	.TimeWingRtimeWingList
	show_wing (RshowWing
max_hp (RmaxHp
max_mp (RmaxMp"4
GS2CRefreshWingInfo
info (2	.WingInfoRinfo"I
GS2CLoginWing
info (2	.WingInfoRinfo
has_open (RhasOpen"7
GS2CRefreshOneTimeWing
info (2	.TimeWingRinfo
˚'
server/rank.protobase/common.proto"Å

UpvoteRank
pid (Rpid
name (	Rname
upvote (Rupvote
school (Rschool

rank_shift (R	rankShift"~
	GradeRank
pid (Rpid
grade (Rgrade
name (	Rname
school (Rschool

rank_shift (R	rankShift"û
PlayerScoreRank
pid (Rpid
score (Rscore
name (	Rname
school (Rschool
touxian (Rtouxian

rank_shift (R	rankShift"ú
RoleScoreRank
pid (Rpid
score (Rscore
name (	Rname
school (Rschool
touxian (Rtouxian

rank_shift (R	rankShift"û
SummonScoreRank
pid (Rpid
score (Rscore
name (	Rname
type (Rtype
	ownername (	R	ownername

rank_shift (R	rankShift"u
FriendDegreeRank
pid (Rpid#
friend_degree (RfriendDegree
name (	Rname
school (Rschool"ì
BiWuRank
pid (Rpid
point (Rpoint
name (	Rname
school (Rschool
grade (Rgrade

rank_shift (R	rankShift"ô
OrgPrestigeRank
pid (Rpid
name (	Rname
orgid (Rorgid
orgname (	Rorgname
orglv (Rorglv
prestige (Rprestige"É
KaiFuGradeRank
pid (Rpid
grade (Rgrade
name (	Rname
school (Rschool

rank_shift (R	rankShift"ù
KaiFuScoreRank
pid (Rpid
score (Rscore
name (	Rname
school (Rschool
touxian (Rtouxian

rank_shift (R	rankShift"û
KaiFuSummonRank
pid (Rpid
score (Rscore
name (	Rname
type (Rtype
	ownername (	R	ownername

rank_shift (R	rankShift"£
KaiFuOrgRank
prestige (Rprestige
orgid (Rorgid
name (	Rname
orgname (	Rorgname
orglv (Rorglv

rank_shift (R	rankShift"Ü
ScoreSchoolRank
pid (Rpid
score (Rscore
name (	Rname
orgname (	Rorgname

rank_shift (R	rankShift"n
JuBaoPenScoreRank
pid (Rpid
score (Rscore
name (	Rname

rank_shift (R	rankShift"ï
CommonRankUnit
cnt (Rcnt
score (Rscore
pid (Rpid
name (	Rname
school (Rschool

rank_shift (R	rankShift"ò
ThreeBiWuRank
pid (Rpid
point (Rpoint
name (	Rname
school (Rschool
grade (Rgrade

rank_shift (R	rankShift"â
LuanShiMoYingScoreRank
pid (Rpid
score (Rscore
name (	Rname
grade (Rgrade

rank_shift (R	rankShift"q
ImperialexamRank
pid (Rpid
usetime (Rusetime
name (	Rname

rank_shift (R	rankShift"£
WorldCupRank
pid (Rpid
school (Rschool
name (	Rname
	suc_count (RsucCount
suc_rate (RsucRate

rank_shift (R	rankShift"”
GS2CGetRankInfo
idx (Ridx
page (Rpage

first_stub (R	firstStub
my_rank (RmyRank,
upvote_rank (2.UpvoteRankR
upvoteRank)

grade_rank (2
.GradeRankR	gradeRank<
player_score_rank (2.PlayerScoreRankRplayerScoreRank6
role_score_rank (2.RoleScoreRankRroleScoreRank<
summon_score_rank	 (2.SummonScoreRankRsummonScoreRank?
friend_degree_rank
 (2.FriendDegreeRankRfriendDegreeRank&
	biwu_rank (2	.BiWuRankRbiwuRank"
my_rank_value (RmyRankValue5
prestige_rank (2.OrgPrestigeRankRprestigeRank9
kaifu_grade_rank (2.KaiFuGradeRankRkaifuGradeRank9
kaifu_score_rank (2.KaiFuScoreRankRkaifuScoreRank<
kaifu_summon_rank (2.KaiFuSummonRankRkaifuSummonRank3
kaifu_org_rank (2.KaiFuOrgRankRkaifuOrgRank<
score_school_rank (2.ScoreSchoolRankRscoreSchoolRankB
jubaopen_score_rank (2.JuBaoPenScoreRankRjubaopenScoreRank8
resume_goldcoin (2.CommonRankUnitRresumeGoldcoin4
treasure_find (2.CommonRankUnitRtreasureFind.

fuyuan_box (2.CommonRankUnitR	fuyuanBox0
wash_summon (2.CommonRankUnitR
washSummon.

make_equip (2.CommonRankUnitR	makeEquip0
send_flower (2.CommonRankUnitR
sendFlower.

kill_ghost (2.CommonRankUnitR	killGhost2
kill_monster (2.CommonRankUnitRkillMonster6
strength_equip (2.CommonRankUnitRstrengthEquip5
threebiwu_rank (2.ThreeBiWuRankRthreebiwuRankQ
luanshimoying_score_rank (2.LuanShiMoYingScoreRankRluanshimoyingScoreRankJ
imperialexam_firststage (2.ImperialexamRankRimperialexamFirststageL
imperialexam_secondstage  (2.ImperialexamRankRimperialexamSecondstage2
worldcup_rank! (2.WorldCupRankRworldcupRank"™
RankRoleInfo
pid (Rpid
name (	Rname
upvote (Rupvote
school (Rschool
value (Rvalue.

model_info (2.base.ModelInfoR	modelInfo"`
RankSummonInfo
pid (Rpid
name (	Rname
type (Rtype
score (Rscore"ö
GS2CGetRankTop3
idx (Ridx
my_rank (RmyRank*
	role_info (2.RankRoleInfoRroleInfo0
summon_info (2.RankSummonInfoR
summonInfo"?
GS2CGetUpvoteAmount
pid (Rpid
upvote (Rupvote"D
GS2CSumBasciInfo0

summondata (2.base.SummonInfoR
summondata
l
server/touxian.protobase/common.proto"A
GS2CUpgradeTouxianInfo'
infos (2.base.TouxianInfoRinfos
⁄
server/stall.protobase/common.proto"»
	StallGrid
pos_id (RposId
sid (Rsid
amount (Ramount
price (Rprice
	sell_time (RsellTime
cash (Rcash
quality (Rquality
query_id (RqueryId"X
GS2CStallAllGrid%
grid_all (2
.StallGridRgridAll

size_limit (R	sizeLimit";
GS2CStallOneGrid'
	grid_unit (2
.StallGridRgridUnit"2
GS2CSendSizeLimit

size_limit (R	sizeLimit"™
CatalogUnit
sid (Rsid
amount (Ramount
price (Rprice
type (Rtype
pos_id (RposId
status (Rstatus
quality (Rquality"î
GS2CSendCatalog
cat_id (RcatId
refresh (Rrefresh&
catalog (2.CatalogUnitRcatalog
page (Rpage
total (Rtotal"N
GS2CSendCatalogUnit
cat_id (RcatId 
unit (2.CatalogUnitRunit"5
GridCash
pos_id (RposId
cash (Rcash"=
GS2CWithdrawAllCash&
	cash_list (2	.GridCashRcashList"@
GS2CSendItemDetail*
itemdata (2.base.ItemInfoRitemdata":
GS2CDefaultPrice
sid (Rsid
price (Rprice"
GS2CStallRedPoint
¥
server/friend.protobase/common.proto"=

SingleChat

message_id (	R	messageId
msg (	Rmsg"M
LoginFriendChat
pid (Rpid(
	chat_list (2.SingleChatRchatList"£
RecommendFriend
pid (Rpid
name (	Rname
shape (	Rshape
type (Rtype
grade (Rgrade
school (Rschool
icon (Ricon"H
OnlineStatusInfo
pid (Rpid"
onlinestatus (Ronlinestatus"π
GS2CLoginFriend:
friend_chat_list (2.LoginFriendChatRfriendChatList

black_list (R	blackListK
friend_onlinestatus_list (2.OnlineStatusInfoRfriendOnlinestatusList"G
GS2CAddFriend6
profile_list (2.base.FriendProfileRprofileList"*
GS2CDelFriend
pid_list (RpidList"O
GS2CUpdateFriendDegree
pid (Rpid#
friend_degree (RfriendDegree"@
GS2CAckChatTo
pid (Rpid

message_id (	R	messageId"Q
GS2CChatFrom
pid (Rpid
msg (	Rmsg

message_id (	R	messageId"\
GS2CRecommendFriendsD
recommend_friend_list (2.RecommendFriendRrecommendFriendList"M
GS2CStrangerProfile6
profile_list (2.base.FriendProfileRprofileList"-
GS2CFriendShield
pid_list (RpidList"/
GS2CFriendUnshield
pid_list (RpidList"®
GS2COpenSendFlowerUI
pid (Rpid
name (	Rname
icon (Ricon
grade (Rgrade#
friend_degree (RfriendDegree
	role_type (RroleType"?
GS2CSendFlowerSuccess
pid (Rpid
bless (	Rbless"I
GS2CRefreshFriendProfile-
profile (2.base.FriendProfileRprofile"8
GS2CVerifyFriend
pid (Rpid
name (	Rname"M
VerifyFriendConfirm
pid (Rpid
name (	Rname
msg (	Rmsg"P
GS2CVerifyFriendConfirm5
verify_list (2.VerifyFriendConfirmR
verifyList"/
GS2CNotifyRefuseStrangerMsg
pid (Rpid"D
GS2CRefreshFriendProfileBoth
pid (Rpid
both (Rboth"_
GS2CPlayerProfile6
profile_list (2.base.FriendProfileRprofileList
flag (Rflag
¥
server/login.protobase/common.proto"
	GS2CHello
time (Rtime"N
GS2CLoginError
pid (Rpid
errcode (Rerrcode
cmd (	Rcmd"?
GS2CRegistAccount
account (	Raccount
pwd (	Rpwd"=
GS2CLoginVerify
account (	Raccount
pwd (	Rpwd"u
GS2CLoginAccount
account (	Raccount-
	role_list (2.base.SimpleRoleRroleList
channel (Rchannel" 
GS2CLoginRole
account (	Raccount
pid (Rpid
role (2
.base.RoleRrole
is_gm (RisGm

role_token (	R	roleToken
create_time (R
createTime
channel (Rchannel"ã
GS2CCreateRole
account (	Raccount$
role (2.base.SimpleRoleRrole
channel (Rchannel
create_time (R
createTime":
GS2CLoginPendingUI
time (Rtime
cnt (Rcnt"
GS2CLoginPendingEnd"0
GS2CInviteCodeResult
errcode (Rerrcode"E
GS2CSetInviteCodeResult
errcode (Rerrcode
msg (	Rmsg"|
GS2CQueryLogin
delete_file (	R
deleteFile5
res_file (2.base.ClientResFileContentRresFile
code (	Rcode
Î
server/tempitem.protobase/common.proto"?
GS2CLoginTempItem*
itemdata (2.base.ItemInfoRitemdata"=
GS2CAddTempItem*
itemdata (2.base.ItemInfoRitemdata"A
GS2CRefreshTempItem*
itemdata (2.base.ItemInfoRitemdata"!
GS2CDelTempItem
id (Rid"C
GS2CRefreshAllTemItem*
itemdata (2.base.ItemInfoRitemdata"
GS2COpenTempItemUI