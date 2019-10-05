//global variables
ParkingStall stall = new ParkingStall (75, 400, 80, 50);
ParkingStallSection section = new ParkingStallSection (stall, 2, 5, 75, 30, 120, 400);
ParkingLot lot = new ParkingLot (520, 1000, 0, 190, 30, 60, 3, 2, 50, stall, section);
Street norths= new Street("North City Street", 0, 120);
Street souths = new Street("South City Street", 0, 711);
PriceCalculator costy = new PriceCalculator (1.50, 3.00);
Date time = new Date (1, 0, 0, true);
float fee=0.00;
Gate north= new Gate(475, 220, 50, 30, "ENTRANCE");
Gate south= new Gate(475, 680, 50, 30, "EXIT");
CarSpawner cars= new CarSpawner(135, 716, 761);
float profit=0;
int hours=0;
int customers=0;
ControlPanel panel= new ControlPanel();

void setup() {
  size(1000, 800);
  background(#A0A0A0);
  lot.drawLot();
}

void draw() {
  lot.drawDyn();
  norths.drawStreet();
  souths.drawStreet();
  north.drawGate();
  south.drawGate();
  noStroke();

  //drawing objects
  time.addMinute();
  println(time);
  panel.TimeElapsed(time);
  cars.spawnCar();
  panel.drawPanel();
}