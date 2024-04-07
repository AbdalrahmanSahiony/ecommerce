import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_19/conection_state.dart';
import 'package:flutter_application_19/core/constans/routesString.dart';
import 'package:flutter_application_19/core/functions/handling_data.dart';
import 'package:flutter_application_19/core/servecies/servecies.dart';
import 'package:flutter_application_19/data/data_source/remote/login_data.dart';

abstract class SignInController extends GetxController {
  logIn();
  goToForgetPassword();
  goToLogin();
  showAndHidePassword();
  valditor();
}

class SignInControllerIm extends SignInController {
  late TextEditingController email;
  late TextEditingController password;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  bool isHide = true;
  ConectionState stateRequest = ConectionState.none;
  LoginData loginData = LoginData(Get.find());
  MyServecies myServecies = Get.find();
  @override
  logIn() async {
    stateRequest = ConectionState.loading;
    update();
    var response = await loginData.loginData(email.text, password.text);
    stateRequest = handlingData(response);
    if (stateRequest == ConectionState.succes) {
      if (response["status"] == "succes") {
        MyServecies.sharedPreferences
            .setString("id", response["data"]["user_id"].toString());
        String? userId = MyServecies.sharedPreferences.getString("id");
        MyServecies.sharedPreferences
            .setString("name", response["data"]["user_name"].toString());
        MyServecies.sharedPreferences
            .setString("email", response["data"]["user_email"].toString());
        MyServecies.sharedPreferences
            .setString("phone", response["data"]["user_phone"].toString());
        MyServecies.sharedPreferences.setString("step", "2");
        FirebaseMessaging.instance.subscribeToTopic("user");
        FirebaseMessaging.instance.subscribeToTopic("user$userId");
        Get.offAllNamed("/homeSecreen");
      } else {
        Get.defaultDialog(
            title: "Warning",
            middleText: "The Email Or Passwprd is un correct");
        stateRequest = ConectionState.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoutes.forgetPassword);
  }

  @override
  goToLogin() {
    Get.toNamed(AppRoutes.logIn);
  }

  @override
  showAndHidePassword() {
    isHide = !isHide;
    update();
  }

  @override
  bool valditor() {
    var formdat = formstate.currentState;
    if (formdat!.validate()) {
      return true;
    } else {
      return false;
    }
  }
}
