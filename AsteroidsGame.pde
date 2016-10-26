Star [] space = new Star [100];
SpaceShip nova = new SpaceShip();
public void setup() 
{
  size(500, 500);
  for(int i = 0; i < space.length; i++)
  {
    space[i] = new Star();
    space[i].show();
  }
}
public void draw() 
{
  noStroke();
  fill(0, 0, 0, 50);
  rect(0, 0, 500, 500);
  for(int i = 0; i < space.length; i++)
  {
    space[i].show();
  }
  nova.show();
  nova.move();
}
public void keyPressed()
{
  if(keyCode == 40)
  {
    nova.accelerate(-.2);
  }
  if(keyCode == 38)
  {
    nova.accelerate(.2);
    //rect((float)(nova.getX() + nova.getDirectionX()), (float)(nova.getY() + nova.getDirectionY()), 25, 5);
  }
  if(keyCode == 37)
  {
    nova.rotate(-10);
  }
  if(keyCode == 39)
  {
    nova.rotate(10);
  }
  if(keyCode == 16)
  {
    nova.setX((int)(Math.random()*500));
    nova.setY((int)(Math.random()*500));
    nova.setDirectionX(0);
    nova.setDirectionY(0);
    nova.setPointDirection((int)(Math.random()*360));
  }
}
class Star
{
  int myX, myY;
  public void setX(int x){myX = x;}
  public int getX(){return myX;}
  public void setY(int y){myY = y;}
  public int getY(){return myY;}
  Star()
  {
    myX = (int)(Math.random()*500);
    myY = (int)(Math.random()*500);
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
  SpaceShip()
  {
    corners = 14;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = 8;
    yCorners[0] = 6;
    xCorners[1] = 14;
    yCorners[1] = 0;
    xCorners[2] = 8;
    yCorners[2] = -6;
    xCorners[3] = -4;
    yCorners[3] = -6;
    xCorners[4] = -4;
    yCorners[4] = -14;
    xCorners[5] = 3;
    yCorners[5] = -17;
    xCorners[6] = -7;
    yCorners[6] = -17;
    xCorners[7] = -7;
    yCorners[7] = -14;
    xCorners[8] = -14;
    yCorners[8] = 0;
    xCorners[9] = -7;
    yCorners[9] = 14;
    xCorners[10] = -7;
    yCorners[10] = 17;
    xCorners[11] = 3;
    yCorners[11] = 17;
    xCorners[12] = -4;
    yCorners[12] = 14;
    xCorners[13] = -4;
    yCorners[13] = 6;
    myColor = (255);
    myCenterX = 250;
    myCenterY = 250;
    myDirectionX = 0;
    myDirectionY = 0;
    myPointDirection = 0;
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