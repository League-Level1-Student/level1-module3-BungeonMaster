int birdX = 50;
int birdY = 400;
int birdVelocity = 40;
int gravity = 2;
int pipeX =350;
int pipeWidth = 100;
int pipeVelocity = 5;
int upperPipeHeight = (int) random(100,400);
int gap = 100;
int upperY = 0;
int lowerY = upperY + upperPipeHeight + gap;
int windowHeight = 800;
int lowerPipeHeight = windowHeight - upperPipeHeight - gap;
int score = 0;
boolean gameOver = false;

void setup() {
  size(800,800); 
}

void draw() {  
  
  //background
  background(0, 0, 255);
  
  if(gameOver) {
    
  textSize(42);
  text("GAME OVER", 300, 400);
  
  }
  else {
  
  //Bird
  fill(255, 0, 0);
  stroke(0, 0, 0);
  ellipse(birdX, birdY, 25, 25);
  
  //Bird Movement
  birdY+= gravity;
  
  //Top Pipe
  fill(0,255,0);
  rect(pipeX,0, pipeWidth,upperPipeHeight);
  
  //Bottom Pipe
  rect(pipeX,lowerY, pipeWidth,lowerPipeHeight);
  
  //ground
  rect(0,750,width,50);
  
  //Score
  text("Score:" + score, 400, 50);
  
  //Pipe Movement
  pipeX -= pipeVelocity;
  teleportPipes();
  
  //Collision detection
  if(intersectsPipes() || hitsGround()) {
     gameOver = true;
  }
  
  }
  
}

void mousePressed() {
  birdY -= birdVelocity;
}

void teleportPipes() {
  
   if(pipeX <= 0) {
    pipeX = 800;
    upperPipeHeight = (int) random(100,400);
    lowerY = upperPipeHeight + gap;
    lowerPipeHeight = windowHeight - upperPipeHeight - gap;
    score++;
    
  }
  
}

boolean intersectsPipes() { 
     if (birdY < upperPipeHeight && birdX > pipeX && birdX < (pipeX+pipeWidth)){
          return true; }
     else if (birdY>lowerY && birdX > pipeX && birdX < (pipeX+pipeWidth)) {
          return true; }
     else { return false; }
}

boolean hitsGround() {
  
  if(birdY >= height) {
     return true; 
  }
  else {
     return false; 
  }
  
}
