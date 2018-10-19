public Snake calculatePositions(Snake snake){
  SnakeBody head = new SnakeBody(snake.snakeBodyArr.get(0).getx(),snake.snakeBodyArr.get(0).gety(),snake.snakeBodyArr.get(0).getdx(),snake.snakeBodyArr.get(0).getdy(),snake.snakeBodyArr.get(0).getsegmentSize());
  int length = snake.length;
  for(int i = length-1; i>0; i--){
     snake.snakeBodyArr.get(i).setx(snake.snakeBodyArr.get(i-1).getx());
     snake.snakeBodyArr.get(i).sety(snake.snakeBodyArr.get(i-1).gety());
     snake.snakeBodyArr.get(i).setdx(snake.snakeBodyArr.get(i-1).getdx());
     snake.snakeBodyArr.get(i).setdy(snake.snakeBodyArr.get(i-1).getdy());
  }
  head.setx(head.getx() + snake.snakeBodyArr.get(0).getsegmentSize() * head.getdx());
  head.sety(head.gety() + snake.snakeBodyArr.get(0).getsegmentSize() * head.getdy());
  if(head.getx() > displayWidth || head.getx() < 0 || head.gety() > displayHeight || head.gety() < 0)
    snake.alive = false;
  snake.snakeBodyArr.remove(0);
  snake.snakeBodyArr.add(0,head);
  return snake;
}