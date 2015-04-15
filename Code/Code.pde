import controlP5.*;

PImage image3;
int savedTime;
int totalTime = 0;
int az = 0;
boolean timerStarted = false;
ControlP5 cp5;
int firstTime = 0;
int firstTimeAfbeelding = 0;
PImage[] arrOnderdelen = new PImage[3];
boolean countDownEnded = false;
boolean userCollision = false;
int userCollisionCounter = 0;
float randomAfbeelding;
int reset = 0;

void setup() {
	size(600,600);
	background(255);
	noStroke();
	smooth();
	textFont(createFont("Helvetica-Nueu", 15));
	// Constructor. This = parent
	cp5 = new ControlP5(this);

	// Button 'Start Training'
	cp5.addButton("startButton").setValue(0).setPosition(50,50).setSize(100,19);
	cp5.getController("startButton").setCaptionLabel("Start training");

	//
	
	//cp5.getController("buttonOpnieuw").hide();

	firstTime = 1;
}

void draw() {

toonCountDown();

if (countDownEnded) {

	if(firstTimeAfbeelding == 0) {
		toonRandomAfbeelding();
		toonTekstInstructie();
	}
}

}

void startButton() {
	// Zorgt ervoor dat de knop code niet wordt uitgevoerd bij het initialiseren
	if(firstTime==0) return;

	background(255);

	timerStarted = true;

	// Verberg de 'Start training knop'
	cp5.getController("startButton").hide();	
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

void toonRandomAfbeelding() {
	background(255);
	for (int i = 1; i < arrOnderdelen.length+1; i++) {
		arrOnderdelen[i-1] = loadImage("Object" + i + ".png");
	}
	randomAfbeelding = random(0, 3);
	image(arrOnderdelen[int(randomAfbeelding)], 200, 200, 200, 200);
	firstTimeAfbeelding = 1;
}

void toonTekstInstructie() {
	  fill(#000000);
	  textSize(20);
	  text("Neem dit object uit het lichaam van Dr. Bibber.", 50, 100);
}

// TODO: Sluit Makey Makey aan om te testen
void keyPressed() {
	if (key == CODED) {
    	if (keyCode == UP) { // Bots
	      userCollisionCounter++;
	  	  background(#e74c3c);
	  	  image(arrOnderdelen[int(randomAfbeelding)], 200, 200, 200, 200); // Toon opnieuw het getoonde object
	  	  toonTekstGebotst();
	  	  toonTekstInstructie();
		}
		else if (keyCode == RIGHT) { // Object ligt op veilige plaats
		  reset = 0; // Zorgt ervoor dat buttonOpnieuw niet iedere keer wordt uitgevoerd als hij wordt aangemaakt
		  toonButtonOpnieuw();
		  toonTekstGewonnen();
		}
	}
}

void toonTekstGebotst() {
	  fill(#000000);
	  textSize(20);
	  text("Aantal keren gebotst: " + str(userCollisionCounter), 50, 150);
}

void toonTekstGewonnen() {
	  fill(#000000);
	  background(#2ecc71);
	  textSize(20);
	  text("Proficiat u hebt het object! U bent " + userCollisionCounter + " keer gebotst.", 50, 150);
}

void toonButtonOpnieuw() {
	cp5.addButton("buttonOpnieuw").setValue(0).setPosition(50,50).setSize(100, 20);
	cp5.getController("buttonOpnieuw").setCaptionLabel("Volgend object");
	// http://www.sojamo.de/libraries/controlP5/reference/controlP5/Controller.html ALLE getController properties!
}

void buttonOpnieuw() {
	// Zorgt ervoor dat de knop code niet wordt uitgevoerd bij het initialiseren
	if (firstTime == 0) return;
	resetAlles();
	reset = 1;
}

void resetAlles() {
	// Zorgt ervoor dat de knop code niet wordt uitgevoerd bij het initialiseren
	if(reset==0) return;
	background(255);
	toonRandomAfbeelding();
	toonTekstInstructie();
	userCollisionCounter = 0;
	
}