import 'package:fluro_plus/src/fluro_plus_bundle.dart';
import 'package:fluro_plus/src/fluro_plus_page_router.dart';
import 'package:fluro_plus/src/fluro_plus_page_routers.dart';

import 'page/home_page.dart';
import 'page/new_one_page.dart';
import 'page/new_two_page.dart';

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
          }),
      FluroPlusPageRouter(
          path: two_page,
          widgetFunc: (Bundle bundle) {
            return NewTwoPage();
          })
    ];
  }
}
