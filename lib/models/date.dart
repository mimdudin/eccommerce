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

  Date(
      {this.day,
      this.dayNumber,
      this.month,
      this.timeStart,
      this.timeEnd,
      this.count,
      this.isSelectedTime,
      this.isSelectedDay,
      this.isSelectedMonth,
      this.isFullSlot});
}

class NewDate {
  int id;
  String month;
  // bool isSelectedDay;
  bool isSelectedMonth;
  bool isSelectedTime;
  List<DayAvailable> dayAvailable;
  List<TimeAvailable> timeAvailable;

  NewDate({
    this.id,
    this.month,
    this.isSelectedMonth,
    // this.isSelectedDay
    // this.isSelectedTime,
    // this.dayAvailable,
    // this.timeAvailable
  });

  // factory NewDate.fromJson(Map<String, dynamic> json){
  //   return NewDate(json['id'], json['month'], json['isFullSlot'], dayAvailable, TimeAvailable.fromJson(json['timeAvailable']));
  // }
}

class TimeAvailable {
  String timeStart, timeEnd, day, month;
  bool isFullSlot, isSelectedTime;
  int slots;

  TimeAvailable(this.timeStart, this.timeEnd, this.day, this.month,
      this.isFullSlot, this.isSelectedTime, this.slots);

  factory TimeAvailable.fromJson(Map<String, dynamic> json) {
    return TimeAvailable(json['timeStart'], json['timeEnd'], json['day'],
        json['month'], json['isFullSlot'], false, 0);
  }
}

class DayAvailable {
  String day, dayNumber, month;
  bool isSelectedDay;

  DayAvailable(this.day, this.dayNumber, this.month, this.isSelectedDay);

  factory DayAvailable.fromJson(Map<String, dynamic> json) {
    return DayAvailable(json['day'], json['dayNumber'], json['month'], false);
  }
}
