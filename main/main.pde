Snake snake;
Food food;
Boolean run, highScoreBroken, ai;
Integer highScore;
Float reward;
PImage human, robot;
void setup(){
	snake = new Snake();
	food = new Food();
	run = true;
	highScoreBroken = false;
	ai = false;
	fullScreen();
	snake.setupStartingSnake();
	food.plantFood(snake);
	loadHighScore();
	human = loadImage("data/human.png");
	robot = loadImage("data/robot.png");;
}

void draw(){
	if(run && ai){
		background(2700359);
		noCursor();
		printScore();
		printAIModeOn();
		image(robot, 50, 50, 192, 192);
		snake.drawSnake(255);
		food.drawFood();
		snake = controlSnake();
		snake = calculatePositions();
		if(!snake.alive){
			reward = -1.0;
			run = false;
		}
		if(snake.ateFood){
		  food.plantFood(snake);
		  snake.ateFood = false;
		}
	}
	if(run && !ai){
		background(0);
		noCursor();
		printScore();
		image(human, 50, 50, 192, 192);
		snake.drawSnake(255);
		food.drawFood();
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
		delay(20);
	}
	if(!run && ai){
		setup();
		ai = true;
	}
	if(!run && !ai){
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
		noLoop();
	}
}

void keyPressed(){
	if(!run){
		final int k = keyCode;
		if(k == 'e' || k == 'E'){
			exit();	
		}
		else if(k == 'p' || k == 'P'){
			loop();
			setup();
		}
	}
	if(run){
	    final int k = keyCode;
	    if(k == 'm' || k == 'M'){
			ai = !ai;
	    }
	}
}
