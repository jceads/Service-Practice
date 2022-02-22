import 'package:flutter/material.dart';
import 'package:json_placeholder_test/core/constants/string_const.dart';
import 'package:json_placeholder_test/views/home_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      title: 'Json Test',
      home: HomeView(),
    );
  }
}
