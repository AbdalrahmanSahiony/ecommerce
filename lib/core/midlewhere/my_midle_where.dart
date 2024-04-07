import 'package:delivery/core/app_routes_string.dart';
import 'package:delivery/core/serviece.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyMiddleWhere extends GetMiddleware {
  @override
  int? get priority => 1;
  @override
  RouteSettings? redirect(String? route) {
    if (MyServecies.sharedPreferences.getString("step") == "1") {
      return const RouteSettings(name: AppRoutesString.home);
    }
    return null;
  }
}
