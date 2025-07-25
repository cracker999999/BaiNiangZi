module(...)
--magic editor build
DATA={
	atk_stophit=true,
	cmds={
		[1]={
			args={action_name=[[runWar]],excutor=[[atkobj]],},
			func_name=[[PlayAction]],
			start_time=0,
		},
		[2]={
			args={
				begin_type=[[current]],
				calc_face=true,
				ease_type=[[Linear]],
				end_relative={base_pos=[[vic]],depth=0,relative_angle=0,relative_dis=1.3,},
				end_type=[[end_relative]],
				excutor=[[atkobj]],
				look_at_pos=true,
				move_time=0.3,
				move_type=[[line]],
			},
			func_name=[[Move]],
			start_time=0,
		},
		[3]={
			args={sound_path={soundpath=[[Audio/Sound/War/quanji.ogg]],},},
			func_name=[[PlaySound]],
			start_time=0.3,
		},
		[4]={
			args={action_name=[[attack1]],bak_action_name=[[attack1]],excutor=[[atkobj]],},
			func_name=[[PlayAction]],
			start_time=0.5,
		},
		[5]={
			args={
				alive_time=1,
				effect={
					is_cached=true,
					magic_layer=[[center]],
					path=[[Effect/Magic/skill_eff_1110_attack1_att/Prefabs/skill_eff_1110_attack1_att_0.prefab]],
					preload=false,
				},
				effect_dir_type=[[forward]],
				effect_pos={base_pos=[[atk]],depth=0,relative_angle=0,relative_dis=0,},
				excutor=[[atkobj]],
			},
			func_name=[[StandEffect]],
			start_time=0.7,
		},
		[6]={
			args={
				consider_hight=false,
				damage_follow=true,
				face_atk=false,
				hurt_delta=0,
				play_anim=true,
				shot=true,
			},
			func_name=[[VicHitInfo]],
			start_time=0.8,
		},
		[7]={
			args={
				alive_time=1,
				effect={
					is_cached=true,
					magic_layer=[[center]],
					path=[[Effect/Magic/skill_eff_100_hit/Prefabs/skill_eff_100_hit_yellow.prefab]],
					preload=false,
				},
				effect_dir_type=[[empty]],
				effect_pos={base_pos=[[vic]],depth=0.7,relative_angle=0,relative_dis=0,},
				excutor=[[vicobj]],
			},
			func_name=[[StandEffect]],
			start_time=0.85,
		},
		[8]={args={},func_name=[[End]],start_time=1.2,},
	},
	group_cmds={},
	pre_load_res={},
	run_env=[[war]],
	type=1,
	wait_goback=true,
}
