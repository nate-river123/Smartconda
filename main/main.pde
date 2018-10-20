Snake snake;
Food food;
void setup(){
	snake = new Snake();
	food = new Food();
	//size(displayWidth, displayHeight);
	fullScreen();
	snake.setupStartingSnake();
	food.plantFood(snake);
}
void draw(){
	background(0);
	printScore(snake);
	snake.drawSnake(255);
	snake = controlSnake(snake);
	snake = calculatePositions(snake, food);
	if(!snake.alive){
	  snake.killSnake();
	  setup();
	}
	if(snake.ateFood){
	  food.plantFood(snake);
	  snake.ateFood = false;
	}
	food.drawFood();
	delay(20);
}

