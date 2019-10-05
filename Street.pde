class Street {
  String streetname;
  int posX;
  int posY;

  Street(String s, int x, int y) {
    streetname=s;
    posX=x;
    posY=y;
  }

  void drawStreet() 
  {
    textSize(18);
    fill(#A0A0A0);
    noStroke();
    rect(0, 760, 1000, 60);
    rect(posX, posY, 1000, 70);
    //name of street
    fill(255);
    text(streetname, 430, posY+40);

    for (int i=0; i<11; i++) {
      int w=100;
      fill(255);
      rect(20, 755, 50, 5);
      rect(w*i+20, 755, 50, 5);
    }
  }
}