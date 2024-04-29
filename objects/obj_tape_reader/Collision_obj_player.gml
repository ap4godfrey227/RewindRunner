/// @description Insert description here
// You can write your code in this editor


if(current_cooldown <= 0)
{
	obj_player.hp -= 2;
	current_cooldown = cooldown;
}

current_cooldown--;