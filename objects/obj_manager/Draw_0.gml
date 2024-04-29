/// @DnDAction : YoYo Games.Drawing.Draw_Healthbar
/// @DnDVersion : 1
/// @DnDHash : 65B64A43
/// @DnDArgument : "backcol" "$00FFFFFF"
/// @DnDArgument : "barcol" "$FF4C4C4C"
/// @DnDArgument : "mincol" "$FF0000FF"
/// @DnDArgument : "maxcol" "$FF00FF00"
draw_healthbar(0, 0, 0, 0, 100, $00FFFFFF & $FFFFFF, $FF0000FF & $FFFFFF, $FF00FF00 & $FFFFFF, 0, (($00FFFFFF>>24) != 0), (($FF4C4C4C>>24) != 0));