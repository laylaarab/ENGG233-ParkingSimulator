class Car {
  int posX;
  int posY;
  Gate ent;
  Gate ex;
  int length;
  int width;
  ParkingStall st;
  color col;
  color col2;
  color r1;
  int speedX;
  int speedY;
  Date leave= new Date ((int)random(7), (int)random(13), (int)random(60), true);
  int h; 

  Car (int x, int y, int he, ControlPanel p) {
    posX=x;
    posY=y;
    length=60;
    width=35;
    do {
      st = (lot.sectionArr[(int)random(3)][(int)random(2)].ps[(int)random(2)][(int)random(5)]);
    } while (st.occupied==true);
    speedX=0;
    speedY=0;
    h=he;
    r1 = color(random(255), random(255), random(255));
    col=r1;
    col2=0;
    int c=(int)random(2);
    if (c==0)
      leave.before_noon=true;
    else
      leave.before_noon=false;
  }

  void drawCar() {
    fill(col);
    stroke(col2);
    rect (posX, posY, length, width);
    moveCar();
  }

  void moveCar() {

    posY+=speedY;
    posX+=speedX;
    ;
    if (posY==135&&posX<=1100) {    //when entering from N, posY=ent.posY-35+ent.Gatewidth  posX<=(ent.posX-(ent.Gatelength/2))
      speedX=1;
      if (posX==483&&posY==135&&north.open==true) {  //556= inwlength of lot
        int turnran=(int)random(4);                                                     //when from S, posY=ex.posY+35+ex.GateWidth
        if (turnran==0||turnran==1||turnran==2) {
          turnIn();
          customers++;
        }
      }
    }
    if (posY==280) {
      posY=570;
      do {
        st = (lot.sectionArr[(int)random(3)][(int)random(2)].ps[(int)random(2)][(int)random(5)]);
      } while (st.occupied==true);
      st.occupied=true;

      st.timeTaken=new Date(time);
      stop();
    }
    if (time.equal(leave)&&st.occupied) {
      st.occupied=false;
      st.timeLeft=new Date(time);
      costy.CalcPrice(st, panel);
    }
    if (st.occupied==false&&posY==570) {
      col2=0;
      col=r1;
      speedY=h;
    }
    if (posY>=729) {
      turnOut();
      if (h==1)
        posY=761;
      else if (h==2)
        posY=716;
    }
    if (posY==761||posY==716) {
      speedX=h;
      if (posX>=1100) {
        int c=(int)random(5000, 9000);
        posX=-40-c;
        r1 = color(random(255), random(255), random(255));
        int y = (int)random(3);
        if (y==1&&h==1)
          posY=761;
        else if (y==1&&h==2)
          posY=716;
        else
          posY=135;
      }
    }

    if (posX>=1100) {
      int c=(int)random(5000, 9000);
      posX=-40-c;
      r1 = color(random(255), random(255), random(255));
      int y = (int)random(3);
      if (y==1&&h==1)
        posY=761;
      else if (y==1&&h==2)
        posY=716;
      else
        posY=135;
    }
  }


  void turnIn() {
    speedY=1;
    speedX=0;
    length=35;
    width=60;


    col2= color (0);
  }

  void turnOut() {
    speedY=0;
    speedX=h;
    length=60;
    width=35;
    col2= color (0);
  }
  
  void stop() {
    speedX=0;
    speedY=0;
    col2=color (160, 160, 160);
    col= color (160, 160, 160);
  }
}