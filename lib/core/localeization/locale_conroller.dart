import 'package:flutter/material.dart';
import 'package:flutter_application_19/core/functions/fcm.dart';
import 'package:get/get.dart';
import 'package:flutter_application_19/core/servecies/servecies.dart';
import 'package:flutter_application_19/core/constans/theme.dart';

class LocalleController extends GetxController {
  Locale? language;
  ThemeData theme = themeEnglish;
  MyServecies controlle = Get.find();

  changeLanguage(String langCode) {
    Locale locale = Locale(langCode);
    MyServecies.sharedPreferences.setString("lang", langCode);
    theme = langCode == "ar" ? themeArabic : themeEnglish;
    Get.changeTheme(theme);
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    String? prefs = MyServecies.sharedPreferences.getString("lang");
    if (prefs == "ar") {
      language = const Locale("ar");
      theme = themeArabic;
    } else if (prefs == "en") {
      language = const Locale("en");
      theme = themeEnglish;
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
      theme = themeEnglish;
    }
    requestPermissionNotfication();
    fcmConfig();
    super.onInit();
  }
}
