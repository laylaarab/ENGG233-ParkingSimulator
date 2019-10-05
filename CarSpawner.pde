class CarSpawner {
  Car [] mycars;
  int he;

  CarSpawner (int y1, int y2, int y3) {
    int a =0;
    mycars = new Car[400];
    for (int i = 0; i < 400; i++) {
      int c=(int)random(100, 300);
      int y = (int)random(5);
      if (y==3) {
        y=y2;
        he=2;
      } else if (y==2) {
        y=y3;
        he=1;
      } else if (y==0||y==1) {
        y=y1;
        he=1;
      }
      mycars[i] = new Car(-90, y, he, panel);
      mycars[i].posX-=a;
      a+=c;
    }
  }

  void spawnCar() {
    for (int i=0; i<400; i++) {
      mycars[i].drawCar();
      if (mycars[i].posY==135&mycars[i].posX==483) {
        customers++;
        customers-=1;
      }
    }
  }
}