/// @description Insert description here
// You can write your code in this editor

//if(current_collision_cd >= collision_cd)

obj_player.game_score -= 15;
obj_player.hp -= 7;
audio_play_sound(snd_hurt, 1, false);
instance_destroy();
	
