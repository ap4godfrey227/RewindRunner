/// @description Insert description here
// You can write your code in this editor

if(room == LoseScreen)
{
	audio_stop_all();
	audio_play_sound(snd_lose, 0, false);
}
else
{
	audio_stop_all();
	audio_play_sound(snd_win, 0, false);
}
alarm_set(0, 120);