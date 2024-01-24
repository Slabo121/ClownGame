//Key inputs
keyLeft = keyboard_check(vk_left)|| keyboard_check(ord("A"));
keyRight = keyboard_check(vk_right)|| keyboard_check(ord("D"));
keyJump = keyboard_check_pressed(vk_space);

//Handles movement
var move = keyRight - keyLeft;

hsp = move * walkspeed;

vsp = vsp + grav;

//Handles moving platforms

//Handles Jump
if ((place_meeting(x,y+1,obj_wall))  && (keyJump) || (place_meeting(x,y+1,obj_platform) && (keyJump)))
{
	vsp = -25;
		
}

//Handles platforms
var Platform = instance_place(x,y + max(1,vsp),obj_platform);
if (Platform && bbox_bottom - 1 <= Platform.bbox_top)
{
	if (vsp >= 0)
	{
		while (!place_meeting(x,y + sign(vsp), obj_platform))
		{
			y += sign(vsp);
		}
		
		vsp = 0;
	}
	
	x += Platform.moveX;
	y += Platform.moveY;
}


//Handles collisions between walls and the player
if (place_meeting(x+hsp,y,obj_wall))
{
	while (!place_meeting(x+sign(hsp),y,obj_wall))
	{
		x = x + sign(hsp);
	}
	hsp = 0;
}
x = x + hsp;

if (place_meeting(x,y+vsp, obj_wall))
{
	while (!place_meeting(x,y+sign(vsp),obj_wall))
	{
		y = y + sign(vsp);
	}
	vsp = 0;
}
y = y + vsp;




