import 'package:fluro_plus/fluro_plus.dart';
import 'package:flutter/material.dart';

class NewTwoPage extends StatefulWidget {
  @override
  _NewTwoPageState createState() => _NewTwoPageState();
}

class _NewTwoPageState extends State<NewTwoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("演示NewTwoPage页"),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              RaisedButton(
                  child: Text('返回上一页面'),
                  onPressed: () {
                    bool popSuccess = FluroPlusNavigate.goBack(context);
                    if (!popSuccess) {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text('温馨提示'),
                              content: Container(
                                width: MediaQuery.of(context).size.width * 0.9,
                                height:
                                MediaQuery.of(context).size.height * 0.08,
                                child: Center(
                                  child: Text('pop 失败，栈内哪还有页面让你推啊'),
                                ),
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              actions: <Widget>[
                                FlatButton(
                                    child: Text('确认'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    }),
                              ],
                            );
                          });
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
