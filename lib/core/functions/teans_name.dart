import 'package:get/get.dart';
import 'package:flutter_application_19/core/servecies/servecies.dart';

MyServecies myServecies = Get.find();
transName(columnar, columnen) {
  if (MyServecies.sharedPreferences.getString("lang") == "ar") {
    return columnar;
  } else {
    return columnen;
  }
}
