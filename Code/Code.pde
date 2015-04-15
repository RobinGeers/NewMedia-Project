import controlP5.*;

PImage image3;
int savedTime;
int totalTime = 0;
int az = 0;
boolean timerStarted = false;
ControlP5 cp5;
int firstTime = 0;
PImage[] arrOnderdelen = new PImage[3];
boolean countDownEnded = false;

void setup() {
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

void draw() {

toonCountDown();

if (countDownEnded) {

if(firstTimeAfbeelding ==0 ){
toonRandomAfbeelding();
}
}

}

void startButton() {
	// Zorgt ervoor dat de knop code niet wordt uitgevoerd bij het initialiseren
	if(firstTime==0) return;

	background(255);

	timerStarted = true;
	
}

void toonCountDown() {
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

void toonAfbeelding(int getal) {
	image3 = loadImage(getal + ".png");
	image(image3, 300, 300);
}

int firstTimeAfbeelding = 0;
void toonRandomAfbeelding() {
	background(255);
	for (int i = 1; i < arrOnderdelen.length+1; i++) {
		arrOnderdelen[i-1] = loadImage("Object" + i + ".png");
	}
	float randomAfbeelding = random(0, 3);
	image(arrOnderdelen[int(randomAfbeelding)], 100, 100);
	firstTimeAfbeelding = 1;
}