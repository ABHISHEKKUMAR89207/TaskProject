import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task1/ApiService.dart';
import 'package:task1/BottomNavigator.dart';
import 'package:task1/HomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(
        create: (context) => CarrouselProvider('apiurl'),
        child: HomePage(),
      ),
    );
  }
}
