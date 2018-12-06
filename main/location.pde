public Snake calculatePositions(){
  SnakeBody head = new SnakeBody(snake.snakeBodyArr.get(0).getx(),
                          snake.snakeBodyArr.get(0).gety(),
                          snake.snakeBodyArr.get(0).getdx(),
                          snake.snakeBodyArr.get(0).getdy(),
                          snake.snakeBodyArr.get(0).getsegmentSize());
  SnakeBody tail = new SnakeBody(snake.snakeBodyArr.get(snake.snakeBodyArr.size()-1).getx(),
                          snake.snakeBodyArr.get(snake.snakeBodyArr.size()-1).gety(),
                          snake.snakeBodyArr.get(snake.snakeBodyArr.size()-1).getdx(),
                          snake.snakeBodyArr.get(snake.snakeBodyArr.size()-1).getdy(),
                          snake.snakeBodyArr.get(snake.snakeBodyArr.size()-1).getsegmentSize());
  for(int i = snake.snakeBodyArr.size()-1; i>0; i--){
     snake.snakeBodyArr.get(i).setx(snake.snakeBodyArr.get(i-1).getx());
     snake.snakeBodyArr.get(i).sety(snake.snakeBodyArr.get(i-1).gety());
     snake.snakeBodyArr.get(i).setdx(snake.snakeBodyArr.get(i-1).getdx());
     snake.snakeBodyArr.get(i).setdy(snake.snakeBodyArr.get(i-1).getdy());
  }
  head.setx(head.getx() + snake.snakeBodyArr.get(0).getsegmentSize() * head.getdx());
  head.sety(head.gety() + snake.snakeBodyArr.get(0).getsegmentSize() * head.getdy());
  if(head.getx() > displayWidth - 100 || head.getx() < 0 || head.gety() > displayHeight || head.gety() < 0){
    snake.alive = false;
    return snake;
  }
  for(int i = 1; i<snake.snakeBodyArr.size(); i++){
    SnakeBody snakeBody = snake.snakeBodyArr.get(i);
    if(head.getx() == snakeBody.getx() && head.gety() == snakeBody.gety()){
      snake.alive = false;
      break;
    }
  }
  if(head.getx() == food.getx() && head.gety() == food.gety()){
    snake.ateFood = true;
    snake.snakeBodyArr.add(tail);
  }
  snake.snakeBodyArr.remove(0);
  snake.snakeBodyArr.add(0,head);
  return snake;
}