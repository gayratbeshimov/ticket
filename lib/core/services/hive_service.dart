

import 'dart:core';
import 'dart:async';
import 'dart:ui';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';

class HiveService {
  static HiveService get to => Modular.get<HiveService>();

  late Box _box;

  static  init() async {
    var instance = HiveService();

    instance._box = await Hive.openBox('ticket');

    return instance;
  }

  FutureOr delete() async {
    await Hive.deleteFromDisk();
  }

  String getLang() {
    return _box.get(_HiveKeys.lang, defaultValue: "uz_UZ");
  }

  void setLang(Locale locale) {
    _box.put(_HiveKeys.lang, locale.toString());
  }

  void setDbName(String name) {
    _box.put(_HiveKeys.dbName, name);
  }

  String getDbName() {
    return _box.get(_HiveKeys.dbName);
  }

  void setCurrentUserId(String id) {
    _box.put(_HiveKeys.userId, id);
  }

  String getCurrentUserId() {
    return _box.get(_HiveKeys.userId, defaultValue: '');
  }

  void setIsLoggedIn(bool value) {
    _box.put(_HiveKeys.isLoggedIn, value);
  }

  bool getIsLoggedIn() {
    return _box.get(_HiveKeys.isLoggedIn, defaultValue: false);
  }
}

class _HiveKeys {
  static const String lang = "lang";
  static const String dbName = "dbName";
  static const String userId = "userId";
  static const String isLoggedIn = "isLoggedIn";
}
