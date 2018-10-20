public class SnakeBody{
  private Integer segmentSize;
  private Float x;
  private Float y;
  private Integer dx;
  private Integer dy;
  public SnakeBody(){
  }
  public SnakeBody(float x, float y, int dx, int dy, int segmentSize){
    this.x = x;
    this.y = y;
    this.dx = dx;
    this.dy = dy;
    this.segmentSize = segmentSize;
  }
  public float getx(){return this.x;}
  public float gety(){return this.y;}
  public int getdx(){return this.dx;}
  public int getdy(){return this.dy;}
  public int getsegmentSize(){return this.segmentSize;}
  public void setx(float x){this.x = x;}
  public void sety(float y){this.y = y;}
  public void setdx(int dx){this.dx = dx;}
  public void setdy(int dy){this.dy = dy;}
  public void setsegmentSize(int segmentSize){this.segmentSize = segmentSize;}
}

public class Snake{
  public ArrayList<SnakeBody> snakeBodyArr;
  public Boolean alive;
  public Boolean ateFood;
  public Snake(){
    this.alive = true;
    this.ateFood = false;
  }
  public Snake(ArrayList<SnakeBody> snakeBodyArr, int length){
    this.snakeBodyArr = snakeBodyArr;
    this.alive = true;
    this.ateFood = false;
  }
  public void setupStartingSnake(){
    this.snakeBodyArr = new ArrayList<SnakeBody>();
    this.alive = true;
    float firstx = DEFAULT_X_COORDINATE_OF_SNAKE;
    float firsty = DEFAULT_Y_COORDINATE_OF_SNAKE;
    int firstdx = DEFAULT_DX_OF_SNAKE;
    int firstdy = DEFAULT_DY_OF_SNAKE;
    int segmentSize = DEFAULT_SNAKE_SEGMENT_SIZE;
    for(int i = 0; i < DEFAULT_SNAKE_LENGTH; i++){
      SnakeBody body = new SnakeBody(firstx - i*segmentSize, firsty, firstdx, firstdy, segmentSize);
      this.snakeBodyArr.add(body);
    }
  }
  public void drawSnake(int fillColor){
  SnakeBody head = this.snakeBodyArr.get(0);
  fill(fillColor, this.snakeBodyArr.size()*30);
  rect(head.getx(), head.gety(), head.getsegmentSize(), head.getsegmentSize(), 10, 10, 10, 10);
  for(int i = 1; i < this.snakeBodyArr.size(); i++){
    SnakeBody snakeBody = this.snakeBodyArr.get(i);
    fill(fillColor, (this.snakeBodyArr.size()-i)*30);
    rect(snakeBody.getx(), snakeBody.gety(), snakeBody.getsegmentSize(), snakeBody.getsegmentSize());
  }
}
  public void killSnake(){
    int noOfBlinks = DEFAULT_BLINK_RATE;
    //blinking effect
  }
}
