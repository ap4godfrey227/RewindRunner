/// @description Insert description here
// You can write your code in this editor


// MOVEMENT
hsp = 0;
vsp = 0;
move_sp = 4;
is_grounded = 0;
jump = -8;
//jump_mod = 2.5;
grav = 0.4;
vsp_max = 8;


// WEAPONS
equipped_weapon = 0; // 0 = Trumpet, 1 = guitar, 2 = tuba, 3 = snare
can_fire_trumpet = 1;
can_fire_guitar = 1;
can_fire_tuba = 1;
can_fire_snare = 30;
snare_check = 1;

// SPRITES
sprite_arr[0] = spr_player_trumpet_f;
sprite_arr[1] = spr_player_guitar_f;
sprite_arr[2] = spr_player_tuba_f;
sprite_arr[3] = spr_player_snare_f;
sprite_arr[4] = spr_player_trumpet_b;
sprite_arr[5] = spr_player_guitar_b;
sprite_arr[6] = spr_player_tuba_b;
sprite_arr[7] = spr_player_snare_b;
sprite_arr[8] = spr_player_trumpet_f_c;
sprite_arr[9] = spr_player_guitar_f_c;
sprite_arr[10] = spr_player_tuba_f_c;
sprite_arr[11] = spr_player_snare_f_c;
sprite_arr[12] = spr_player_trumpet_b_c;
sprite_arr[13] = spr_player_guitar_b_c;
sprite_arr[14] = spr_player_tuba_b_c;
sprite_arr[15] = spr_player_snare_b_c;

sprite_index = sprite_arr[0];
prev_dir = 1;

// GUI
life_count = 3;
hp = 100;
game_score = 0;


// ABILITIES
rewind_cd = 600;
rewind_cd_regen = true;
fastforward_cd = 600;
fastforward_cd_regen = true;
