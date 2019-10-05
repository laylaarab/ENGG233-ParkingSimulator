class ParkingStall {

  // STALL ATTRIBUTES
  boolean occupied;
  Date timeTaken;
  Date timeLeft;

  // DIMENSIONS AND POSITION
  int stallWidth;
  int stallHeight;
  int posX;
  int posY;

  ParkingStall(int x, int y, int w, int h) {
    occupied = false;
    posX = x;
    posY = y;
    stallWidth = w;
    stallHeight = h;
    timeLeft=new Date((int)random(7), (int)random(13), (int)random(60), true);
  }

  ParkingStall(ParkingStall s) {
    posX=s.posX;
    posY=s.posY;
    stallWidth=s.stallWidth;
    stallHeight=s.stallHeight;
  }

  void drawStall() {
    if (occupied)
      fill(color(255, 90, 71)); // RED STALL
    else
      fill(color(152, 251, 152));  // GREEN STALL
    strokeWeight(3);
    stroke(255);
    rect(posX, posY, stallWidth, stallHeight);
    strokeWeight(1);
  }

  //Sets whether the stall is occupied
  void setStatus(boolean status, Date time) {
    occupied = status;
    if (occupied) {
      timeTaken = new Date(time);
    }
  }
}