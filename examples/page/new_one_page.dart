import 'package:fluro_plus/fluro_plus.dart';
import 'package:flutter/material.dart';

import '../routers.dart';

class NewOnePage extends StatefulWidget {
  final Bundle bundle;

  const NewOnePage({Key key, this.bundle}) : super(key: key);

  @override
  _NewOnePageState createState() => _NewOnePageState();
}

class _NewOnePageState extends State<NewOnePage> {
  @override
  Widget build(BuildContext context) {
    print('bundle  >>>>::: ${widget.bundle.runtimeType}');
    return Scaffold(
      appBar: AppBar(
        title: Text("演示NewOnePage页"),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Text('name ${widget.bundle.getString('name')}'),
              Text('yname ${widget.bundle.getString('yname')}'),
              Text('desc ${widget.bundle.getString('desc')}'),
              Text('age ${widget.bundle.getInt('age')}'),
              Text('sex ${widget.bundle.getBool('sex')}'),
              Text('language ${widget.bundle.getList('language')?.first}'),
              Text('height ${widget.bundle.getDouble('height')}'),
              RaisedButton(
                  child: Text('简单跳转'),
                  onPressed: () {
                    FluroPlusNavigate.goto(context, Routers.two_page);
                  }),
              RaisedButton(
                  child: Text('简单跳转+跳转后销毁栈内其他所有页面'),
                  onPressed: () {
                    FluroPlusNavigate.goto(context, Routers.two_page,
                        clearStack: true);
                  }),
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
