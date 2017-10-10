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
float obstacleSpeed = 5;
//float randomObsY = random(75, (height - 100));
int[] obsY = new int[8];
int[] obsX = new int[8];



void setup() { // sets the size of the screen
  size(1200, 800);
  background(0);
  for (int i=0; i<obsY.length; i++) {
    obsY[i] = int(random(100, (height - 100)));
  }
  for (int i=0; i<obsX.length; i++) {
  obsX[i] = int(random(100, (width - 100)));
  }
  
}


void draw() { 

  if (state == 0) { // choose between moving and static obstacles
    homeScreen();
  }

  if (state == 1) { 
    checkForNewLevel();
    drawBall();
    drawObstacle();
  }

  if (state == 2) {
    checkForNewLevel();
    drawBall();
    moveObstacles();
    drawObstacle();
  }

  if (state == 3) {
    retryScreen();
  }
}

void homeScreen() { // the first screen you see
  background(0);
  fill(255, 0, 0);
  rect(0, 0, width/2, height);
  textSize(32);
  fill(255);
  text("Click this side to play with moving obstacles", 10, 30, (width/3), height);
  text("Click this side to play with static obstacles", ((width/2) + 10), 30, (width/3), height);
  //fill(255, 0, 0);
  //rect(0, 0, width/2, height);
  if (mousePressed == true) {

    if (mouseX < (width/2)) {
      state = 1;
    }
    if (mouseX > (width/2)) {
      state = 2;
    }
  }
}

void retryScreen() { // this screen is shown after contact is made with an obstacle
  background(0);
  textSize(32);
  text("Press any key to play again", 10, 30);  
  text("You made it to level" + " " + (level) + "!", 10, 70); 
  if (keyPressed == true) {
    level = 0;
    state = 0;
  }
}
void checkForNewLevel() {
  if (xPosition >= (width - 100)) {
    xPosition = 100; // moves ball to left side of screen whne it reaches the right side
    if (speed < 20) { 
      speed = (speed + .5); // adds 0.5 to ball speed every after every level
    }

    randomColour = color(random(255), random(255), random(255)); // chooses a random colour at the start of every level


    obstacleDiam = random(40, 100); // chooses diameter of obstacles at the start of every level
    level = level + 1;
  }
}



void drawBall() { //draws the ball used in the game  
  background(randomColour);  

  drawCourt();

  float yPosition = constrain(mouseY, 100, (height - 100)); //constrains the y position of the ball 100 pixels away from the top and bottom of the screen

  xPosition = (xPosition + speed); // moves ball from left to right at by a distance of the variable "speed"
  contactDetect();


  fill(randomColour);
  ellipse(xPosition, yPosition, diam, diam); // draws the ball
}


void drawCourt() { // draws the screen used for the game
  fill(255);
  rect(100, 100, (width - 200), (height - 200));
  textSize(32);
  text(level, 10, 30);
}

void drawObstacle() { //draws the obstacles
  //randomObsY = random(75, (height - 100));


  fill(randomColour);


  noStroke();

  rect(obsX[0], obsY[0], obstacleDiam, obstacleDiam);
  rect(obsX[1], obsY[1], obstacleDiam, obstacleDiam);
  rect(obsX[2], obsY[2], obstacleDiam, obstacleDiam);
  rect(obsX[3], obsY[3], obstacleDiam, obstacleDiam);
  rect((width/6*5), obsY[4], obstacleDiam, obstacleDiam);
  rect((width/3*2), obsY[5], obstacleDiam, obstacleDiam);
  rect((width/5*2), obsY[6], obstacleDiam, obstacleDiam);
  rect((width/6*3), obsY[7], obstacleDiam, obstacleDiam);
  println(obsY[3]);
}




void moveObstacles() {
}

void contactDetect() { // detects any contact between the ball and obstacles and ends the game if contact occurs
  for (int i = 0; i < obsY.length; i++) {

    float yPosition = constrain(mouseY, 100, (height - 100));
    if ((yPosition >= obsY[i]) && (yPosition <= (obsY[i] + obstacleDiam)) 
      && (xPosition >= (width/2) && (xPosition <= (width/2) + obstacleDiam))){

      //(yPosition >= obsY[1]) && (yPosition <= (obsY[1] + obstacleDiam))
      //&& (xPosition >= (width/3) && (xPosition <= (width/3) + obstacleDiam)) ||

      //(yPosition >= obsY[2]) && (yPosition <= (obsY[2] + obstacleDiam))
      //&& (xPosition >= (width/4) && (xPosition <= (width/4) + obstacleDiam)) ||

      //(yPosition >= obsY[3]) && (yPosition <= (obsY[3] + obstacleDiam))
      //&& (xPosition >= (width/2*1.5) && (xPosition <= (width/2*1.5) + obstacleDiam)) ||

      //(yPosition >= obsY[4]) && (yPosition <= (obsY[4] + obstacleDiam))
      //&& (xPosition >= (width/6*5) && (xPosition <= (width/6*5) + obstacleDiam)) ||

      //(yPosition >= obsY[5]) && (yPosition <= (obsY[5] + obstacleDiam))
      //&& (xPosition >= (width/3*2) && (xPosition <= (width/3*2) + obstacleDiam)) ||

      //(yPosition >= obsY[6]) && (yPosition <= (obsY[6] + obstacleDiam))
      //&& (xPosition >= (width/5*2) && (xPosition <= (width/5*2) + obstacleDiam)) ||

      //(yPosition >= obsY[7]) && (yPosition <= (obsY[7] + obstacleDiam))
      //&& (xPosition >= (width/6*3) && (xPosition <= (width/6*3) + obstacleDiam))) {


      state = 3; //resets the game
      xPosition = 100;
      obstacleDiam = 0;   
      speed = 7;
   
    }
    }
  }