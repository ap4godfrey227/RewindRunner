/// @description Insert description here
// You can write your code in this editor
if((room == Level1) || (room == Level2) || (room == Level3)){
x += cam_speed;

if(x < 638)
{
	x = 638;
}

if(x > 15362)
{
	x = 15362;
}

// AUDIO

if(obj_player.is_reversed && !is_rewind_changed)
{
	if(room == Level1)
	{
		prev_track_position = audio_sound_get_track_position(snd_level1);
		audio_stop_all();
		audio_play_sound(snd_level1_reversed, 0, true);
		audio_sound_set_track_position(snd_level1_reversed, level1_r_snd_length - prev_track_position);
		is_rewind_changed = true;
	}
	if(room == Level2)
	{
		prev_track_position = audio_sound_get_track_position(snd_level2);
		audio_stop_all();
		audio_play_sound(snd_level2_reversed, 0, true);
		audio_sound_set_track_position(snd_level2_reversed, level2_r_snd_length - prev_track_position);
		is_rewind_changed = true;
	}
	if(room == Level3)
	{
		prev_track_position = audio_sound_get_track_position(snd_level3);
		audio_stop_all();
		audio_play_sound(snd_level3_reversed, 0, true);
		audio_sound_set_track_position(snd_level3_reversed, level3_r_snd_length - prev_track_position);
		is_rewind_changed = true;
	}
}
if(!obj_player.is_reversed && is_rewind_changed)
{
	if(room == Level1)
	{
		prev_track_position = audio_sound_get_track_position(snd_level1_reversed);
		audio_stop_all();
		audio_play_sound(snd_level1, 0, true);
		audio_sound_set_track_position(snd_level1, level1_snd_length - prev_track_position);
		is_rewind_changed = false;
	}
	if(room == Level2)
	{
		prev_track_position = audio_sound_get_track_position(snd_level2_reversed);
		audio_stop_all();
		audio_play_sound(snd_level2, 0, true);
		audio_sound_set_track_position(snd_level2, level2_snd_length - prev_track_position);
		is_rewind_changed = false;
	}
	if(room == Level3)
	{
		prev_track_position = audio_sound_get_track_position(snd_level3_reversed);
		audio_stop_all();
		audio_play_sound(snd_level3, 0, true);
		audio_sound_set_track_position(snd_level3, level3_snd_length - prev_track_position);
		is_rewind_changed = false;
	}
}


if(obj_player.is_fastforward && !is_fastforward_changed)
{
	if(room == Level1)
	{
		audio_sound_pitch(snd_level1, 2);
		is_fastforward_changed = true;
	}
	if(room == Level2)
	{
		audio_sound_pitch(snd_level2, 2);
		is_fastforward_changed = true;
	}
	if(room == Level3)
	{
		audio_sound_pitch(snd_level3, 2);
		is_fastforward_changed = true;
	}
}
if(!obj_player.is_fastforward && is_fastforward_changed)
{
	if(room == Level1)
	{
		audio_sound_pitch(snd_level1, 1);
		is_fastforward_changed = false;
	}
	if(room == Level2)
	{
		audio_sound_pitch(snd_level2, 1);
		is_fastforward_changed = false;
	}
	if(room == Level3)
	{
		audio_sound_pitch(snd_level3, 1);
		is_fastforward_changed = false;
	}
}
}