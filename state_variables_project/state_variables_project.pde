// using state variables
// one mode has static obstacles the other will have obstacles moving vertically and horizintally


// Graham Kelly
// Interactive scene assignment
// September 25th, 2017
// Computer science 30, WMCI
// For the extra for experts portion of the assignment I chose to explore the random function,
// I used the random function for to randomize the shape and colour of many objects in my game

//variable setup
float diam = 20;
float speed = (7);
float xPosition = 100;
color randomColour;
float obstacleYA;
float obstacleYB;
float obstacleYC;
float obstacleYD;
float obstacleYE;
float obstacleYF;
float obstacleYG;
float obstacleYH;
float obstacleYI;
int level = 0;
float obstacleDiam;
float state = 0;



 
void setup() { // sets the size of the screen
  size(1200, 800);
  background(0);
    
}


void draw() { 

  if (state == 0){
    homeScreen();
  }
  
  if (state == 2) {
    retryScreen(); 
  }
    
  if (keyPressed == true) {
    state = 1;
    level = 0;
  }
  
  if (state == 1) { 
    drawBall();
    drawObstacle();
  }
}

void homeScreen() { // the first screen you see
  background(0);
  textSize(32);
  text("Press any key to play a game", 10, 30);
}
  
void retryScreen() { // this screen is shown after contact is made with an obstacle
  background(0);
  textSize(32);
  text("Press any key to play again", 10, 30);  
  text("You made it to level" + " " + (level) + "!", 10, 70);  

}


void drawBall() { //draws the ball used in the game  
  background(randomColour);  
  
  drawCourt();

  float yPosition = constrain(mouseY, 100, (height - 100)); //constrains the y position of the ball 100 pixels away from the top and bottom of the screen
  
  xPosition = (xPosition + speed); // moves ball from left to right at by a distance of the variable "speed"
  contactDetect();
    if (xPosition >= (width - 100))  {
      xPosition = 100; // moves ball to left side of screen whne it reaches the right side
      if (speed < 20) { 
        speed = (speed + .5); // adds 0.5 to ball speed every after every level
      }
      
      randomColour = color(random(255), random(255), random(255)); // chooses a random colour at the start of every level
      
      obstacleYA = random(75, (height - 100)); // chooses y position of obstacles at the start of every level
      obstacleYB = random(75, (height - 100));
      obstacleYC = random(75, (height - 100));
      obstacleYD = random(75, (height - 100));
      obstacleYE = random(75, (height - 100));
      obstacleYF = random(75, (height - 100));
      obstacleYG = random(75, (height - 100));
      obstacleYH = random(75, (height - 100));

      obstacleDiam = random(40, 100); // chooses diameter of obstacles at the start of every level
      level = level + 1;
    }
  
  fill(randomColour);
  ellipse(xPosition,yPosition,diam,diam); // draws the ball
  }
  

void drawCourt() { // draws the screen used for the game
  fill(255);
  rect(100, 100, (width - 200), (height - 200));
  textSize(32);
  text(level, 10, 30);  
}
  
void drawObstacle() { //draws the obstacles
  fill(randomColour);
  noStroke();
  rect((width/2), obstacleYA, obstacleDiam, obstacleDiam);
  rect((width/3), obstacleYB, obstacleDiam, obstacleDiam);
  rect((width/4), obstacleYC, obstacleDiam, obstacleDiam);
  rect((width/2*1.5), obstacleYD, obstacleDiam, obstacleDiam);
  rect((width/6*5), obstacleYE, obstacleDiam, obstacleDiam);
  rect((width/3*2), obstacleYF, obstacleDiam, obstacleDiam);
  rect((width/5*2), obstacleYG, obstacleDiam, obstacleDiam);
  rect((width/6*3), obstacleYH, obstacleDiam, obstacleDiam);
  

}


void contactDetect() { // detects any contact between the ball and obstacles and ends the game if contact occurs
  float yPosition = constrain(mouseY, 100, (height - 100));
  if ((yPosition >= obstacleYA) && (yPosition <= (obstacleYA + obstacleDiam))
    && (xPosition >= (width/2) && (xPosition <= (width/2) + obstacleDiam)) ||
    
    (yPosition >= obstacleYB) && (yPosition <= (obstacleYB + obstacleDiam))
    && (xPosition >= (width/3) && (xPosition <= (width/3) + obstacleDiam)) ||
    
    (yPosition >= obstacleYC) && (yPosition <= (obstacleYC + obstacleDiam))
    && (xPosition >= (width/4) && (xPosition <= (width/4) + obstacleDiam)) ||
    
    (yPosition >= obstacleYD) && (yPosition <= (obstacleYD + obstacleDiam))
    && (xPosition >= (width/2*1.5) && (xPosition <= (width/2*1.5) + obstacleDiam)) ||
    
    (yPosition >= obstacleYE) && (yPosition <= (obstacleYE + obstacleDiam))
    && (xPosition >= (width/6*5) && (xPosition <= (width/6*5) + obstacleDiam)) ||
    
    (yPosition >= obstacleYF) && (yPosition <= (obstacleYF + obstacleDiam))
    && (xPosition >= (width/3*2) && (xPosition <= (width/3*2) + obstacleDiam)) ||
    
    (yPosition >= obstacleYG) && (yPosition <= (obstacleYG + obstacleDiam))
    && (xPosition >= (width/5*2) && (xPosition <= (width/5*2) + obstacleDiam)) ||
    
    (yPosition >= obstacleYH) && (yPosition <= (obstacleYH + obstacleDiam))
    && (xPosition >= (width/6*3) && (xPosition <= (width/6*3) + obstacleDiam))) {
    
    
    state = 2; //resets the game
    xPosition = 100;
    obstacleDiam = 0;   
    speed = 7;
  } 
}