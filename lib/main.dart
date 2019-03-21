import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import './home.dart';
import './services/date_service.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DateService model = DateService();

    return ScopedModel(
      model: model,
      child: MaterialApp(
        title: 'EC Commerce',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Home(model),
      ),
    );
  }
}
