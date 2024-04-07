import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_19/core/constans/routesString.dart';
import 'package:flutter_application_19/core/servecies/servecies.dart';

class MyMiddleWhere extends GetMiddleware {
  MyServecies myServecies = Get.find();
  @override
  int? get priority => 1;
  @override
  RouteSettings? redirect(String? route) {
    if (MyServecies.sharedPreferences.getString("step") == "1") {
      return RouteSettings(name: AppRoutes.logIn);
    } else {
      if (MyServecies.sharedPreferences.getString("step") == "2") {
        return const RouteSettings(name: "/homeSecreen");
      }
      return null;
    }
  }
}
