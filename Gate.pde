class Gate {
  int posX;
  int posY;
  int Gatelength;
  int Gatewidth;
  boolean open;
  String title;



  Gate (int x, int y, int l, int w, String s) {
    posX=x;
    posY=y;
    Gatelength=l;
    Gatewidth=w;
    open=true;
    title=s;
  }

  Gate (Gate X) {
    posX=X.posX;
    posY=X.posY;
    Gatelength=X.Gatelength;
    Gatewidth=X.Gatewidth;
    open=X.open;
    title=X.title;
  }


  void drawGate () {
    for (int j = 0; j < lot.row; j++) { 
      for (int i = 0; i< lot.col; i++) { 
        for (int k = 0; k < lot.sectionArr[j][i].row; k++) {
          for (int n = 0; n < lot.sectionArr[j][i].col; n++) {
            if (lot.sectionArr[j][i].ps[k][n].occupied == true)
              open=false;
          }
        }
      }
      open=true;
    }
    if (open)
      openGate();
    else
      closeGate();

    strokeWeight(2);
    rect(posX-105, posY-20, 100, 20);
    stroke(0);
    fill(255);
    rect(posX-105, posY, 100, 20);
    fill(0);
    textSize(14);
    text(title, posX-89, posY-4);
    text(("Spaces: "+numberOccupied()), 385, 235);
    text("Fee: $"+fee+"0", 385, 695);
  }


  void openGate() {
    strokeWeight(7);
    stroke(#A0A0A0);
    stroke(#CB2121);
    line(posX+2, posY, posX+0.75*Gatelength, posY-Gatewidth);
    strokeWeight(0.5);
    stroke(0);
    fill(#00FFF0);
    ellipse(posX+2, posY, 7, 7);
  }


  void closeGate() {
    strokeWeight(7);
    stroke(#A0A0A0);
    stroke(#CB2121);
    line(posX+2, posY, posX+Gatelength-2, posY);
    strokeWeight(0.5);
    stroke(0);
    fill(#00FFF0);
    ellipse(posX+2, posY, 7, 7);
  }


  int numberOccupied() {
    int counter=0;
    for (int j = 0; j < lot.row; j++) { 
      for (int i = 0; i< lot.col; i++) { 
        for (int k = 0; k < lot.sectionArr[j][i].row; k++) {
          for (int n = 0; n < lot.sectionArr[j][i].col; n++) {
            if (lot.sectionArr[j][i].ps[k][n].occupied == false)
              counter++;
          }
        }
      }
    }
    return counter;
  }
}