/// @description

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// DRAWS CURRENTLY SELECTED OPTIONSMENUGRID ACCORDING TO CURSORLOCATION AND TOGGLEHIGHLIGHT VALUES
scr_drawCurrentMenu();

// DRAWS CURSOR LOCATION AND TOGGLE HIGHLIGHT VALUE FOR DEBUG PURPOSES

/*
draw_set_halign(fa_left);
draw_set_valign(fa_top);

draw_set_color(c_teal);

draw_text(5, 5, "CursorLocation: " + string(cursorLocation)
+ "\nToggleHighlight: " + string(toggleHighlight)
);

draw_set_color(c_white);
*/
