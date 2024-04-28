/// @description Insert description here
// You can write your code in this editor

if(mouse_y <= (obj_player.y-96))
{
	if(mouse_x > obj_player.x)
	{
		direction = point_direction(obj_player.x, obj_player.y, obj_player.x + 1, obj_player.y - 1);
	}
	else
	{
		direction = point_direction(obj_player.x, obj_player.y, obj_player.x - 1, obj_player.y - 1);
	}
}
else if(mouse_y >= (obj_player.y+96))
{
	if(mouse_x > obj_player.x)
	{
		direction = point_direction(obj_player.x, obj_player.y, obj_player.x + 1, obj_player.y + 1);
	}
	else
	{
		direction = point_direction(obj_player.x, obj_player.y, obj_player.x - 1, obj_player.y + 1);
	}
}
else
{
	if(mouse_x > obj_player.x)
	{
		direction = point_direction(obj_player.x, obj_player.y, obj_player.x + 1, obj_player.y);
	}
	else
	{
		direction = point_direction(obj_player.x, obj_player.y, obj_player.x - 1, obj_player.y);
	}
}

speed = 32;
damage = 7;
collided = false;