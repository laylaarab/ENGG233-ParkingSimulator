class PriceCalculator {
  Date start;
  Date end;
  float costperhour;
  float suncost;
  float weekcost;
  ParkingLot lot;
  int minutesStayed=0;

  PriceCalculator(float cost1, float cost2) {
    suncost=cost1;
    weekcost=cost2;
  }

  void CalcPrice (ParkingStall ps, ControlPanel p)
  {
    int counter=0;
    fee=0;
    fee+=CheckFee();
    while (ps.timeTaken.equal(ps.timeLeft)==false) {
      ps.timeTaken.addMinute();
      counter++;
      if (counter==60) {
        counter=0;
        fee+=CheckFee();
      }
    }
    p.profit+=fee;
  }

  float CheckFee()
  {
    if (time.today==6)
      return suncost;
    return weekcost;
  }
}