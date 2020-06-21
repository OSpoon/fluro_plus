import 'package:fluro_plus/fluro_plus.dart';
import 'package:flutter/material.dart';

import 'page/home_page.dart';
import 'routers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp() {
    FluroPlusApp.setupRoutes(Routers());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: FluroPlusApp.router.generator,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}
