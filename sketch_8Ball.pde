String[] answers;
import g4p_controls.*;
GImageButton button;
String display;
int delay = 16;
boolean buttonPressed = false ; 
float alpha = 0;
int counter = 0 ;
PImage img ;


public void setup() {
  size(500, 500);
  frameRate(15);
  answers = new String[]{"yes", "no", "recalculate", "absolutely", "definitely", "change yer fate"};
  button = new GImageButton(this, width/2-40, 0, new String[] {"button.png"} );
  fill(0);
  ellipse(width/2, height/2+25, 400, 400);
  drawInnerCircle(false);
  drawTriangle();
}

public void drawInnerCircle(boolean random) { 
  fill(#950606);
  if ( random ) { 
    fill(random(255), random(255), random(255));
  }
  ellipse(width/2, height/2+25, 200, 200);
}

public void drawTriangle() { 
  fill(255);
  triangle(250, 175, 325, 325, 175, 325);
}

public void draw() {
  if ( buttonPressed) { 
    displayText();
  }
}


public void handleButtonEvents(GImageButton button, GEvent event) { 
  counter = 3;
  buttonPressed = true ;
}


public void displayText() {
  ballIsThinking();
  if (counter > 0) {
    drawInnerCircle(true);
    drawTriangle();
  }

  if (counter == 0) {
    drawTriangle();
    surface.setTitle("Fortune Teller");
    buttonPressed = false ;
  }
  printAnswer();
}

public void ballIsThinking() {
  if (alpha<=20)
  {
    alpha ++;
  } else {
    alpha = 0;
    counter--;
    fill(0);
    rect(width/2-25, height/2-150, 50, 50);
  }
  if ( counter > 0) { 
    surface.setTitle("Thinking...");
    fill(#FFFFFF, alpha);
    textSize(42);
    text(counter, width/2, height/2-100);
  }
}

public void printAnswer() {
  display = answers[int(random(6))];
  fill(0);
  textAlign(CENTER);
  textSize(16);
  text(display, 250, 300);
}