/// @description Insert description here
// You can write your code in this editor


if(!player_col && (current_collision_cd > collision_cd))
{
	player_col = true;
	current_collision_cd = 0;
	obj_player.game_score -= 10;
	obj_player.hp -= 10;
}
if(current_collision_cd <= collision_cd)
{
	current_collision_cd += 1;
}
else
{
	player_col = false;
}