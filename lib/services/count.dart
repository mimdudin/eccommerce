import 'package:scoped_model/scoped_model.dart';

import '../models/date.dart';

class Count extends Model {
  Date _date = Date();
  Date get date => _date;

  void increment(){
    _date.count++;
    notifyListeners();
  }

   void decrement(){
    _date.count--;
    notifyListeners();
  }
}