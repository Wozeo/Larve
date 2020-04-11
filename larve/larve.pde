
int nLarve = 10;
larva larves[] = new larva[nLarve];
float larg;


void setup() {
  size(700, 700);
  larg = (9/10.0)*height/nLarve;
  for (int i = 0; i < nLarve; i ++) {
    larves[i] = new larva(random(0, width), i);
  }
}


void draw() {
  background(130, 200, 130);
  for (int i = 0; i < nLarve; i ++) {
    larves[i].deplaff();
  }
  stroke(0);
  line(width, 0, width, height);
}


class larva {
  float x, y;
  int n = 11;
  int temps = 0;
  int cycle = 200;
  float coeff = 1;
  float taille = 0.5;
  float vitesse = 1*taille;
  int numero;
  color c;
  larva(float xI, int nI) {
    x = xI;
    numero = nI;
    ini();
  }

  void deplaff() {
    stroke(0);
    fill(c);
    coeff = 1.1+(0.2*(sin(2*PI*temps/cycle)));
    for (int i = n-1; i >= 0; i --) {
      arc(x-25*i*coeff*taille, y, 40*i*taille, taille*50*i*(n-i)/n, -PI, 0, CHORD);
    }
    pushStyle();
    stroke(0);
    strokeWeight(4*taille);
    point(x-10+(1-coeff)*10*taille*2, y-10*taille);
    popStyle();
    temps ++;
    if (temps > cycle) {
      temps = 0;
    }
    if (temps < cycle/4.0 || temps > 3*cycle/4.0) {
      x += vitesse;
    }
    if (x > width + 25*(n-1)*coeff*taille + 40*(n-1)*taille) {
      ini();
      x = 0;
    }
  }

  void ini() {
    taille = random(0.3, 0.7);
    ;
    n = int(random(7, 15));
    temps = int(random(0, cycle));
    y = random(height/20 + numero*larg, height/20 + (numero+1)*larg);
    c = color(230, 230, random(190, 230));
  }
}
