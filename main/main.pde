Snake snake = new Snake();
Food food = new Food();
void setup(){
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
	  System.out.println("Snake ate food, length: " + snake.snakeBodyArr.size());
	  food.plantFood(snake);
	  snake.ateFood = false;
	}
	food.drawFood();
	delay(20);
}

