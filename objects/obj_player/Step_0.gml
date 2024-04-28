/// @description Insert description here
// You can write your code in this editor

// controls
key_jump = keyboard_check_pressed(vk_space);
key_jump_held = keyboard_check(vk_space);
key_right = keyboard_check(ord("D"));
key_left = keyboard_check(ord("A"));
left_click = mouse_check_button_pressed(mb_left);
left_click_held = mouse_check_button(mb_left);
crouch_held = keyboard_check(vk_shift);
rewind_held = keyboard_check(ord("S"));
rewind_up = keyboard_check_released(ord("S"));
fastforward_held = keyboard_check(ord("W"));
fastforward_up = keyboard_check_released(ord("W"));


// ************MOVEMENT*****************

// Move Left and Right
var is_moving_h = key_right - key_left;
if(is_moving_h != 0)
{
	if(is_moving_h == 1){prev_dir = 1;}
	if(is_moving_h == -1){prev_dir = -1;}
	hsp = move_sp * is_moving_h;
	if(hsp >=0)
	{
		if(!crouch_held){sprite_index = sprite_arr[equipped_weapon];}
		else{sprite_index = sprite_arr[equipped_weapon+8];}
	}
	else
	{
		if(!crouch_held){sprite_index = sprite_arr[equipped_weapon+4];}
		else{sprite_index = sprite_arr[equipped_weapon+12];}
	}
	image_speed = 1;
}
else
{
	hsp = 0;
	if(prev_dir == 1)
	{
		if(!crouch_held){sprite_index = sprite_arr[equipped_weapon];}
		else{sprite_index = sprite_arr[equipped_weapon+8];}
	}
	else
	{
		if(!crouch_held){sprite_index = sprite_arr[equipped_weapon+4];}
		else{sprite_index = sprite_arr[equipped_weapon+12];}
	}
	image_speed = 0;
	image_index = 0;
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
	if(hsp >=0){sprite_index = sprite_arr[equipped_weapon];}
	else{sprite_index = sprite_arr[equipped_weapon+4];}
}
if(mouse_wheel_down())
{
	equipped_weapon = (equipped_weapon + 1) % 4;
	if(hsp >=0){sprite_index = sprite_arr[equipped_weapon];}
	else{sprite_index = sprite_arr[equipped_weapon+4];}
}


// Trumpet
if(equipped_weapon == 0)
{
	if((left_click || left_click_held) && can_fire_trumpet)
	{
		if(!crouch_held)
		{
			if(mouse_x >= obj_player.x){sprite_index = sprite_arr[equipped_weapon]; prev_dir = 1;}
			else{sprite_index = sprite_arr[equipped_weapon+4]; prev_dir = -1;}
		}
		else
		{
			if(mouse_x >= obj_player.x){sprite_index = sprite_arr[equipped_weapon+8]; prev_dir = 1;}
			else{sprite_index = sprite_arr[equipped_weapon+12]; prev_dir = -1;}
		}
		instance_create_layer(x, y, "Instances", obj_q_note);
		can_fire_trumpet = 0;
		alarm_set(0, 60);
	}
}

// Guitar
if(equipped_weapon == 1)
{
	if((left_click || left_click_held) && can_fire_guitar)
	{
		if(!crouch_held)
		{
			if(mouse_x >= obj_player.x){sprite_index = sprite_arr[equipped_weapon]; prev_dir = 1;}
			else{sprite_index = sprite_arr[equipped_weapon+4]; prev_dir = -1;}
		}
		else
		{
			if(mouse_x >= obj_player.x){sprite_index = sprite_arr[equipped_weapon+8]; prev_dir = 1;}
			else{sprite_index = sprite_arr[equipped_weapon+12]; prev_dir = -1;}
		}
		instance_create_layer(x, y, "Instances", obj_e_note);
		can_fire_guitar = 0;
		alarm_set(1, 30);
	}
}

// Tuba
if(equipped_weapon == 2)
{
	if((left_click || left_click_held) && can_fire_tuba)
	{
		if(!crouch_held)
		{
			if(mouse_x >= obj_player.x){sprite_index = sprite_arr[equipped_weapon]; prev_dir = 1;}
			else{sprite_index = sprite_arr[equipped_weapon+4]; prev_dir = -1;}
		}
		else
		{
			if(mouse_x >= obj_player.x){sprite_index = sprite_arr[equipped_weapon+8]; prev_dir = 1;}
			else{sprite_index = sprite_arr[equipped_weapon+12]; prev_dir = -1;}
		}
		instance_create_layer(x, y, "Instances", obj_w_note);
		can_fire_tuba = 0;
		alarm_set(2, 240);
	}
}

// Snare
if(equipped_weapon == 3)
{
	if(left_click_held && (can_fire_snare > 0))
	{
		if(!crouch_held)
		{
			if(mouse_x >= obj_player.x){sprite_index = sprite_arr[equipped_weapon]; prev_dir = 1;}
			else{sprite_index = sprite_arr[equipped_weapon+4]; prev_dir = -1;}
		}
		else
		{
			if(mouse_x >= obj_player.x){sprite_index = sprite_arr[equipped_weapon+8]; prev_dir = 1;}
			else{sprite_index = sprite_arr[equipped_weapon+12]; prev_dir = -1;}
		}
		for(var i=0; i < 360; i += 30)
		{
			var inst = instance_create_layer(x, y, "Instances", obj_s_note);
			inst.direction = i;
		}
		can_fire_snare--;
	}
	if(can_fire_snare <= 0 && snare_check)
	{
		alarm_set(3, 600);
		snare_check = 0;
	}
}




// ************ABILITIES*****************

// Rewind

if(rewind_held && (rewind_cd >= 1) && rewind_cd_regen)
{
	obj_manager.cam_speed = -2;
	rewind_cd -= 2;
}
else
{
	obj_manager.cam_speed = 1;
	if(rewind_cd < 600){rewind_cd += 1;}
}
if(rewind_up)
{
	rewind_cd_regen = false;
}
if(!rewind_held && (rewind_cd <= 600))
{
	obj_manager.cam_speed = 1;
	rewind_cd += 1;
}
if(rewind_cd >= 600)
{
	rewind_cd_regen = true;
}


// Fast Forward

if(fastforward_held && (fastforward_cd >= 1) && fastforward_cd_regen)
{
	obj_manager.cam_speed = 8;
	move_sp = 12;
	fastforward_cd -= 2;
}
else
{
	if(!rewind_held){obj_manager.cam_speed = 1;}
	move_sp = 4;
	if(fastforward_cd < 600){fastforward_cd += 1;}
}
if(fastforward_up)
{
	fastforward_cd_regen = false;
}
if(!fastforward_held && (fastforward_cd <= 600))
{
	if(!rewind_held){obj_manager.cam_speed = 1;}
	move_sp = 4;
	fastforward_cd += 1;
}
if(fastforward_cd >= 600)
{
	fastforward_cd_regen = true;
}
