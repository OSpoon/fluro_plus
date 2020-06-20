import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import 'fluro_plus_bundle.dart';
import 'fluro_plus_page_router.dart';
import 'fluro_plus_page_routers.dart';
///
/// FluroPlusApp
///
/// 参考：https://juejin.im/post/5d7b67fe5188250a9858293a#heading-4
///
class FluroPlusApp {
  static final router = Router();

  static setupRoutes(FluroPlusPageRouters routers) {
    /// 未知路由显示
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print("ROUTE WAS NOT FOUND !!!");
      return Scaffold(
        body: Center(
          child: Text("ROUTE WAS NOT FOUND !!!"),
        ),
      );
    });

    /// 显示配置路由
    routers
        .generatorRoutes()
        .forEach((FluroPlusPageRouter fluroPlusPageRouter) {
      Handler handler = Handler(handlerFunc:
          (BuildContext context, Map<String, List<String>> params) {
        return fluroPlusPageRouter.widgetFunc(Bundle.convert(params));
      });
      router.define(fluroPlusPageRouter.path, handler: handler);
    });
  }
}
