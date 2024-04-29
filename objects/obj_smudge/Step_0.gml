/// @description Insert description here
// You can write your code in this editor

if(hp <= 0)
{
	instance_destroy();
}


if(current_move_cd <= 0)
{
	hsp = -1 * move_sp;
	vsp += jump;
	
	current_move_cd = move_cd;
}

current_move_cd--;



// Gravity
	vsp += grav;


// Speed Constraint
	vsp = clamp(vsp, -vsp_max, vsp_max);
	
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
	is_grounded = 1;
	vsp = 0;
} 
else
{
	is_grounded = 0;
}

if(!is_grounded){image_speed = 1;}
else{image_speed = 0;}

x += hsp;
y += vsp;