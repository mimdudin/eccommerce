class Date {
  int count;

  bool isSelectedDay;
  bool isSelectedMonth;
  bool isSelectedTime;
  bool isFullSlot;

  String month;
  String day;
  String dayNumber;
  String timeStart;
  String timeEnd;

  Date({this.day, this.dayNumber, this.month, this.timeStart, this.timeEnd, this.count, this.isSelectedTime, this.isSelectedDay, this.isSelectedMonth, this.isFullSlot});
}
