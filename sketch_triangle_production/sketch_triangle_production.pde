float offsetX, offsetY;
PVector s1, s2, s3; 

void triangle3D( PVector s1, PVector s2, PVector s3) {
  beginShape();
  vertex( s1.x, s1.y, s1.z);
  vertex( s2.x, s2.y, s2.z);
  vertex( s3.x, s3.y, s3.z);
  endShape( CLOSE);
}

void drawAxis() {
  PVector axisX = new PVector( width/2, 0, 0);
  PVector axisY = new PVector( 0, -height/2, 0);
  PVector axisZ = new PVector( 0, 0, width/2);
  PVector origin = new PVector( 0, 0, 0);
  pushMatrix();
  noFill();
  stroke( 192, 128);
  triangle3D( origin, axisY, axisZ);
  triangle3D( origin, axisY, axisX);
  triangle3D( origin, axisZ, axisX);
  popMatrix();
}

void drawProdTriangle( float x, float y, float z) {
  PVector sx = new PVector( map( x, 0.0, 1.0, 0.0, width/3), 0, 0);
  PVector sy = new PVector( 0, - map( y, 0.0, 1.0, 0.0, height/3), 0);
  PVector sz = new PVector( 0, 0, map( z, 0.0, 1.0, 0.0, width/3));

  pushMatrix();
  fill( 192, 12);
  stroke( 255);
  triangle3D( sx, sy, sz);
  popMatrix();
}

void setup() {
  size( 600, 600, P3D);
  smooth();
  lights();
}

void draw() {
  background( 80, 32, 32, 0.15);
  translate( width/2, height/2, 0);

  offsetX = map( mouseX, 0, width, 0.0, 1.0);
  offsetY = map( mouseY, 0, height, 1.0, 0.0);
  rotateX( -PI/9);
  rotateY( -PI/6);
  scale( 0.80);
  // rotateZ( -PI/6);

  drawAxis();
  drawProdTriangle( offsetX, offsetY, 1.0);
}

