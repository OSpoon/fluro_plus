import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import 'fluro_plus_application.dart';
import 'fluro_plus_bundle.dart';

/// fluro的路由跳转工具类
///
/// 参考：https://www.jianshu.com/p/1987cc9b714a
///
class FluroPlusNavigate {
  /// 跳转新的页面
  static goto(
    BuildContext context,
    String path, {
    Bundle bundle,
    bool replace = false,
    bool clearStack = false,
    TransitionType transitionType = TransitionType.fadeIn,
  }) {
    debugPrint('go to path ::: $path?arguments=${bundle?.toJson()}');
    FocusScope.of(context).requestFocus(new FocusNode());
    FluroPlusApp.router.navigateTo(
        context, '$path?arguments=${bundle?.toJson()}',
        replace: replace, clearStack: clearStack, transition: transitionType);
  }

  /// 跳转新的页面并接收返回结果
  static gotoWithResult(
    BuildContext context,
    String path, {
    @required Function(dynamic) function,
    Bundle bundle,
    bool replace = false,
    bool clearStack = false,
    TransitionType transitionType = TransitionType.fadeIn,
  }) {
    debugPrint('go to path ::: $path?arguments=${bundle?.toJson()}');
    FocusScope.of(context).requestFocus(new FocusNode());
    FluroPlusApp.router
        .navigateTo(context, '$path?arguments=${bundle?.toJson()}',
            replace: replace,
            clearStack: clearStack,
            transition: transitionType)
        .then((result) {
      // 页面返回result为null
      if (result == null) {
        return;
      }
      function(result);
    }).catchError((error) {
      print("$error");
    });
  }

  /// 回退上一页面
  static bool goBack(
    BuildContext context,
  ) {
    FocusScope.of(context).requestFocus(new FocusNode());
    bool canPop = Navigator.canPop(context);
    if (canPop) {
      Navigator.pop(context);
    }
    return canPop;
  }

  /// 回退上一页面并携带参数
  static bool goBackWithParams(
    BuildContext context,
    result,
  ) {
    FocusScope.of(context).requestFocus(new FocusNode());
    bool canPop = Navigator.canPop(context);
    if (canPop) {
      Navigator.pop(context, result);
    }
    return canPop;
  }
}
