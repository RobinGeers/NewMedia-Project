import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import controlP5.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Code extends PApplet {



PImage image3;
int savedTime;
int totalTime = 0;
int az = 0;
boolean timerStarted = false;
ControlP5 cp5;
int firstTime = 0;
PImage[] arrOnderdelen = new PImage[3];
boolean countDownEnded = false;

public void setup() {
	size(600,600);
	background(255);
	noStroke();
	smooth();

	// Constructor. This = parent
	cp5 = new ControlP5(this);

	// Button
	cp5.addButton("startButton").setValue(0).setPosition(100,100).setSize(200,19);

	firstTime = 1;
}

public void draw() {

toonCountDown();

if (countDownEnded) {

if(firstTimeAfbeelding ==0 ){
toonRandomAfbeelding();
}
}



}

public void startButton() {
	// Zorgt ervoor dat de knop code niet wordt uitgevoerd bij het initialiseren
	if(firstTime==0) return;

	background(255);

	timerStarted = true;
	
}

public void toonCountDown() {
  // Tijd die gepasseerd is
  int passedTime = millis() - savedTime;

  if(timerStarted == true) {
	if(az==0){
		totalTime = passedTime;
	}

    if(passedTime>totalTime&&passedTime<totalTime+1000&&!(passedTime>totalTime+1000)&&!(passedTime<totalTime))

    {
        background(255);
        toonAfbeelding(3);
    }

    if(passedTime>totalTime+1000&&passedTime<totalTime+2000&&!(passedTime>totalTime+2000)&&!(passedTime<totalTime+1000))
    {
        background(255);
        toonAfbeelding(2);
    }

    if(passedTime>totalTime+2000&&passedTime<totalTime+3000&&!(passedTime>totalTime+3000)&&!(passedTime<totalTime+2000))
    {
        background(255);
        toonAfbeelding(1);
    }

    if(passedTime>totalTime+3000&&passedTime<totalTime+4000&&!(passedTime>totalTime+4000)&&!(passedTime<totalTime+3000))
    {
        background(255);
        toonAfbeelding(0);
    }
    if (passedTime>totalTime+4000) {
    	countDownEnded = true;
    }

    az=1;
	}

}

public void toonAfbeelding(int getal) {
	image3 = loadImage(getal + ".png");
	image(image3, 300, 300);
}

int firstTimeAfbeelding = 0;
public void toonRandomAfbeelding() {
	background(255);
	for (int i = 1; i < arrOnderdelen.length+1; i++) {
		arrOnderdelen[i-1] = loadImage("Object" + i + ".png");
	}
	float randomAfbeelding = random(0, 3);
	image(arrOnderdelen[PApplet.parseInt(randomAfbeelding)], 100, 100);
	firstTimeAfbeelding = 1;
}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Code" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
