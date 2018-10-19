void controlSnake(){
	if(keyPressed){
	if(key == 'w' || key == 'W')moveUp(snake);
	else if(key == 'a' || key == 'A')moveLeft(snake);
	else if(key == 's' || key == 'S')moveDown(snake);
	else if(key == 'd' || key == 'D')moveRight(snake);
	}
}