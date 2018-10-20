Snake snake;
Food food;
void setup(){
	snake = new Snake();
	food = new Food();
	fullScreen();
	snake.setupStartingSnake();
	food.plantFood(snake);
}
void draw(){
	background(0);
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
}

