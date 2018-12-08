public void printScore(){
	fill(255);
	stroke(255);
	strokeWeight(4);
	line(displayWidth - 90, 0, displayWidth - 90, displayHeight);
	PFont font = createFont("ComicSansMS-Bold", 23);
	textFont(font);
	textAlign(RIGHT);
	text("Score", displayWidth - 75 , 50);
	text("" + (snake.snakeBodyArr.size() - DEFAULT_SNAKE_LENGTH), displayWidth - 50, 78);
	noStroke();
}

public void loadHighScore(){
	String[] lines = loadStrings(HIGHSCORE_SAVE_FILE);
	highScore = Integer.parseInt(lines[0]);
}

public void storeHighScore(){
	String score = highScore.toString();
	String[] lines = new String[1];
	lines[0] = score;
	saveStrings(HIGHSCORE_SAVE_FILE, lines);
}