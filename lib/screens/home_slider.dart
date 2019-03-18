import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeSlider extends StatefulWidget {
  @override
  _HomeSliderState createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {

  @override
  void initState() {
    super.initState();
  }

  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      CarouselSlider(
        items: imgList.map((img) {
          return Container(
              child: Stack(
            children: <Widget>[
              Image.asset(
                img,
                fit: BoxFit.cover,
                height: 280,
              )
              // Positioned(
              //     bottom: 0.0,
              //     left: 0.0,
              //     right: 0.0,
              //     child: Container(
              //       decoration: BoxDecoration(
              //           gradient: LinearGradient(
              //         colors: [
              //           Color.fromARGB(200, 0, 0, 0),
              //           Color.fromARGB(0, 0, 0, 0)
              //         ],
              //         begin: Alignment.bottomCenter,
              //         end: Alignment.topCenter,
              //       )),
              //     )),
            ],
          ));
        }).toList(),
        autoPlay: true,
        viewportFraction: 1.0,
        enlargeCenterPage: false,
        aspectRatio: 2.0,
        height: 290,
        onPageChanged: (index) {
          setState(() {
            _current = index;
          });
        },
      ),
      Positioned(
          bottom: 0.0,
          left: 0.0,
          right: 0.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: map<Widget>(imgList, (index, url) {
              return Container(
                width: 8.0,
                height: 8.0,
                margin: EdgeInsets.symmetric(horizontal: 2.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _current == index ? Colors.blueGrey[600] : Colors.grey),
              );
            }),
          ))
    ]);
  }
}

final List<String> imgList = [
  'assets/images/ingredients.png',
  'assets/images/milk.png',
  'assets/images/snack.png',
  'assets/images/vegetable.png',
];

List<T> map<T>(List list, Function handler) {
  List<T> result = [];
  for (var i = 0; i < list.length; i++) {
    result.add(handler(i, list[i]));
  }

  return result;
}
