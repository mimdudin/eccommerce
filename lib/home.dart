import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:scoped_model/scoped_model.dart';

import './screens/home_slider.dart';
import './models/categories.dart';
import './models/date.dart';
import './services/date_service.dart';

class Home extends StatefulWidget {
  final DateService model;
  Home(this.model);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Categories> _categoriesList = List<Categories>();
  // List<Date> _dateList = List<Date>();
  // List<Date> _monthList = List<Date>();
  // List<Date> _timeList = List<Date>();
  bool monthSelected = false;
  bool daySelected = false;
  String _month;
  String _day;

  @override
  void initState() {
    super.initState();

    //Categories Data
    _categoriesList.add(Categories("The Market"));
    _categoriesList.add(Categories("Electronics"));
    _categoriesList.add(Categories("Grocery"));
    _categoriesList.add(Categories("Occasions"));
    _categoriesList.add(Categories("The Market"));
    _categoriesList.add(Categories("Grocery"));

    // //Date Data
    // _dateList.add(Date(day: "Mon", dayNumber: "1", isSelectedDay: false));
    // _dateList.add(Date(day: "Tue", dayNumber: "2", isSelectedDay: false));
    // _dateList.add(Date(day: "Wed", dayNumber: "3", isSelectedDay: false));
    // _dateList.add(Date(day: "Thu", dayNumber: "4", isSelectedDay: false));
    // _dateList.add(Date(day: "Fri", dayNumber: "5", isSelectedDay: false));
    // _dateList.add(Date(day: "Sat", dayNumber: "6", isSelectedDay: false));
    // _dateList.add(Date(day: "Sun", dayNumber: "7", isSelectedDay: false));

    // _monthList.add(Date(month: "January", isSelectedMonth: false));
    // _monthList.add(Date(month: "February", isSelectedMonth: false));
    // _monthList.add(Date(month: "March", isSelectedMonth: false));
    // _monthList.add(Date(month: "April", isSelectedMonth: false));
    // _monthList.add(Date(month: "May", isSelectedMonth: false));
    // _monthList.add(Date(month: "June", isSelectedMonth: false));
    // _monthList.add(Date(month: "July", isSelectedMonth: false));
    // _monthList.add(Date(month: "August", isSelectedMonth: false));
    // _monthList.add(Date(month: "September", isSelectedMonth: false));
    // _monthList.add(Date(month: "October", isSelectedMonth: false));
    // _monthList.add(Date(month: "November", isSelectedMonth: false));
    // _monthList.add(Date(month: "Desember", isSelectedMonth: false));

    // _timeList.add(Date(
    //     timeStart: "7:00 AM",
    //     timeEnd: "8:00 AM",
    //     isSelectedTime: false,
    //     isFullSlot: false,
    //     count: 1));
    // _timeList.add(Date(
    //     timeStart: "8:00 AM",
    //     timeEnd: "9:00 AM",
    //     isSelectedTime: false,
    //     isFullSlot: false,
    //     count: 1));
    // _timeList.add(Date(
    //     timeStart: "9:00 AM",
    //     timeEnd: "10:00 AM",
    //     isSelectedTime: false,
    //     isFullSlot: true,
    //     count: 1));
    // _timeList.add(Date(
    //     timeStart: "10:00 AM",
    //     timeEnd: "11:00 AM",
    //     isSelectedTime: false,
    //     isFullSlot: true,
    //     count: 1));
    // _timeList.add(Date(
    //     timeStart: "11:00 AM",
    //     timeEnd: "12:00 AM",
    //     isSelectedTime: false,
    //     isFullSlot: false,
    //     count: 1));
    // _timeList.add(Date(
    //     timeStart: "12:00 AM",
    //     timeEnd: "13:00 AM",
    //     isSelectedTime: false,
    //     isFullSlot: false,
    //     count: 1));
    // _timeList.add(Date(
    //     timeStart: "13:00 AM",
    //     timeEnd: "14:00 AM",
    //     isSelectedTime: false,
    //     isFullSlot: false,
    //     count: 1));

    loadData();
    _month = "Default";
    _day = "Default";
  }

  Future loadData() async {
    await widget.model.loadDate();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<DateService>(
      builder: (context, child, model) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blueGrey[600],
            elevation: 0.0,
            title: Text("LOGO"),
            centerTitle: true,
            leading: IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {},
              color: Colors.white,
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {},
                color: Colors.white,
              ),
              IconButton(
                icon: Icon(Icons.shopping_basket),
                onPressed: () {},
                color: Colors.white,
              )
            ],
          ),
          body: Container(
            child: ListView(
              children: <Widget>[
                Divider(
                  height: 0.1,
                ),
                Container(
                  height: 30,
                  child: ListView.builder(
                    physics: ClampingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: _categoriesList.length,
                    itemBuilder: (context, i) {
                      return Container(
                        color: Colors.blueGrey[600],
                        height: 30,
                        padding: EdgeInsets.all(7),
                        child: Text(
                          _categoriesList[i].categories,
                          textAlign: TextAlign.left,
                          style: Theme.of(context)
                              .textTheme
                              .title
                              .copyWith(fontSize: 15, color: Colors.white),
                        ),
                      );
                    },
                  ),
                ),
                _buildShareIcon(),
                HomeSlider(),
                SizedBox(height: 20),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text("APPLE IPHONE XS MAX",
                          style: Theme.of(context)
                              .textTheme
                              .title
                              .copyWith(color: Colors.grey, fontSize: 14)),
                      SizedBox(height: 7),
                      Text("BHD 43.000",
                          style: Theme.of(context)
                              .textTheme
                              .title
                              .copyWith(color: Colors.pink, fontSize: 28)),
                      SizedBox(height: 1),
                      Text("Before: BHD 670.000",
                          style: Theme.of(context).textTheme.subhead.copyWith(
                              fontSize: 13,
                              letterSpacing: -1,
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.lineThrough)),
                      SizedBox(height: 5),
                      Text("Short Description:",
                          style: Theme.of(context).textTheme.subhead.copyWith(
                              color: Colors.pink,
                              fontSize: 13,
                              letterSpacing: -0.5)),
                      SizedBox(height: 3),
                      Container(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                              "Lorem ipsum dolor siamet ipsum dolor siamet ipsum dolor siamet ipsum dolor siamet ipsum dolor siamet ipsum dolor siamet ipsum dolor siamet ipsum dolor siamet ipsum dolor siamet ipsum dolor siamet ipsum dolor siamet ipsum dolor siamet ipsum dolor siamet.",
                              style: Theme.of(context)
                                  .textTheme
                                  .caption
                                  .copyWith(fontSize: 14))),
                      SizedBox(height: 15),
                      Container(
                        color: Colors.grey[300],
                        height: 3,
                      ),
                      SizedBox(height: 15),
                      Container(
                        child: Text(
                          "Pick your date & time",
                          style: Theme.of(context)
                              .textTheme
                              .title
                              .copyWith(fontSize: 16),
                        ),
                      ),
                      SizedBox(height: 15),
                      _buildSelectMonth(model),
                      SizedBox(height: 15),
                      _buildSelectDay(model),
                      SizedBox(height: 15),
                      _buildSelectTime(model),
                      SizedBox(height: 25),
                      Container(
                        child: Text(
                          "Your Booking Details",
                          style: Theme.of(context)
                              .textTheme
                              .title
                              .copyWith(fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: _buildBookingSum(model)),
                SizedBox(height: 30),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                  decoration: BoxDecoration(color: Colors.grey[300]),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      _buildTotalPrice(model),
                      SizedBox(height: 5),
                      _buildBookBtn(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildBookingSum(DateService model) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Booking Options",
          style: Theme.of(context).textTheme.title.copyWith(
              fontSize: 16,
              color: Colors.pink,
              decoration: TextDecoration.underline),
        ),
        SizedBox(height: 15),
        Text(
          "Tank Size",
          style: Theme.of(context).textTheme.title.copyWith(
                fontSize: 16,
                color: Colors.pink,
              ),
        ),
        Text(
          "2000 - 3000 (+BHD6.000)",
          style: Theme.of(context).textTheme.subtitle.copyWith(
                fontSize: 14,
              ),
        ),
        SizedBox(height: 15),
        Text(
          "Tank Santizing",
          style: Theme.of(context).textTheme.title.copyWith(
                fontSize: 16,
                color: Colors.pink,
              ),
        ),
        Text(
          "YES (+BHD6.000)",
          style: Theme.of(context).textTheme.subtitle.copyWith(
                fontSize: 14,
              ),
        ),
        SizedBox(height: 30),
        Text(
          "Booking Timing",
          style: Theme.of(context).textTheme.title.copyWith(
                fontSize: 16,
                color: Colors.pink,
              ),
        ),
        SizedBox(height: 12),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: model.timeList
              .where((time) => time.slots > 0)
              .toList()
              .map((time) {
            return model.timeList
                            .where((time) => time.slots > 0)
                            .toList()
                            .length ==
                        0 ||
                    model.timeList.where((time) => time.slots > 0).toList() ==
                        null
                ? Text("There are booking booking slots selected.",
                    style: Theme.of(context).textTheme.subtitle.copyWith(
                          fontSize: 14,
                        ))
                : Text(
                    "${time.timeStart} - ${time.timeEnd} (${time.slots}) slots",
                    style: Theme.of(context).textTheme.subtitle.copyWith(
                          fontSize: 14,
                        ),
                  );
          }).toList(),
        )

        // Text(
        //   "09:22 - 10:55 (2 slots)",
        //   style: Theme.of(context).textTheme.subtitle.copyWith(
        //         fontSize: 14,
        //       ),
        // ),
        // Text(
        //   "10:22 - 11:55 (1 slots)",
        //   style: Theme.of(context).textTheme.subtitle.copyWith(
        //         fontSize: 14,
        //       ),
        // ),
        // Text(
        //   "11:22 - 13:55 (4 slots)",
        //   style: Theme.of(context).textTheme.subtitle.copyWith(
        //         fontSize: 14,
        //       ),
        // ),
        // Text(
        //   "15:22 - 18:55 (1 slots)",
        //   style: Theme.of(context).textTheme.subtitle.copyWith(
        //         fontSize: 14,
        //       ),
        // ),
      ],
    );
  }

  Widget _buildSelectTime(DateService model) {
    var _timeList;
    if (_day == "Default") {
      _timeList = model.timeList
          .where((time) => time.day == "Default" && time.month == "Default")
          .toList();
    } else {
      _timeList = model.timeList
          .where((time) => time.day == _day && time.month == _month)
          .toList();
    }
    return Container(
        height: 100,
        child: ListView.builder(
          physics: ClampingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 40),
          scrollDirection: Axis.horizontal,
          itemCount: _timeList.length,
          itemBuilder: (context, i) {
            return GestureDetector(
                child: _timeList[i].isSelectedTime && _timeList[i].slots > 0
                    ? Column(
                        children: <Widget>[
                          Container(
                            height: 50,
                            margin: EdgeInsets.symmetric(horizontal: 3),
                            padding: EdgeInsets.symmetric(horizontal: 7),
                            decoration: BoxDecoration(
                                boxShadow: [
                                  new BoxShadow(
                                      color: Colors.grey[400],
                                      blurRadius: 3.0,
                                      offset: Offset(2.0, 2.0)),
                                ],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                color: Colors.grey,
                                border:
                                    Border.all(width: 2, color: Colors.grey)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  _timeList[i].timeStart,
                                  style: Theme.of(context)
                                      .textTheme
                                      .subhead
                                      .copyWith(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white),
                                ),
                                SizedBox(height: 2),
                                Text(_timeList[i].timeEnd,
                                    style: Theme.of(context)
                                        .textTheme
                                        .subhead
                                        .copyWith(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                        )),
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                GestureDetector(
                                  child: Container(
                                      color: Colors.grey[300],
                                      child: Icon(
                                        Icons.remove,
                                        size: 14,
                                      )),
                                  onTap: () {
                                    setState(() {
                                      _timeList[i].slots--;
                                    });
                                  },
                                ),
                                SizedBox(width: 16),
                                Text(
                                  _timeList[i].slots.toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                                SizedBox(width: 16),
                                GestureDetector(
                                  child: Container(
                                      color: Colors.grey[300],
                                      child: Icon(
                                        Icons.add,
                                        size: 14,
                                      )),
                                  onTap: () {
                                    setState(() {
                                      _timeList[i].slots++;
                                    });
                                  },
                                ),
                              ],
                            ),
                          )
                        ],
                      )
                    : _timeList[i].isFullSlot || !daySelected
                        ? Column(
                            children: <Widget>[
                              Container(
                                height: 50,
                                margin: EdgeInsets.symmetric(horizontal: 3),
                                padding: EdgeInsets.symmetric(horizontal: 7),
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      new BoxShadow(
                                          color: Colors.grey[200],
                                          blurRadius: 3.0,
                                          offset: Offset(2.0, 2.0)),
                                    ],
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    color: Colors.white24,
                                    border: Border.all(
                                        width: 2, color: Colors.grey)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      _timeList[i].timeStart,
                                      style: Theme.of(context)
                                          .textTheme
                                          .subhead
                                          .copyWith(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.grey[400]),
                                    ),
                                    SizedBox(height: 2),
                                    Text(_timeList[i].timeEnd,
                                        style: Theme.of(context)
                                            .textTheme
                                            .subhead
                                            .copyWith(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.grey[400])),
                                  ],
                                ),
                              )
                            ],
                          )
                        : Column(
                            children: <Widget>[
                              Container(
                                height: 50,
                                margin: EdgeInsets.symmetric(horizontal: 3),
                                padding: EdgeInsets.symmetric(horizontal: 7),
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      new BoxShadow(
                                          color: Colors.grey[400],
                                          blurRadius: 3.0,
                                          offset: Offset(2.0, 2.0)),
                                    ],
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    color: Colors.white,
                                    border: Border.all(
                                        width: 2, color: Colors.grey)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      _timeList[i].timeStart,
                                      style: Theme.of(context)
                                          .textTheme
                                          .subhead
                                          .copyWith(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black87),
                                    ),
                                    SizedBox(height: 2),
                                    Text(_timeList[i].timeEnd,
                                        style: Theme.of(context)
                                            .textTheme
                                            .subhead
                                            .copyWith(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black87)),
                                  ],
                                ),
                              )
                            ],
                          ),
                onTap: () {
                  if (daySelected && !_timeList[i].isFullSlot) {
                    setState(() {
                      if (_timeList[i].slots == 0) {
                        _timeList[i].slots = 1;
                      }
                      // _timeList.forEach(
                      //     (time) => time.isSelectedTime = false);
                      _timeList[i].isSelectedTime = true;
                    });
                  }
                });
          },
        ));
  }

  Widget _buildSelectDay(DateService model) {
    var _dayList = model.dayList.where((day) => day.month == _month).toList();
    return Container(
        height: 60,
        child: ListView.builder(
          physics: ClampingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 25),
          scrollDirection: Axis.horizontal,
          itemCount: _dayList.length,
          itemBuilder: (context, i) {
            return GestureDetector(
                child: _dayList[i].isSelectedDay && monthSelected
                    ? Container(
                        width: 70,
                        margin:
                            EdgeInsets.symmetric(horizontal: 3, vertical: 5),
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                            boxShadow: [
                              new BoxShadow(
                                  color: Colors.grey[400],
                                  blurRadius: 3.0,
                                  offset: Offset(2.0, 2.0)),
                            ],
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: Colors.grey,
                            border: Border.all(width: 2, color: Colors.grey)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              _dayList[i].day,
                              style: Theme.of(context).textTheme.title.copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            ),
                            Text(_dayList[i].dayNumber,
                                style: Theme.of(context)
                                    .textTheme
                                    .subhead
                                    .copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    )),
                          ],
                        ),
                      )
                    : !monthSelected
                        ? Container(
                            width: 70,
                            margin: EdgeInsets.symmetric(
                                horizontal: 3, vertical: 5),
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                                boxShadow: [
                                  new BoxShadow(
                                      color: Colors.grey[200],
                                      blurRadius: 3.0,
                                      offset: Offset(2.0, 2.0)),
                                ],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                color: Colors.white24,
                                border:
                                    Border.all(width: 2, color: Colors.grey)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  _dayList[i].day,
                                  style: Theme.of(context)
                                      .textTheme
                                      .title
                                      .copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.grey[400]),
                                ),
                                Text(_dayList[i].dayNumber,
                                    style: Theme.of(context)
                                        .textTheme
                                        .subhead
                                        .copyWith(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.grey[400])),
                              ],
                            ),
                          )
                        : Container(
                            width: 70,
                            margin: EdgeInsets.symmetric(
                                horizontal: 3, vertical: 5),
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                                boxShadow: [
                                  new BoxShadow(
                                      color: Colors.grey[400],
                                      blurRadius: 3.0,
                                      offset: Offset(2.0, 2.0)),
                                ],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                color: Colors.white,
                                border:
                                    Border.all(width: 2, color: Colors.grey)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  _dayList[i].day,
                                  style: Theme.of(context)
                                      .textTheme
                                      .title
                                      .copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700),
                                ),
                                Text(_dayList[i].dayNumber,
                                    style: Theme.of(context)
                                        .textTheme
                                        .subhead
                                        .copyWith(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black87)),
                              ],
                            ),
                          ),
                onTap: () {
                  if (monthSelected) {
                    setState(() {
                      _dayList.forEach((date) => date.isSelectedDay = false);
                      _dayList[i].isSelectedDay = true;
                      _day = _dayList[i].day;
                      daySelected = true;
                    });
                  }
                });
          },
        ));
  }

  Widget _buildSelectMonth(DateService model) {
    return Container(
        height: 60,
        child: ListView.builder(
          physics: ClampingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 10),
          scrollDirection: Axis.horizontal,
          itemCount: model.dateList.length,
          itemBuilder: (context, i) {
            return GestureDetector(
              child: model.dateList[i].isSelectedMonth
                  ? Container(
                      margin: EdgeInsets.symmetric(horizontal: 3, vertical: 5),
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                      decoration: BoxDecoration(
                          boxShadow: [
                            new BoxShadow(
                                color: Colors.grey[400],
                                blurRadius: 3.0,
                                offset: Offset(2.0, 2.0)),
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Colors.grey,
                          border: Border.all(width: 2, color: Colors.grey)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            model.dateList[i].month,
                            style: Theme.of(context).textTheme.title.copyWith(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          ),
                          Text("2019",
                              style:
                                  Theme.of(context).textTheme.subhead.copyWith(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      )),
                        ],
                      ),
                    )
                  : Container(
                      margin: EdgeInsets.symmetric(horizontal: 3, vertical: 5),
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                      decoration: BoxDecoration(
                          boxShadow: [
                            new BoxShadow(
                                color: Colors.grey[400],
                                blurRadius: 3.0,
                                offset: Offset(2.0, 2.0)),
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Colors.white,
                          border: Border.all(width: 2, color: Colors.grey)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            model.dateList[i].month,
                            style: Theme.of(context).textTheme.title.copyWith(
                                fontSize: 16, fontWeight: FontWeight.w700),
                          ),
                          Text("2019",
                              style: Theme.of(context)
                                  .textTheme
                                  .subhead
                                  .copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black87)),
                        ],
                      ),
                    ),
              onTap: () => {
                    setState(() {
                      model.dateList
                          .forEach((month) => month.isSelectedMonth = false);
                      model.dateList[i].isSelectedMonth = true;
                      _month = model.dateList[i].month;
                      monthSelected = true;
                      daySelected = false;
                      model.dayList.forEach((day) => day.isSelectedDay = false);
                      _day = "Default";
                    })
                  },
            );
          },
        ));
  }

  Widget _buildShareIcon() {
    return Container(
      alignment: Alignment.centerRight,
      child: IconButton(
        icon: Icon(Icons.share),
        onPressed: () {
          final RenderBox box = context.findRenderObject();
          Share.share(
              "Hello, I found APPLE IPHONE XS MAX smartphone and other best items in Ec-Commerce application." +
                  '\n'
                  "Get the application in the link below:" +
                  '\n'
                  "https://play.google.com/store/apps/details?id=com.example.ec_commerce&hl=en",
              sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
        },
        color: Colors.blueGrey[600],
      ),
    );
  }

  Widget _buildBookBtn() {
    return Container(
      height: 45,
      width: MediaQuery.of(context).size.width,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(3))),
        onPressed: () {},
        color: Colors.pink,
        child: Text(
          "BOOK NOW",
          style: Theme.of(context).textTheme.button.copyWith(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildTotalPrice(DateService model) {
    var slots = model.timeList != null && model.timeList.length != 0 ?
        model.timeList.map((time) => time.slots).reduce((a, b) => a + b) : 0;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 5),
          child: Text(
            "Total",
            style: Theme.of(context)
                .textTheme
                .title
                .copyWith(fontSize: 24, color: Colors.grey[600]),
          ),
        ),
        Container(
          padding: EdgeInsets.only(right: 5),
          child: Text(
            "BHD ${43000 * slots}",
            style: Theme.of(context).textTheme.title.copyWith(
                  fontSize: 22,
                ),
          ),
        )
      ],
    );
  }

  int _increment(int value) {
    setState(() {
      value++;
      print(value);
    });
    return value;
  }

  int _decrement(int value) {
    setState(() {
      value--;
    });
    return value;
  }
}
