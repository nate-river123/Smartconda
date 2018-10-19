import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class main extends PApplet {

public void setup(){
	
	setup_starting_snake();
}

public void draw(){
	background(0);
	draw_snake();
	controlSnake();
	calculate_positions();
	draw_food();
	delay(20);
}

public static final Integer DEFAULT_SNAKE_LENGTH = 4;
public static final Float DEFAULT_X_COORDINATE_OF_SNAKE = 100.0f;
public static final Float DEFAULT_Y_COORDINATE_OF_SNAKE = 100.0f;
public static final Integer DEFAULT_SNAKE_SEGMENT_SIZE = 10;
public void controlSnake(){
	if(keyPressed){
	if(key == 'w' || key == 'W')moveUp(snake);
	else if(key == 'a' || key == 'A')moveLeft(snake);
	else if(key == 's' || key == 'S')moveDown(snake);
	else if(key == 'd' || key == 'D')moveRight(snake);
	}
}
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
}

public void draw_food(){
  ;
}
public void calculate_positions(){
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

public void moveUp(ArrayList<Snake> snake)
{
  if(snake.get(0).getdy() == 0){
    snake.get(0).setdx(0);
    snake.get(0).setdy(-1);
  }
}

public void moveDown(ArrayList<Snake> snake)
{
  if(snake.get(0).getdy() == 0){
    snake.get(0).setdx(0);
    snake.get(0).setdy(1);
  }
}

public void moveLeft(ArrayList<Snake> snake)
{
  if(snake.get(0).getdx() == 0){
    snake.get(0).setdx(-1);
    snake.get(0).setdy(0);
  }
}

public void moveRight(ArrayList<Snake> snake)
{
  if(snake.get(0).getdx() == 0){
    snake.get(0).setdx(1);
    snake.get(0).setdy(0);
  }
}
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
public void setup_starting_snake(){
  snake = new ArrayList<Snake>();
  len = DEFAULT_SNAKE_LENGTH;
  seg = DEFAULT_SNAKE_SEGMENT_SIZE;
  float firstx = DEFAULT_X_COORDINATE_OF_SNAKE, firsty = DEFAULT_Y_COORDINATE_OF_SNAKE;
  int firstdx = 1, firstdy = 0;
  for(int i = 0; i < len; i++){
    snake.add(new Snake(firstx - i*16, firsty, firstdx, firstdy));
  }
}

public void draw_snake(){
  for(int i = 0; i < len; i++){
    Snake s = snake.get(i);
    rect(s.getx(), s.gety(), seg, seg);
  }
}
  public void settings() { 	size(1500,1000); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "main" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
