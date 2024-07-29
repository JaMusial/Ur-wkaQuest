// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function player_move(){
	x_prev=x;
	y_prev=y;
	speed=0;
	
	if up[HELD] vspeed += -2;
	if down[HELD] vspeed += 2;
	if left[HELD]{
		hspeed += -2;
		face_direction=180;
	}
	if right[HELD]{
		hspeed += 2;
		face_direction=0;
	}
	
	direction = point_direction(x, y, x + hspeed, y + vspeed);
	speed = min(speed, 2);
	
	if (hspeed != 0)
	{
		// Flip sprite horizontally based on hspeed.
		image_xscale = 1 * sign(hspeed);
		image_yscale = 1;
	}
	
	if tile_meeting(x+hspeed,y,"Collisions") hspeed=0;
	else if tile_meeting(x,y+vspeed,"Collisions") vspeed=0;
	
	if place_meeting(x+hspeed,y,obj_enemy) hspeed=0;
	else if place_meeting(x,y+vspeed,obj_enemy) vspeed=0;
	
	
	
}

