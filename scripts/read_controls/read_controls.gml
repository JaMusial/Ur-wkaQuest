function read_controls() {
    var _key = mb_left;
    attack[PRESSED] = device_mouse_check_button_pressed(0,_key);
    attack[RELEASED] = device_mouse_check_button_released(0,_key);
    if(device_mouse_check_button(0,_key))
        attack[HELD]++;
    else
        attack[HELD] = false;

    _key = ord("C");
    jump[PRESSED] = keyboard_check_pressed(_key);
    jump[RELEASED] = keyboard_check_released(_key);
    if(keyboard_check(_key))
        jump[HELD]++;
    else
        jump[HELD]=0;
    
    _key = vk_space;
    dash[PRESSED] = keyboard_check_pressed(_key);
    dash[RELEASED] = keyboard_check_released(_key);
    if(keyboard_check(_key))
        dash[HELD]++;
    else
        dash[HELD]=0;    
    
    _key = ord("A");
    left[PRESSED] = keyboard_check_pressed(_key);
    left[RELEASED] = keyboard_check_released(_key);
    left[HELD] = keyboard_check(_key);

    _key = ord("D");
    right[PRESSED] = keyboard_check_pressed(_key);
    right[RELEASED] = keyboard_check_released(_key);
    right[HELD] = keyboard_check(_key);
	
	_key = ord("W");
    up[PRESSED] = keyboard_check_pressed(_key);
    up[RELEASED] = keyboard_check_released(_key);
    up[HELD] = keyboard_check(_key);
	
	_key = ord("S");
    down[PRESSED] = keyboard_check_pressed(_key);
    down[RELEASED] = keyboard_check_released(_key);
    down[HELD] = keyboard_check(_key);
	
	movement=false;
	if left[HELD] || right[HELD] || up[HELD] || down[HELD]
		movement=true;
	
    var _h = right[HELD]-left[HELD];
    if(point_distance(0, 0, _h, 0) > 0)
        dpad_dir=round(point_direction(0, 0, _h, 0));
    else
        dpad_dir=NO_DIRECTION;
}

function zero_controls(){
    attack[PRESSED] = false;
    attack[RELEASED] = false;
    attack[HELD] = false;
        
    jump[PRESSED] = false;
    jump[RELEASED] = false;
    jump[HELD] = 0;
    
    dash[PRESSED] = false;
    dash[RELEASED] = false;
    dash[HELD]=0;    
    
    left[PRESSED] = false;
    left[RELEASED] = false;
    left[HELD] = 0;

    right[PRESSED] = false;
    right[RELEASED] = false;
    right[HELD] = 0;
	
    up[PRESSED] = false;
    up[RELEASED] = false;
    up[HELD] = 0;
	
	down[PRESSED] = false;
    down[RELEASED] = false;
    down[HELD] = 0;
    
    dpad_dir = NO_DIRECTION;
	movement = false;
}