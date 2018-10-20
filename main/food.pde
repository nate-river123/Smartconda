public class Food{
  float x, y;
  public Food(){}
  public Food(float x, float y){
    this.x = x;
    this.y = y;
  }
  public float getx(){return this.x;}
  public float gety(){return this.y;}
  public void setx(float x){this.x = x;}
  public void sety(float y){this.y = y;}
  public void plantFood(Snake snake){
    while(true){
      this.x = 10 * (int)(random(0, displayWidth/10));
      this.y = 10 * (int)(random(0, displayHeight/10));
      if(checkFood(snake))break;
    }
  }
  public boolean checkFood(Snake snake){
    for(int i = 0; i<snake.snakeBodyArr.size(); i++){
      if(this.x == snake.snakeBodyArr.get(i).getx() && this.y == snake.snakeBodyArr.get(i).gety())
        return false;
    }
    return true;
  }
  public void drawFood(){
    fill(255,0,0);
    rect(this.x, this.y, snake.snakeBodyArr.get(0).getsegmentSize(), snake.snakeBodyArr.get(0).getsegmentSize());
  }
}