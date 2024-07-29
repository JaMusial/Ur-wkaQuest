// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function st_template(_event, _layer) {
  	switch(_event) {
  		case TrueStateEvent.onEnter:

  		break;
	
  		case TrueStateEvent.onStep:
  
  		break;
	
  		case TrueStateEvent.onDraw:
			draw_self();
  		break;
		
		case TrueStateEvent.onExit:
		
		break;
  	}
}

function st_player_idle(_event, _layer) {
  	switch(_event) {
  		case TrueStateEvent.onEnter:
			sprite_index = spr_hero_idle;
			speed=0;
  		break;
	
  		case TrueStateEvent.onStep:
		
			if(movement) _layer.stateSwitch(State.run);
			if dash[PRESSED] and dash_available _layer.stateSwitch(State.dash);
			if attack[PRESSED] _layer.stateSwitch(State.attack);

			if _layer.timer%blinking_time==0 and (_layer.timer!=0) {
				sprite_index = spr_hero_idle2;
				image_index=0;
				
			}
			if (sprite_index == spr_hero_idle2 and image_index > image_number - 1){
				blinking_time=irandom_range(3*60,6*60);
				while blinking_time%2==1
					blinking_time=irandom_range(3*60,6*60);
				_layer.stateReset();
			}
			
				

  		break;
	
  		case TrueStateEvent.onDraw:
			draw_self();
  		break;
		
		case TrueStateEvent.onExit:
		
		break;
  	}
}

function st_player_run(_event, _layer) {
  	switch(_event) {
  		case TrueStateEvent.onEnter:
			sprite_index = spr_hero_run;
			image_index = 0;
  		break;
	
  		case TrueStateEvent.onStep:
			player_move();
			
			if speed == 0 sprite_index = spr_hero_idle; else sprite_index = spr_hero_run;
			
			if speed == 0 and !movement _layer.stateSwitch(State.idle);
			if dash[PRESSED] and dash_available _layer.stateSwitch(State.dash);
			if attack[PRESSED] _layer.stateSwitch(State.attack);
  		break;
	
  		case TrueStateEvent.onDraw:
			draw_self();
  		break;
		
		case TrueStateEvent.onExit:
		
		break;
  	}
}

function st_player_dash(_event, _layer) {
  	switch(_event) {
  		case TrueStateEvent.onEnter: 
		
			sprite_index = spr_hero_dash;
			image_index = 0;
			dash_timer=dash_time;
			speed=4;
			if direction==0 or direction == 180
				direction=face_direction;
			
			dash_available=false;
			alarm[0]=20;
  		break;
	
  		case TrueStateEvent.onStep:
			dash_timer --;
			if dash_timer <= 0 {
				dash_timer=0;
				
				
				if movement _layer.stateSwitch(State.idle);
				else _layer.stateSwitch(State.run);
			}
			
			if tile_meeting(x+hspeed,y+vspeed,"Collisions"){
			speed=0;
	}
			
  		break;
	
  		case TrueStateEvent.onDraw:
			draw_self();
  		break;
		
		case TrueStateEvent.onExit:
		
		break;
  	}
}

function st_player_attack(_event, _layer) {
  	switch(_event) {
  		case TrueStateEvent.onEnter:
			sprite_index = spr_hero_attack;
			image_index = 0;
  		break;
	
  		case TrueStateEvent.onStep:
			player_move()
			
			if (image_index >= 2 and image_index <= 5){
				mask_index = spr_hero_attack_mask;
			}
			
			if (place_meeting(x,y,obj_enemy)){
				obj_enemy.image_index=1;
				obj_enemy.alarm[0]=45;
			}
			 mask_index = spr_hero_attack;
			if image_index > image_number - 1
				if movement _layer.stateSwitch(State.idle);
				else _layer.stateSwitch(State.run);
				
  		break;
	
  		case TrueStateEvent.onDraw:
			draw_self();
  		break;
		
		case TrueStateEvent.onExit:
		
		break;
  	}
}