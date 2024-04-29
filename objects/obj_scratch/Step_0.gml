/// @description Insert description here
// You can write your code in this editor


if(hp <= 0)
{
	instance_destroy();
}

if(distance_to_object(obj_manager) < 683)
{
// ATTACK

should_throw = floor(random_range(0, 100 + 1));

if((should_throw == 1) && (current_attack_cd >= attack_cd))
{
	instance_create_layer(x, y, "Instances", obj_scratch_throw);
	current_attack_cd = 0;
}

if(current_attack_cd < attack_cd)
{
	current_attack_cd++;
}


// Collisions
	
	// Horizontal
if(place_meeting(x + hsp, y, obj_floor))
{
	while(!place_meeting(x + sign(hsp), y, obj_floor))
	{
		x = x + sign(hsp);
	}
	hsp = 0;
}

	// Vertical
if(place_meeting(x, y + vsp, obj_floor))
{
	while(!place_meeting(x, y + sign(vsp), obj_floor))
	{
		y = y + sign(vsp);
	}
	vsp = 0;
}

if(current_move_cd <= (move_cd/2))
{
	vsp += sign(move_up) * 1;
	
	if(current_move_cd <= 0)
	{
		current_move_cd = move_cd;
		move_up = -move_up;
	}
}
vsp = clamp(vsp, -vsp_max, vsp_max);
current_move_cd--;


hsp = 1;
should_move = floor(random_range(0, 100 + 1));

if((should_move%10) == 0)
{
	hsp = -20;
}


x += hsp;
y += vsp;
}