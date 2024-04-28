/// @description Insert description here
// You can write your code in this editor

x += cam_speed;

if(x < 638)
{
	x = 638;
}

if(x > 19362)
{
	x = 19362;
}


if(obj_player.is_reversed && !is_changed)
{
	if(room == Level1)
	{
		prev_track_position = audio_sound_get_track_position(snd_level1);
		audio_stop_all();
		audio_play_sound(snd_level1_reversed, 0, true);
		audio_sound_set_track_position(snd_level1_reversed, level1_r_snd_length - prev_track_position);
		is_changed = true;
	}
	if(room == Level2)
	{
		prev_track_position = audio_sound_get_track_position(snd_level2);
		audio_stop_all();
		audio_play_sound(snd_level2_reversed, 0, true);
		audio_sound_set_track_position(snd_level2_reversed, level2_r_snd_length - prev_track_position);
		is_changed = true;
	}
	if(room == Level3)
	{
		prev_track_position = audio_sound_get_track_position(snd_level3);
		audio_stop_all();
		audio_play_sound(snd_level3_reversed, 0, true);
		audio_sound_set_track_position(snd_level3_reversed, level3_r_snd_length - prev_track_position);
		is_changed = true;
	}
}
if(!obj_player.is_reversed && is_changed)
{
	if(room == Level1)
	{
		prev_track_position = audio_sound_get_track_position(snd_level1_reversed);
		audio_stop_all();
		audio_play_sound(snd_level1, 0, true);
		audio_sound_set_track_position(snd_level1, level1_snd_length - prev_track_position);
		is_changed = false;
	}
	if(room == Level2)
	{
		prev_track_position = audio_sound_get_track_position(snd_level2_reversed);
		audio_stop_all();
		audio_play_sound(snd_level2, 0, true);
		audio_sound_set_track_position(snd_level2, level2_snd_length - prev_track_position);
		is_changed = false;
	}
	if(room == Level3)
	{
		prev_track_position = audio_sound_get_track_position(snd_level3_reversed);
		audio_stop_all();
		audio_play_sound(snd_level3, 0, true);
		audio_sound_set_track_position(snd_level3, level3_snd_length - prev_track_position);
		is_changed = false;
	}
}