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
  ArrayList<SnakeBody> snakeBodyArr;
  Integer length;
  Boolean alive;
  public Snake(){
  }
  public Snake(ArrayList<SnakeBody> snakeBodyArr, int length){
    this.snakeBodyArr = snakeBodyArr;
    this.length = length;
  }
  public void setupStartingSnake(){
    this.snakeBodyArr = new ArrayList<SnakeBody>();
    this.length = DEFAULT_SNAKE_LENGTH;
    this.alive = true;
    float firstx = DEFAULT_X_COORDINATE_OF_SNAKE;
    float firsty = DEFAULT_Y_COORDINATE_OF_SNAKE;
    int firstdx = DEFAULT_DX_OF_SNAKE;
    int firstdy = DEFAULT_DY_OF_SNAKE;
    int segmentSize = DEFAULT_SNAKE_SEGMENT_SIZE;
    for(int i = 0; i < this.length; i++){
      SnakeBody body = new SnakeBody(firstx - i*segmentSize, firsty, firstdx, firstdy, segmentSize);
      this.snakeBodyArr.add(body);
    }
  }
  public void drawSnake(){
    SnakeBody head = this.snakeBodyArr.get(0);
    fill(255, this.length*30);
    rect(head.getx(), head.gety(), head.getsegmentSize(), head.getsegmentSize(), 10, 10, 10, 10);
    for(int i = 1; i < this.length; i++){
      SnakeBody snakeBody = this.snakeBodyArr.get(i);
      fill(255, (this.length-i)*30);
      rect(snakeBody.getx(), snakeBody.gety(), snakeBody.getsegmentSize(), snakeBody.getsegmentSize());
    }
  }
  public void killSnake(){
    ;
  }
} 