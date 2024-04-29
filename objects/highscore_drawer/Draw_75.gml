/// @description Insert description here
// You can write your code in this editor

draw_set_color(c_blue);
draw_rectangle(406, 50, 960, 86, false);
draw_rectangle(406, 86, 960, 672, false);
draw_set_color(c_white);
draw_rectangle(406, 50, 960, 86, true);
draw_rectangle(406, 86, 960, 672, true);



// 3): Start after testing Step 1) & 2) *************************
//If take_name is true
//   if  vk_anykey is pressed
//       if  keyboard_lastkey was Enter key
//      	highscore_add the name and score
//			name = "" // initialize the name as empty
//			take_name = false  // initialize the take_name as false
//        if  keyboard_lastkey was Escape key
//			highscore_clear
//			name = ""
//			take_name = true;
//        if  keyboard_lastkey is Backspace key
//	if   the string_length of name is more than 0
//	      name = string_copy(name, 0, string_length(name)-1 )
//	if  the string_length of name is less than 4 && keyboard_lastkey >ord("A") && keyboard_lastkey <ord("Z")
// 	      name += chr(keyboard_lastkey)
//   set font as font16;
//   draw text at (255, 65) as "NAME: " + string(name)
//else
//    set font as font16
//    draw text at (255, 65) as "HIGHSCORE";
//    if key_board_check vk_enter, then restart the game.
// *******************************************************************
if(take_name)
{
	if(keyboard_check_pressed(vk_anykey))
	{
		if(keyboard_lastkey == vk_enter)
		{
			highscore_add(name, info_keeper.player_score);
			name = "";
			take_name = false;
		}
		if(keyboard_lastkey == vk_escape)
		{
			highscore_clear();
			name = "";
			take_name = true;
		}
		if(keyboard_lastkey == vk_backspace)
		{
			if(string_length(name) > 0)
			{
				name = string_copy(name, 0, string_length(name)-1);
			}
		}
		if((string_length(name) < 4) && (keyboard_lastkey >= ord("A")) && (keyboard_lastkey <= ord("Z")))
		{
			name += chr(keyboard_lastkey);
		}
	}
	draw_set_font(font16);
	draw_text(421, 51, "NAME: " + string(name));
}
else
{
	draw_set_font(font16);
	draw_text(421, 51, "HIGHSCORE");
	/*
	if(keyboard_check_pressed(vk_enter))
	{
		game_restart();
	}
	*/
}

// 2) : Draw Highscore
//set font as font12
draw_set_font(font12);

//draw highscore (250, 110) to  (390, 370)
draw_highscore(416, 96, 950, 672);