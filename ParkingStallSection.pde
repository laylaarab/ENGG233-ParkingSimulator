class ParkingStallSection { //<>//
  int row;
  int col;
  int posX;
  int posY;
  float width;
  float length;
  ParkingStall p;
  ParkingStall [][] ps;


  ParkingStallSection (ParkingStall stall, int r, int c, int x, int y, float w, float l) {
    p=stall;
    row=r;
    col=c;    
    posX=x;
    posY=y;
    width=w;
    length=l;
    ps = new ParkingStall [r][c];
    for (int j=0; j<r; j++) {
      for (int i=0; i<c; i++) {
        ps[j][i]= new ParkingStall(p.posX, p.posY, p.stallWidth, p.stallHeight);
      }
    }
  }

  void drawStallSection () {
    for (int j=0; j<row; j++) {
      for (int i=0; i<col; i++) {
        ps [j][i].posX= posX+ps[0][0].stallWidth*i;
        ps [j][i].posY= posY+ps[0][0].stallHeight*j;
        ps [j][i].drawStall();
      }
    }
  }
}