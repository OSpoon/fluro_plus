### Fluro_Plus项目简介

> Fluro_Plus对Fluro的传参进行来包装，通过传递和接收Bundle来方便使用，目前只是在初学阶段，欢迎指点

#### 使用说明

##### 引入依赖
```dart
fluro_plus:
    git: https://github.com/OSpoon/fluro_plus.git
```

##### 构建项目路由

```dart
/// 继承FluroPlusPageRouters
/// 重写generatorRoutes方法
/// 使用FluroPlusPageRouter对象来进行定义
/// 使用Bundle进行页面间数据传输
/// 解释：内部仍沿用Fluro的传参数方式，
///      所有fluro传参的限制还是会存在，
///      中文编码已在Bundle中的putString增加开关
class Routers extends FluroPlusPageRouters {
  static String home = "/home";
  static String one_page = "/one_page";
  static String two_page = "/two_page";

  @override
  List<FluroPlusPageRouter> generatorRoutes() {
    return [
      FluroPlusPageRouter(
          path: home,
          widgetFunc: (Bundle bundle) {
            return HomePage();
          }),
      FluroPlusPageRouter(
          path: one_page,
          widgetFunc: (Bundle bundle) {
            return NewOnePage(
              bundle: bundle,
            );
          })
    ];
  }
}
```

##### 初始化路由

```dart
MyApp() {
  FluroPlusApp.setupRoutes(Routers());
}

MaterialApp(
  onGenerateRoute: FluroPlusApp.router.generator,
);
```

##### 页面接收

```dart
class NewOnePage extends StatefulWidget {

  /// 通过Bundle传参
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
            ],
          ),
        ),
      ),
    );
  }
}
```

##### API使用

```
/// 简单跳转
RaisedButton(
  child: Text('简单跳转'),
  onPressed: () {
    FluroPlusNavigate.goto(context, Routers.one_page);
  }),

/// 简单跳转+转场动画
RaisedButton(
  child: Text('简单跳转+转场动画'),
  onPressed: () {
    FluroPlusNavigate.goto(context, Routers.one_page,
        transitionType: TransitionType.inFromBottom);
  }),

/// 简单跳转+跳转后销毁当前页面
RaisedButton(
  child: Text('简单跳转+跳转后销毁当前页面'),
  onPressed: () {
    FluroPlusNavigate.goto(context, Routers.one_page,
        replace: true);
  }),

/// 简单跳转+携带参数
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

/// 简单跳转+携带参数+接收返回结果
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
```

[Fluro_Plus源码地址](https://github.com/OSpoon/fluro_plus)，部分代码来自网络搜索来的案例，并注释了来源，如有未标明了请联系我一下。