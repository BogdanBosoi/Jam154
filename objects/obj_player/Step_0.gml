

var left_pressed = keyboard_check(vk_left);
var right_pressed = keyboard_check(vk_right);
var jump_pressed = keyboard_check_pressed(vk_space)

var horizontal_state = right_pressed - left_pressed;
var move = horizontal_state * hsp

vsp += grv

if (vsp < 0 && is_jumping)
{
	image_index = 1
}
else if (vsp > 0 && is_jumping)
{
	image_index = 2
}

if place_meeting(x, y + 1, obj_block) && jump_pressed
{
	vsp = -7;
	object_set_sprite(0, spr_jump)
	is_jumping = 1
}

if place_meeting(x, y + vsp, obj_block)
{
	while !place_meeting(x, y + 1, obj_block) && vsp > 0
	{
		y++
	}
	vsp = 0
	if object_get_sprite(obj_player) == spr_jump
		image_index = 3
	is_jumping = 0
}

if place_meeting(x + move, y, obj_block)
{
	while !place_meeting(x + horizontal_state, y, obj_block)	x += horizontal_state;
	move = 0
}

x += move
y += vsp
if(vsp == 0 && old_state == 1 && is_jumping == 0)
	object_set_sprite(spr_walk, 0)
image_speed = (horizontal_state != 0) && (!is_jumping)
if horizontal_state != 0	
	{
		image_xscale = horizontal_state;
	}
	else
	{
		image_index = 0;
	}
	
old_state = is_jumping
