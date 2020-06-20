import 'dart:convert';

import 'package:flutter/material.dart';

///
/// Bundle
///
/// https://juejin.im/post/5d7b67fe5188250a9858293a#heading-4
///

class Bundle {
  Map<String, dynamic> _map = {};

  _setValue(var k, var v) => _map[k] = v;

  _getValue(String k) {
    if (_map == null || !_map.containsKey(k)) {
      debugPrint('你是用$k在payload不存在，请检查你的key名字是否正确，或者确定key是否存在payload');
      return null;
    }
    return _map[k];
  }

  putInt(String k, int v) => _map[k] = v;

  putDouble(String k, double v) => _map[k] = v;

  putString(String k, String v, {bool isComponent = false}) {
    if (isComponent) {
      _setValue(k, Uri.encodeComponent(v));
    } else {
      _setValue(k, v);
    }
  }

  putBool(String k, bool v) => _setValue(k, v);

  putList<V>(String k, List<V> v) => _setValue(k, v);

  putMap<K, V>(String k, Map<K, V> v) => _setValue(k, v);

  int getInt(String k) => _getValue(k) as int;

  double getDouble(String k) => _getValue(k) as double;

  String getString(String k) => _getValue(k) as String;

  bool getBool(String k) => _getValue(k) as bool;

  List getList(String k) => _getValue(k) as List;

  Map getMap(String k) => _getValue(k) as Map;

  @override
  String toString() {
    return _map.toString();
  }

  String toJson() {
    return json.encode(_map);
  }

  void setMap(Map<String, dynamic> value) {
    _map = value;
  }

  static Bundle convert(Map<String, List<String>> params) {
    Bundle bundle;
    if (params != null && params.containsKey('arguments')) {
      bundle = Bundle()..setMap(json.decode(params['arguments']?.first));
    }
    return bundle;
  }
}
