Snake snake;
Food food;
Boolean run, highScoreBroken;
Integer highScore;
void setup(){
	snake = new Snake();
	food = new Food();
	run = true;
	highScoreBroken = false;
	fullScreen();
	snake.setupStartingSnake();
	food.plantFood(snake);
	loadHighScore();
}
void draw(){
	if(run){
		background(0);
		printScore();
		snake.drawSnake(255);
		snake = controlSnake();
		snake = calculatePositions();
		if(!snake.alive){
		  if(snake.snakeBodyArr.size() - DEFAULT_SNAKE_LENGTH > highScore){
		  	highScoreBroken = true;
		  	highScore = snake.snakeBodyArr.size() - 5;
		  	storeHighScore();
		  }
		  run = false;
		  delay(500);
		}
		if(snake.ateFood){
		  food.plantFood(snake);
		  snake.ateFood = false;
		}
		food.drawFood();
		delay(20);
	}
	else{
		background(0);
		fill(255);
		textAlign(CENTER);
		PFont monospaced = createFont("Monospaced", 30);
		textFont(monospaced);
	    text("Snake Died", displayWidth/2, displayHeight/2 - 100);
	    text("\nYour Score: " + (snake.snakeBodyArr.size() - DEFAULT_SNAKE_LENGTH), displayWidth/2, displayHeight/2 - 100);
		if(highScoreBroken){
			text("\nCongratulations! You Broke The High Score", displayWidth/2, displayHeight/2);
		}
		text("Press 'P' To Play Again\nPress 'E' or 'Esc' To Exit", displayWidth/2, displayHeight/2 + 100);
	}
}

void keyPressed(){
	if(!run){
		final int k = keyCode;
		if(k == 'e' || k == 'E'){
			exit();	
		}
		else if(k == 'p' || k == 'P'){
			setup();
		}
	}
}
