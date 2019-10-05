class Date {
  final String [] days = {"Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"};
  int today;
  int hour;
  int minute;
  boolean before_noon;

  Date (int d, int h, int m, boolean beforeNoon) {
    today=d%8;
    hour=h%13;
    minute=m%60;
    before_noon=beforeNoon;
  }
  Date (Date d) {
    today= d.today;
    hour=d.hour;
    minute=d.minute;
    before_noon=d.before_noon;
  }

  void addHour () {
    ++hour;
    if (hour>=13)
    {
      hour%=13;
      hour++;
      if (before_noon)
        before_noon=false;

      else {

        before_noon=true;
        today+=1;
        if (today>6)
          today%=7;
      }
    }
  }

  void addMinute () {
    ++minute;
    if (minute>=60)
    {
      minute%=60;
      addHour();
    }
  }

  String toString() {
    String date= days[today];
    if (hour<10)
      date+=" 0"+hour;
    else
      date+=" " +hour;

    if (minute<10)
      date+=":0"+minute;
    else
      date+=":"+minute;

    if (before_noon)
      date+="AM";
    else
      date+="PM";
    return date;
  }
  boolean equal(Date date)
  {
    if (date.today==today&&date.hour==hour&&date.minute==minute&&date.before_noon==before_noon)
      return true;
    return false;
  }
}