import 'package:scoped_model/scoped_model.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'dart:async';

import '../models/date.dart';

class DateService extends Model {
  List<NewDate> _dateList = [];
  List<NewDate> get dateList => _dateList;

  List<DayAvailable> _dayList = [];
  List<DayAvailable> get dayList => _dayList;

  List<TimeAvailable> _timeList = [];
  List<TimeAvailable> get timeList => _timeList;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<String> _loadDateAsset() async {
    return await rootBundle.loadString('assets/date.json');
  }

  Future<List<NewDate>> loadDate() async {
    _isLoading = true;
    notifyListeners();

    String jsonDate = await _loadDateAsset();
    final jsonResponse = json.decode(jsonDate);
    for (var json in jsonResponse) {
      print(json);

      for (var jsonDay in json['dayAvailable']) {
        print(jsonDay);

        var day = DayAvailable.fromJson(jsonDay);
        _dayList.add(day);
      }

      for (var jsonTime in json['timeAvailable']) {
        print(jsonTime);

        var time = TimeAvailable.fromJson(jsonTime);
        _timeList.add(time);
      }

      var date = new NewDate(
        id: json['id'],
        month: json['month'],
        isSelectedMonth: false,
        // isSelectedDay: false,
        // isSelectedTime: false,
      );

      _dateList.add(date);

      _isLoading = false;
      notifyListeners();
    }

    return _dateList;
  }
}
