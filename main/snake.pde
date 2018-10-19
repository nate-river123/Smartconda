public class Snake{
  private float x,y;
  private int dx,dy;
  public Snake(){
  }
  public Snake(float x, float y, int dx, int dy){
    this.x = x;
    this.y = y;
    this.dx = dx;
    this.dy = dy;
  }
  public float getx(){return this.x;}
  public float gety(){return this.y;}
  public int getdx(){return this.dx;}
  public int getdy(){return this.dy;}
  public void setx(float x){this.x = x;}
  public void sety(float y){this.y = y;}
  public void setdx(int dx){this.dx = dx;}
  public void setdy(int dy){this.dy = dy;}
}

ArrayList<Snake> snake;
int len, seg;
void setup_starting_snake(){
  snake = new ArrayList<Snake>();
  len = DEFAULT_SNAKE_LENGTH;
  seg = DEFAULT_SNAKE_SEGMENT_SIZE;
  float firstx = DEFAULT_X_COORDINATE_OF_SNAKE, firsty = DEFAULT_Y_COORDINATE_OF_SNAKE;
  int firstdx = 1, firstdy = 0;
  for(int i = 0; i < len; i++){
    snake.add(new Snake(firstx - i*16, firsty, firstdx, firstdy));
  }
}

void draw_snake(){
  for(int i = 0; i < len; i++){
    Snake s = snake.get(i);
    rect(s.getx(), s.gety(), seg, seg);
  }
}