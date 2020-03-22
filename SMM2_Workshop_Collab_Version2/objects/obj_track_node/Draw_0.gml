draw_self()
draw_text(x, y, order_id)
draw_text(x, y+25, tracking_id)

if (next_id != noone) {
	draw_line_width(x, y, next_id.x, next_id.y, 2);
}

