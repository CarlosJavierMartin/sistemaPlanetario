import gifAnimation.*;

Planet sun, planet1, planet2, planet3, planet4, planet5;
PImage img;
int zoom = 0;


GifMaker gifExport;
void setup(){
  size(1500,1000, P3D);
  img = loadImage("https://www.solarsystemscope.com/textures/download/2k_stars_milky_way.jpg"); 
  img.resize(width,height);
  
  noStroke();
  lights();
  sun = new Planet(100, "Sun",0.15,0.25,0,0,0,0,0,"https://www.solarsystemscope.com/textures/download/2k_sun.jpg", false, "");
  planet1 = new Planet(30, "Mercury", 0.15,0.20,-200,0,200,0.015,0,"https://www.solarsystemscope.com/textures/download/2k_mercury.jpg", false, "");
  planet2 = new Planet(35,"Earth",0.12,0.17,0,400,400,0.012,0.1,"https://www.solarsystemscope.com/textures/download/2k_earth_daymap.jpg", true, "https://www.solarsystemscope.com/textures/download/2k_moon.jpg");
  planet3 = new Planet(50,"Mars",0.10,0.15,100,600,600,0.01,0.01,"https://www.solarsystemscope.com/textures/download/2k_mars.jpg", false, "");
  planet4 = new Planet(60,"Saturn",0.07,0.12,500,-800,800,0.008,0.008,"https://www.solarsystemscope.com/textures/download/2k_saturn.jpg", false, "");
  planet5 = new Planet(25,"Neptune",0.13,0.18,1000,0,1000,0.005,-0.005,"https://www.solarsystemscope.com/textures/download/2k_neptune.jpg", false, "");
  gifExport = new GifMaker(this, "sp.gif");
  gifExport.setRepeat(0);
}

void draw(){
  background(img);
  drawControls();
  //background(0);
  translate(50,50,-1500+zoom);
  rotateY(-PI/4);
  rotateX(-PI/4);
  sun.display();
  planet1.display();
  planet2.display();
  planet3.display();
  planet4.display();
  planet5.display();
  gifExport.setDelay(1);
  gifExport.addFrame();
}

void drawControls(){
  pushMatrix();
  textAlign(LEFT);
  textSize(12);
  text("Flechita arriba: Zoom In",5,20);
  text("Flechita Abajo: Zoom Out",5,40);
  popMatrix();
}

void keyPressed(){
  
  if(keyCode == UP){
    zoom +=100;
  }

  if(keyCode == DOWN){
    zoom -= 100;
  }
  if(keyCode == ENTER){
    gifExport.finish();
  }
}


class Planet{
  int rad;
  float rx, ry;
  float realx, realy;
  boolean moon;
  float orbitx, orbity, orbitz;
  float transPlanet, transMoon, speedPlanet, speedMoon;
  String txt, s, sm;
  
  PShape shape, moonShape;
  
  Planet(int rad, String txt, float rx, float ry, float orbitx, float orbity, float orbitz, float transPlanet, float transMoon, String s, boolean moon, String sm){
    this.rad = rad;
    this.rx = rx;
    this.ry = ry;
    this.orbitx = orbitx;
    this.orbity = orbity;
    this.orbitz = orbitz;
    this.transPlanet = transPlanet;
    this.transMoon = transMoon;
    this.speedPlanet = transPlanet;
    this.speedMoon = transMoon;
    this.s = s;
    this.moon = moon;
    this.sm = sm;
    this.txt = txt;
    shape = createShape(SPHERE, rad);
    shape.setTexture(loadImage(s));
    if (moon){
      moonShape = createShape(SPHERE, rad/4);
      //moonShape.setTexture(loadImage(sm));
    }
    realx = 0;
    realy= 0;
  }
  
  void display(){
    textAlign(CENTER);
    if (moon){
      pushMatrix();
      translate((width/2)+orbitx*cos(transPlanet)+(rad+15+(rad/4))*cos(transMoon),(height/2)+orbity*cos(transPlanet)+(rad+15+(rad/4))*cos(transMoon),orbitz*sin(transPlanet)+(rad+15+(rad/4))*sin(transMoon));
      rotateX(radians(realx));
      rotateY(radians(realy));
      shape(moonShape);
      popMatrix();
      //translate((rad+15+(rad/4))*cos(transMoon),(rad+15+(rad/4))*cos(transMoon),(rad+15+(rad/4))*sin(transMoon));
      pushMatrix();
      translate((width/2)+orbitx*cos(transPlanet)+(rad+15+(rad/4))*cos(transMoon),(height/2)+orbity*cos(transPlanet)+(rad+15+(rad/4))*cos(transMoon),orbitz*sin(transPlanet)+(rad+15+(rad/4))*sin(transMoon));
      textSize(32);
      rotateX(PI/4);
      text("Moon of "+txt,0,30,0);
      popMatrix();
    }
    pushMatrix();
    translate((width/2)+orbitx*cos(transPlanet), (height/2)+orbity*cos(transPlanet), orbitz*sin(transPlanet));
    rotateX(radians(realx));
    rotateY(radians(realy));
    shape(shape);
    popMatrix();
    pushMatrix();
    translate((width/2)+orbitx*cos(transPlanet), (height/2)+orbity*cos(transPlanet), orbitz*sin(transPlanet));
    textSize(32);
    rotateX(PI/4);
    text(txt, 0,rad+30,0);
    popMatrix();
  
    adjustX();
    adjustY();
    adjustTranslation();
  
  }
  
  
  void adjustX(){
    realx += rx;
    if(realx > 360){
      realx = 0;
    }
  }
  
  void adjustY(){
    realy += ry;
    if(realy > 360){
      realy = 0;
    }
  }
  
  void adjustTranslation(){
    transPlanet +=speedPlanet;
    if (transPlanet > 360){
      transPlanet = 0;
    }
    transMoon +=speedMoon;
    if (transMoon > 360){
      transMoon = 0;
    }
  }
}
