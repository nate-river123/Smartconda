public void printScore(Snake snake){
	fill(255);
	stroke(255);
	strokeWeight(4);
	line(displayWidth - 90, 0, displayWidth - 90, displayHeight);
	PFont monospaced = createFont("Monospaced", 22);
	textFont(monospaced);
	textAlign(RIGHT);
	text("Score", displayWidth - 10 , 50);
	text("" + (snake.snakeBodyArr.size() - 5), displayWidth - 33, 78);
	noStroke();
}