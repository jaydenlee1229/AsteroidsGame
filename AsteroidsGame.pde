Star [] space = new Star [100];
SpaceShip nova = new SpaceShip();
ArrayList <Asteroid> rocks = new ArrayList <Asteroid>();
ArrayList <Bullet> fire = new ArrayList <Bullet>();
public void setup() 
{
  size(1000, 1000);
  for(int i = 0; i < space.length; i++)
  {
    space[i] = new Star();
    space[i].show();
  }
  for(int k = 0; k < 10; k++)
  {
    rocks.add(k, new Asteroid());
  }
}
public void draw() 
{
  noStroke();
  fill(0, 0, 0, 50);
  rect(0, 0, 1000, 1000);
  for(int i = 0; i < space.length; i++)
  {
    space[i].show();
  }
  for(int k = 0; k < rocks.size(); k++)
  {
    rocks.get(k).show();
    rocks.get(k).move();
  }
  for(int l = 0; l < fire.size(); l++)
  {
    fire.get(l).show();
    fire.get(l).move();
  }
  for(int k = 0; k < rocks.size(); k++)
  {
    for(int l = 0; l < fire.size(); l++)
    {
      if(dist((float)fire.get(l).getX(), (float)fire.get(l).getY(), (float)rocks.get(k).getX(), (float)rocks.get(k).getY()) < 20)
      {
        fire.remove(l);
        rocks.remove(k);
        break;
      }
    }
  }
  nova.show();
  nova.move();
}
public void keyPressed()
{
  if(keyCode == 40)
  {
    nova.accelerate(-.3);
  }
  if(keyCode == 38)
  {
    nova.accelerate(.3);
  }
  if(keyCode == 37)
  {
    nova.rotate(-15);
  }
  if(keyCode == 39)
  {
    nova.rotate(15);
  }
  if(keyCode == 17)
  {
    nova.setX((int)(Math.random()*1000));
    nova.setY((int)(Math.random()*1000));
    nova.setDirectionX(0);
    nova.setDirectionY(0);
    nova.setPointDirection((int)(Math.random()*360));
  }
  if(keyCode == 32)
  {
    fire.add(new Bullet());
  }
}
class Star
{
  protected int myX, myY;
  public void setX(int x){myX = x;}
  public int getX(){return myX;}
  public void setY(int y){myY = y;}
  public int getY(){return myY;}
  public Star()
  {
    myX = (int)(Math.random()*1000);
    myY = (int)(Math.random()*1000);
  }
  public void show()
  {
    fill(255);
    ellipse(getX(), getY(), 3, 3);
  }
}
class SpaceShip extends Floater  
{   
  public void setX(int x){myCenterX = x;}
  public int getX(){return (int)myCenterX;}
  public void setY(int y){myCenterY = y;}
  public int getY(){return (int)myCenterY;}
  public void setDirectionX(double x){myDirectionX = x;}
  public double getDirectionX(){return myDirectionX;}   
  public void setDirectionY(double y){myDirectionY = y;}
  public double getDirectionY(){return myDirectionY;}   
  public void setPointDirection(int degrees){myPointDirection = degrees;}   
  public double getPointDirection(){return myPointDirection;} 
  public SpaceShip()
  {
    corners = 14;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = 20;
    yCorners[0] = 16;
    xCorners[1] = 32;
    yCorners[1] = 0;
    xCorners[2] = 20;
    yCorners[2] = -16;
    xCorners[3] = -12;
    yCorners[3] = -16;
    xCorners[4] = -12;
    yCorners[4] = -32;
    xCorners[5] = 10;
    yCorners[5] = -38;
    xCorners[6] = -18;
    yCorners[6] = -38;
    xCorners[7] = -18;
    yCorners[7] = -32;
    xCorners[8] = -32;
    yCorners[8] = 0;
    xCorners[9] = -18;
    yCorners[9] = 32;
    xCorners[10] = -18;
    yCorners[10] = 38;
    xCorners[11] = 10;
    yCorners[11] = 38;
    xCorners[12] = -12;
    yCorners[12] = 32;
    xCorners[13] = -12;
    yCorners[13] = 16;
    myColor = (255);
    myCenterX = 500;
    myCenterY = 500;
    myDirectionX = 0;
    myDirectionY = 0;
    myPointDirection = 0;
  }
  public void show()
  {
    noFill();
    stroke(myColor);         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  }
}
class Asteroid extends Floater
{
  private int rotateSpeed;
  public void setX(int x){myCenterX = x;}
  public int getX(){return (int)myCenterX;}
  public void setY(int y){myCenterY = y;}
  public int getY(){return (int)myCenterY;}
  public void setDirectionX(double x){myDirectionX = x;}
  public double getDirectionX(){return myDirectionX;}   
  public void setDirectionY(double y){myDirectionY = y;}
  public double getDirectionY(){return myDirectionY;}   
  public void setPointDirection(int degrees){myPointDirection = degrees;}   
  public double getPointDirection(){return myPointDirection;} 
  public Asteroid()
  {
    rotateSpeed = (int)(Math.random() * 8 - 4);
    corners = 9;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = -22;
    yCorners[0] = 0;
    xCorners[1] = -22;
    yCorners[1] = -18;
    xCorners[2] = -8;
    yCorners[2] = -24;
    xCorners[3] = 20;
    yCorners[3] = 0;
    xCorners[4] = 18;
    yCorners[4] = 18;
    xCorners[5] = 14;
    yCorners[5] = 24;
    xCorners[6] = 4;
    yCorners[6] = 24;
    xCorners[7] = 2;
    yCorners[7] = 22;
    xCorners[8] = -8;
    yCorners[8] = 20;
    myColor = (255);
    myCenterX = (int)(Math.random()*1000);
    myCenterY = (int)(Math.random()*1000);
    myDirectionX = Math.random()*2-1;
    myDirectionY = Math.random()*2-1;
    myPointDirection = (int)(Math.random()*Math.PI/180);
  }
  public void show()
  {
    noFill();
    stroke(myColor);         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  }
  public void move()
  {
    rotate(rotateSpeed);
    super.move();
  }
}

abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x);  
  abstract public int getX();   
  abstract public void setY(int y);   
  abstract public int getY();   
  abstract public void setDirectionX(double x);   
  abstract public double getDirectionX();   
  abstract public void setDirectionY(double y);   
  abstract public double getDirectionY();   
  abstract public void setPointDirection(int degrees);   
  abstract public double getPointDirection(); 

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   
  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX > width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX < 0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY > height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  }   
} 