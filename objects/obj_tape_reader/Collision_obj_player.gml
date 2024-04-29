/// @description Insert description here
// You can write your code in this editor


if(current_cooldown <= 0)
{
	obj_player.hp -= 5;
	current_cooldown = cooldown;
}

current_cooldown--;