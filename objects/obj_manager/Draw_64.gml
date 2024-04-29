/// @description Insert description here
// You can write your code in this editor
if((room == Level1) || (room == Level2) || (room == Level3)){
draw_set_color(c_white);
draw_text(375, 10, "Health:");
draw_healthbar(455, 10, 911, 25, obj_player.hp, $FF4C4C4C, $FF0000FF, $FF00FF00, $FF0000FF, true, true);


//draw lives
draw_set_color(c_white);
draw_text(80, 10, "Lives:");
var life_sprite_width = sprite_get_width(spr_life);
var life_draw_y = 10;
var life_draw_x = 150;
for(var life_count = obj_player.life_count; life_count > 0; --life_count) {
	draw_sprite(spr_life, 0, 0 + life_draw_x, life_draw_y);
	life_draw_x += life_sprite_width + 5;
}


draw_set_color(c_white);
draw_text(1070, 10, "Score: " + string(obj_player.game_score));

draw_healthbar(160, 96, 360, 196, obj_player.rewind_cd/6, $FF4C4C4C, $FF0000FF, $FF00FF00, $FF0000FF, true, true);
draw_healthbar(1006, 96, 1206, 196, obj_player.fastforward_cd/6, $FF4C4C4C, $FF0000FF, $FF00FF00, $FF0000FF, true, true);

draw_set_color(c_black);
draw_triangle(250, 116, 250, 176, 220, 146, true);
draw_triangle(300, 116, 300, 176, 270, 146, true);

draw_triangle(1066, 116, 1066, 176, 1096, 146, true);
draw_triangle(1116, 116, 1116, 176, 1146, 146, true);
}