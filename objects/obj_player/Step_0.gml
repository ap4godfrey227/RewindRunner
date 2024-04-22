/// @description Insert description here
// You can write your code in this editor

// controls
key_jump = keyboard_check_pressed(vk_space);
key_jump_held = keyboard_check(vk_space);
key_right = keyboard_check(ord("D"));
key_left = keyboard_check(ord("A"));
left_click = mouse_check_button_pressed(mb_left);


// ************MOVEMENT*****************

// Move Left and Right
var hmove = key_right - key_left;
if(hmove != 0)
{
	hsp = move_sp * hmove;
}
else
{
	hsp = 0;
}


// Jumping
if((key_jump == 1) && (is_grounded == 1))
{
	vsp += jump;
}
/* Variable jump
if((vsp < 0) && (!key_jump_held))
{
	vsp = max(vsp, jump / jump_mod);
}
*/


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

x += hsp;
y += vsp;



// ************WEAPONS*****************

//Scroll to equip
if(mouse_wheel_up())
{
	equipped_weapon = equipped_weapon - 1;
	if(equipped_weapon == -1) {equipped_weapon = 3;}
}
if(mouse_wheel_down())
{
	equipped_weapon = (equipped_weapon + 1) % 4;
}


// Trumpet
if(equipped_weapon == 0)
{
	if(left_click)
	{
		instance_create_layer(x, y, "Instances", obj_q_note);
	}
}


