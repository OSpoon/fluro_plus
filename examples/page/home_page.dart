import 'package:fluro/fluro.dart';
import 'package:fluro_plus/src/fluro_plus_bundle.dart';
import 'package:fluro_plus/src/fluro_plus_navigate.dart';
import 'package:flutter/material.dart';

import '../routers.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String name = "掌心!+!-!";
  String yname = "zhangxin";
  bool sex = true;
  int age = 18;
  double height = 172.12;
  String desc = '山西，简称“晋”，中华人民共和国省级行政区';
  List<String> language = [Uri.encodeComponent('java+-'), 'js', 'vue', 'android'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FluroPlus演示"),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              RaisedButton(
                  child: Text('简单跳转'),
                  onPressed: () {
                    FluroPlusNavigate.goto(context, Routers.one_page);
                  }),
              RaisedButton(
                  child: Text('简单跳转+转场动画'),
                  onPressed: () {
                    FluroPlusNavigate.goto(context, Routers.one_page,
                        transitionType: TransitionType.inFromBottom);
                  }),
              RaisedButton(
                  child: Text('简单跳转+跳转后销毁当前页面'),
                  onPressed: () {
                    FluroPlusNavigate.goto(context, Routers.one_page,
                        replace: true);
                  }),
              RaisedButton(
                  child: Text('简单跳转+携带参数'),
                  onPressed: () {
                    Bundle bundle = Bundle()
                      ..putString('name', name, isComponent: true)
                      ..putString('yname', yname)
                      ..putString('desc', desc, isComponent: true)
                      ..putBool('sex', sex)
                      ..putInt('age', age)
                      ..putList('language', language)
                      ..putDouble('height', height);
                    FluroPlusNavigate.goto(context, Routers.one_page,
                        bundle: bundle);
                  }),
              RaisedButton(
                  child: Text('简单跳转+携带参数+接收返回结果'),
                  onPressed: () {
                    Bundle bundle = Bundle()
                      ..putString('name', name, isComponent: true)
                      ..putString('yname', yname);
                    FluroPlusNavigate.gotoWithResult(context, Routers.one_page,
                        bundle: bundle, function: (result) {
                      print('result ::: ${result}');
                    });
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
