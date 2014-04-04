/**
  * Représentation interactive d'un ‹Project Management Triangle› avec Processing.
  * cf. https://github.com/gongfuio/Girafe/blob/master/sketch_triangle_production/README.md
  */
  
float offsetX, offsetY;
PVector s1, s2, s3; 

// Affiche un triangle dans l'espace 3D sur les trois sommets s1, s2 et s3,
// ces derniers étant des tuples contenant des coordonnées ‹x;y;z› */
void triangle3D( PVector s1, PVector s2, PVector s3) {
  beginShape();
  vertex( s1.x, s1.y, s1.z);
  vertex( s2.x, s2.y, s2.z);
  vertex( s3.x, s3.y, s3.z);
  endShape( CLOSE);
}

// Affiche un jeu d'axes X, Y et Z
void drawAxis() {
  PVector axisX = new PVector( width/3 + 10, 0, 0);
  PVector axisY = new PVector( 0, -height/3 - 10, 0);
  PVector axisZ = new PVector( 0, 0, width/3 + 10);
  PVector origin = new PVector( 0, 0, 0);
  pushMatrix();
  noFill();
  stroke( 128, 32, 32);  // Rouge foncé, 100% opacité 
  triangle3D( origin, axisY, axisZ);
  triangle3D( origin, axisY, axisX);
  triangle3D( origin, axisZ, axisX);
  popMatrix();
}

// Affiche un ‹Project Management Triangle› sur trois sommets placés
// sur les axes X, Y et Z à une hauteur proportionnelle aux valeurs
// des arguments x, y et z. Ces derniers doivent contenir une valeur
// entre 0.0 et 1.0.
void drawProdTriangle( float x, float y, float z) {
  PVector sx = new PVector( map( x, 0.0, 1.0, 0.0, width/3), 0, 0);
  PVector sy = new PVector( 0, - map( y, 0.0, 1.0, 0.0, height/3), 0);
  PVector sz = new PVector( 0, 0, map( z, 0.0, 1.0, 0.0, width/3));

  pushMatrix();
  fill( 192, 192, 192, 35); // Gris clair, 35% opacité
  stroke( 255, 255, 255); // Blanc, 100% opacité
  triangle3D( sx, sy, sz);
  popMatrix();
}

// Initialisation du canevas Processing (espace en 3D)
void setup() {
  size( 600, 600, P3D);
  smooth();
  lights();
}

void draw() {
  // Fond rouge foncé, avec 15% transparence
  background( 80, 32, 32, 15);
  
  // Déplace origine du système de coordonnées au centre du canevas 
  translate( width/2, height/2, 0);

  // Rotation légère de l'ensemble du tracé, pour le voir en perspective
  rotateX( -PI/9);
  rotateY( -PI/6);
  scale( 0.80);

  offsetX = map( mouseX, 0, width, 0.0, 1.0);
  offsetY = map( mouseY, 0, height, 1.0, 0.0);

  // Tracé des axes et du triangle de production, en variant position 
  // des sommets X et Y du triangle selon position du pointeur de la souris
  drawAxis();
  drawProdTriangle( offsetX, offsetY, 1.0);
  // drawProdTriangle( 0.25, 0.25, 0.25);
  // drawProdTriangle( 0.5, 0.5, 0.5);
  // drawProdTriangle( 0.75, 0.75, 0.75);
  // drawProdTriangle( 1.0, 1.0, 1.0);
}

