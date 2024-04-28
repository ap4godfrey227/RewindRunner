/// @description Insert description here
// You can write your code in this editor

cam_speed = 1;

score = 0;

// AUDIO
level1_snd_length = audio_sound_length(snd_level1);
level1_r_snd_length = audio_sound_length(snd_level1_reversed);
level2_snd_length = audio_sound_length(snd_level2);
level2_r_snd_length = audio_sound_length(snd_level2_reversed);
level3_snd_length = audio_sound_length(snd_level3);
level3_r_snd_length = audio_sound_length(snd_level3_reversed);

if(room == Level1)
{
	audio_stop_all();
	audio_play_sound(snd_level1, 0, true);
}

if(room == Level2)
{
	audio_stop_all();
	audio_play_sound(snd_level2, 0, true);
}

if(room == Level3)
{
	audio_stop_all();
	audio_play_sound(snd_level3, 0, true);
}

is_rewind_changed = false;
is_fastforward_changed = false;

prev_track_position = 0;