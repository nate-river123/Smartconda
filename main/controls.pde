public Snake controlSnake(){
  if(!ai){
    if(keyPressed){
      if(key == 'w' || key == 'W')moveUp(snake.snakeBodyArr);
      else if(key == 'a' || key == 'A')moveLeft(snake.snakeBodyArr);
      else if(key == 's' || key == 'S')moveDown(snake.snakeBodyArr);
      else if(key == 'd' || key == 'D')moveRight(snake.snakeBodyArr);
    }
  }
  else{
    char decision = getAiDecision();
    if(decision == 'u' || decision == 'U')moveUp(snake.snakeBodyArr);
    else if(decision == 'l' || decision == 'L')moveLeft(snake.snakeBodyArr);
    else if(decision == 'r' || decision == 'R')moveRight(snake.snakeBodyArr);
    else if(decision == 'd' || decision == 'D')moveDown(snake.snakeBodyArr);
  }
  return snake;
}
  public void moveUp(ArrayList<SnakeBody> snakeBodyArr){
    if(snakeBodyArr.get(0).getdy() == 0){
      snakeBodyArr.get(0).setdx(0);
      snakeBodyArr.get(0).setdy(-1);
    }
  }
  public void moveLeft(ArrayList<SnakeBody> snakeBodyArr){
    if(snakeBodyArr.get(0).getdx() == 0){
      snakeBodyArr.get(0).setdx(-1);
      snakeBodyArr.get(0).setdy(0);
    }
  }
  public void moveDown(ArrayList<SnakeBody> snakeBodyArr){
    if(snakeBodyArr.get(0).getdy() == 0){
      snakeBodyArr.get(0).setdx(0);
      snakeBodyArr.get(0).setdy(1);
    }
  }
  public void moveRight(ArrayList<SnakeBody> snakeBodyArr){
    if(snakeBodyArr.get(0).getdx() == 0){
      snakeBodyArr.get(0).setdx(1);
      snakeBodyArr.get(0).setdy(0);
    }
}
