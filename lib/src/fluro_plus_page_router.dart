import 'package:flutter/material.dart';

import 'fluro_plus_bundle.dart';

typedef Widget WidgetFunc(Bundle bundle);

class FluroPlusPageRouter {
  final String path;
  final WidgetFunc widgetFunc;

  FluroPlusPageRouter({@required this.path, @required this.widgetFunc});
}
