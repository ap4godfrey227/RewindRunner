/// @description Insert description here
// You can write your code in this editor

obj_player.hp -= 10;
audio_play_sound(snd_hurt, 1, false);
instance_destroy();
