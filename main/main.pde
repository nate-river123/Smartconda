void setup(){
	size(1500,1000);
	setup_starting_snake();
}

void draw(){
	background(0);
	draw_snake();
	controlSnake();
	calculate_positions();
	draw_food();
	delay(20);
}

