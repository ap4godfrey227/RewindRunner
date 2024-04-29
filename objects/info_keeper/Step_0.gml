/// @description Insert description here
// You can write your code in this editor

if((room == Level1) || (room == Level2) || (room == Level3))
{
	player_life_count = obj_player.life_count;
	player_hp = obj_player.hp;
	player_score = obj_player.game_score;
}

if(room == TitleScreen)
{
	player_life_count = 3;
	player_hp = 100;
	player_score = 0;
}