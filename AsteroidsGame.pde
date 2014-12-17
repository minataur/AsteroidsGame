SpaceShip suzy;  
int count = 100;
int amt = 5;
Star[] alice =  new Star[count];
ArrayList <Assteroid> dill = new ArrayList <Assteroid>();
ArrayList <Bullet> ollie = new ArrayList <Bullet>();



public void setup() {
  size(500,500);
  suzy = new SpaceShip();
  for(int i = 0; i<count; i++) {
    alice[i] = new Star();
  }
  for (int x = 0; x<amt; x++) {
    dill.add(new Assteroid());
  }
  ollie = new Bullet(suzy);

}
public void draw() {
  background(0);
  suzy.show();
  suzy.move();
  
  for(int i = 0; i<count; i++) {
    alice[i].show();
  }

  for(int x = 0; x<dill.size(); x++) {
    dill.get(x).show();
    dill.get(x).move();
  }
  
  for (int b = 0; b<ollie.size(); b++) {
    ollie.get(b).show();
    ollie.get(b).move();
  }

  for (int x = 0; x < dill.size(); x++) {
    if (dist(dill.get(x).getX(), dill.get(x).getY(), suzy.getX(), suzy.getY()) <= 30) {
      dill.remove(x);
    }
  
    for (int b = 0; x < ollie.size(); b++) {
      if (dist(dill.get(x).getX(), dill.get(x).getY(), ollie.get(b).getX(), ollie.get(b).getY()) <= 30) {
        dill.remove(x);
        ollie.remove(b);
        break;
      }
    }
  }

  ollie.show();

}

public void keyPressed() {
  if (keyCode==UP) {suzy.accelerate(0.1);}
  else if (keyCode==DOWN) {suzy.accelerate(-0.1);}
  else if (keyCode==RIGHT) {suzy.rotate(20);}
  else if (keyCode==LEFT) {suzy.rotate(-20);}
  else if (keyCode == 32) {
    ollie.add(new Bullet(suzy));
  }
}

class Star {
  int myX, myY, starColor;

  public Star() {
    myX = (int)(Math.random()*500);
    myY = (int)(Math.random()*500);
    starColor = color(179,254,239);
  }

  public void show() {
    noStroke();
    fill(starColor);
    float angle = TWO_PI / 5;
    float halfAngle = angle/2.0;
    beginShape();
    for (float a = 0; a < TWO_PI; a += angle) {
      float sx = myX + cos(a) * 2;
      float sy = myY + sin(a) * 2;
      vertex(sx, sy);
      sx = myX + cos(a+halfAngle) * 5;
      sy = myY + sin(a+halfAngle) * 5;
      vertex(sx, sy);
    }
    endShape(CLOSE);
  }
}

class SpaceShip extends Floater  {

  public SpaceShip() {
    corners = 3;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = -8;
    xCorners[1] = -8;
    xCorners[2] = 16;
    yCorners[0] = -8;
    yCorners[1] = 8;
    yCorners[2] = 0;

    myColor = color(255);
    myCenterX = 250;
    myCenterY = 250;
    myPointDirection = 180;

  }
  
  public void setX(int x) {myCenterX = x;}
  public int getX() {return (int)myCenterX;}   
  public void setY(int y) {myCenterY = y;}   
  public int getY() {return (int)myCenterY;}   
  public void setDirectionX(double x) {myDirectionX = x;}    
  public double getDirectionX() {return myDirectionX;}   
  public void setDirectionY(double y) {myDirectionY = y;}   
  public double getDirectionY() {return myDirectionY;}   
  public void setPointDirection(int degrees) {myPointDirection = degrees;}   
  public double getPointDirection() {return myPointDirection;}

}

class Assteroid extends Floater {
  private int spinSpeed;

  public Assteroid() {
    spinSpeed = (int)(Math.random()*2)+1;
    corners = 10;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = 5;
    yCorners[0] = -15;
    xCorners[1] = -15;
    yCorners[1] = -20;
    xCorners[2] = -30;
    yCorners[2] = -10;
    xCorners[3] = -30;
    yCorners[3] = 10;
    xCorners[4] = -15;
    yCorners[4] = 20;
    xCorners[5] = 5;
    yCorners[5] = 10;
    xCorners[6] = 20;
    yCorners[6] = 20;
    xCorners[7] = 30;
    yCorners[7] = 10;
    xCorners[8] = 30;
    yCorners[8] = -10;
    xCorners[9] = 15;
    yCorners[9] = -20;

    

    myColor = color(204,177,143);
    myCenterX = (int)(Math.random()*500);
    myCenterY = (int)(Math.random()*500);
    myDirectionX = (int)(Math.random()*3)-1;
    myDirectionY = (int)(Math.random()*3)-1;
  }

  public void move() {
    rotate(spinSpeed);
    super.move();
  }

  public void setX(int x) {myCenterX = x;}
  public int getX() {return (int)myCenterX;}   
  public void setY(int y) {myCenterY = y;}   
  public int getY() {return (int)myCenterY;}   
  public void setDirectionX(double x) {myDirectionX = x;}    
  public double getDirectionX() {return myDirectionX;}   
  public void setDirectionY(double y) {myDirectionY = y;}   
  public double getDirectionY() {return myDirectionY;}   
  public void setPointDirection(int degrees) {myPointDirection = degrees;}   
  public double getPointDirection() {return myPointDirection;}
}

class Bullet estends Floater {
  public Bullet(Spaceship theShip) {
    myCenterX = theShip.getX();
    myCenterY = theShip.getY();
    myPointDirection = theShip.getPointDirection();
    double dRadians = myPointDirection*(Math.PI/180);
    myDirectionX = 5*Math.cos(dRadians) + theShip.getDirectionX();
    myDirectionY = 5*Math.sin(dRadians) + theShip.getDirectionY();
  }

  public void setX(int x) {myCenterX = x;}
  public int getX() {return (int)myCenterX;}   
  public void setY(int y) {myCenterY = y;}   
  public int getY() {return (int)myCenterY;}   
  public void setDirectionX(double x) {myDirectionX = x;}    
  public double getDirectionX() {return myDirectionX;}   
  public void setDirectionY(double y) {myDirectionY = y;}   
  public double getDirectionY() {return myDirectionY;}   
  public void setPointDirection(int degrees) {myPointDirection = degrees;}   
  public double getPointDirection() {return myPointDirection;}

  public void show() {
    fill(132,255,0);
    ellipse((float)myCenterX,(float)myCenterY,5,5);
  }

  public void move() {
    myCenterX += myDirectionX;
    myCenterY += myDirectionY;
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
  public void accelerate (double dAmount)   {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   
  public void rotate (int nDegreesOfRotation)   {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX >width) {
      myCenterX = 0;
    }    
    else if (myCenterX<0) {
      myCenterX = width;
    }    
    if(myCenterY >height) {
      myCenterY = 0;
    }   
    else if (myCenterY < 0) {
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

