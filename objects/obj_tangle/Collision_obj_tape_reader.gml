/// @description Insert description here
// You can write your code in this editor


obj_player.game_score -= 200;
obj_player.life_count -= 1;
audio_play_sound(snd_life_lost, 1, false);
instance_destroy();