/// @description Insert description here
// You can write your code in this editor

if(hp <= 0)
{
	instance_destroy();
}

if(heat_seek >= 0)
{
	direction = point_direction(x, y, obj_player.x, obj_player.y);
	heat_seek--;
}