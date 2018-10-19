void calculate_positions(){
  Snake head = new Snake(snake.get(0).getx(),snake.get(0).gety(),snake.get(0).getdx(),snake.get(0).getdy());
  for(int i = len-1; i>0; i--){
     snake.get(i).setx(snake.get(i-1).getx());
     snake.get(i).sety(snake.get(i-1).gety());
     snake.get(i).setdx(snake.get(i-1).getdx());
     snake.get(i).setdy(snake.get(i-1).getdy());
  }
  head.setx(head.getx() + seg*head.getdx());
  head.sety(head.gety() + seg*head.getdy());
  snake.remove(0);
  snake.add(0,head);
}

void moveUp(ArrayList<Snake> snake)
{
  if(snake.get(0).getdy() == 0){
    snake.get(0).setdx(0);
    snake.get(0).setdy(-1);
  }
}

void moveDown(ArrayList<Snake> snake)
{
  if(snake.get(0).getdy() == 0){
    snake.get(0).setdx(0);
    snake.get(0).setdy(1);
  }
}

void moveLeft(ArrayList<Snake> snake)
{
  if(snake.get(0).getdx() == 0){
    snake.get(0).setdx(-1);
    snake.get(0).setdy(0);
  }
}

void moveRight(ArrayList<Snake> snake)
{
  if(snake.get(0).getdx() == 0){
    snake.get(0).setdx(1);
    snake.get(0).setdy(0);
  }
}