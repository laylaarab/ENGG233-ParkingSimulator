class ParkingLot {

  int Lotwidth;
  int Lotlength;
  int posX;
  int posY;
  //parking lot border dimensions
  int topwidth;
  int sidewidth;
  int sectionspac;
  int row;
  int col;
  ParkingStall stall;
  ParkingStallSection section;
  ParkingStallSection [][] sectionArr;


  ParkingLot(int w, int l, int x, int y, int tw, int sw, int r, int c, int space, ParkingStall ps, ParkingStallSection s) {

    Lotwidth=w;
    Lotlength=l; 
    posX=x;
    posY=y;
    topwidth=tw;
    sidewidth=sw;
    row=r;
    col=c;
    sectionspac=space;
    sectionArr = new ParkingStallSection [row][col];
    for (int i = 0; i < r; i++) { 
      for (int j = 0; j < c; j++) {
        sectionArr [i][j] = new ParkingStallSection (ps, s.row, s.col, ps.posX, ps.posY, s.width, s.length);
      }
    }
    for (int j=0; j<row; j++) {
      for (int i=0; i<col; i++) {
        sectionArr[j][i].posY+=(sectionspac+sectionArr[j][i].width)*(j-1);
        sectionArr[j][i].posX+=(sectionspac+sectionArr[j][i].length)*i;
      }
    }
  }

  void drawLot() {
    smooth();
    //border of lot
    strokeWeight(4);
    stroke(255);
    fill(#41A046);
    rect(posX, posY, Lotlength, Lotwidth);
    fill(#A0A0A0);
    rect(posX+sidewidth, posY+topwidth, Lotlength-sidewidth*2, Lotwidth-topwidth*2);
    stroke(#A0A0A0);
    strokeWeight(10);
    rect(posX+Lotlength/2-25, posY+1, 50, topwidth);
    rect(posX+Lotlength/2-25, posY+Lotwidth-topwidth-1, 50, topwidth);
    fill(255);
    line(posX+Lotlength/2-25, posY, posX+Lotlength/2-25, posY+topwidth);
    line(posX+Lotlength/2+25, posY+Lotwidth-topwidth+1, posX+Lotlength/2, posY+Lotwidth);
    for (int j=0; j<row; j++) {
      for (int i=0; i<col; i++) {
        sectionArr[j][i].drawStallSection();
      }
    }

    //opening of the gate
    strokeWeight(3);
    line(posX+Lotlength/2-30, posY, posX+Lotlength/2-30, posY+topwidth);
    line(posX+Lotlength/2+29, posY, posX+Lotlength/2+29, posY+topwidth);
    line(posX+Lotlength/2+29, posY+Lotwidth-topwidth, posX+Lotlength/2+29, posY+Lotwidth);
    line(posX+Lotlength/2-29, posY+Lotwidth-topwidth, posX+Lotlength/2-29, posY+Lotwidth);
    stroke(255);
    strokeWeight(4);
    fill(#41A046);
    rect(-20, -5, 1030, 122);
  }
  
  void drawDyn() {
    noStroke();
    fill(#A0A0A0);
    rect(480, 150, 40, 600);
    stroke(0);
    fill(255);
    rect(930, 190, 50, 30);
    fill(0);
    textSize(7);
    text("   Limit \n 1px/frame lol", 935, 200);
    stroke(255);
    strokeWeight(4);
    fill(#41A046);
    rect(-20, -5, 1030, 122);
    for (int j=0; j<row; j++) {
      for (int i=0; i<col; i++) {
        sectionArr[j][i].drawStallSection();
      }
    }
  }
}