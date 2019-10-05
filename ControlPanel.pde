class ControlPanel {

  float profit;
  ControlPanel() {
    profit=0;
  }

  void TimeElapsed(Date time) {
    if (time.minute==59)
      hours++;
  }

  void drawPanel() {
    fill (#AAAAAA);
    rect(20, 10, 270, 70);
    fill(0);
    textSize(20);
    text ("Parking rates:", 30, 30);
    if (time.today<6) {
      fill(#00DE01);
    }
    textSize(10);
    text ("$3.00/ Hour"+  "    Mon-Sat   "   + " 8 AM-6 PM ", 30, 45); 
    fill(0);
    if (time.today==6) {
      fill(#00DE01);
    }

    text ("1.50/Hour" + "       Sunday"  + "      8 AM-6 PM ", 30, 60);

    fill (#AAAAAA);
    rect (720, 10, 230, 90);
    fill(0);
    textSize(20);
    text ("Simulation Values:", 730, 30);
    textSize(10);
    text ("Profit" + " = " +" $" + profit+ "0", 730, 45);
    text ("Hours Elapsed" + " = " +  hours  + " Hours", 730, 60);
    text ("Customers" + " =" + customers, 730, 75);
    textSize(20);
    fill(255);

    text (time.toString(), 420, 45);
  }
}