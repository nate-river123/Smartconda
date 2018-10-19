Snake snake = new Snake();
Food food = new Food();
void setup(){
	fullScreen();
	snake.setupStartingSnake();
}
void draw(){
	background(0);
	snake.drawSnake();
	snake = controlSnake(snake);
	snake = calculatePositions(snake);
	if(!snake.alive){
		snake.killSnake();
		setup();
	}
	delay(20);
}

