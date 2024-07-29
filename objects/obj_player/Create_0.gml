/// @description Insert description here
// You can write your code in this editor

dash=false;
movement=false;
dash_time=21;
dash_timer=0;
dash_available=true;
face_direction=0;
x_prev=0;
y_prev=0;
blinking_time=irandom_range(120,6*60);


behaviour = use_truestate();

behaviour.addState(State.idle, st_player_idle, "Idle");
behaviour.addState(State.run, st_player_run, "Run");
behaviour.addState(State.dash, st_player_dash, "Dash");
behaviour.addState(State.attack, st_player_attack, "Attack");