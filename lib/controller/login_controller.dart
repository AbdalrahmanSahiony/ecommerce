import 'package:delivery/connection_state.dart';
import 'package:delivery/core/function/handling_data.dart';
import 'package:delivery/core/serviece.dart';
import 'package:delivery/data/login_data.dart';
import 'package:delivery/view/secreen/home_secreen.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isHide = true;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  ConectionState stateRequest = ConectionState.none;
  GlobalKey<FormState> formState = GlobalKey();
  LoginData loginData = LoginData(Get.find());
  hidePassword() {
    isHide = !isHide;
    update();
  }

  login() async {
    stateRequest = ConectionState.loading;
    update();
    var response = await loginData.loginData(
        emailController.text, passwordController.text);
    stateRequest = handlingData(response);
    if (response["status"] == "succes") {
      MyServecies.sharedPreferences
          .setString("id", response["data"]['delivery_id'].toString());
      MyServecies.sharedPreferences
          .setString("email", response["data"]['delivery_email'].toString());
      MyServecies.sharedPreferences.setString(
          "password", response["data"]['delivery_password'].toString());
      MyServecies.sharedPreferences
          .setString("phone", response["data"]['delivery_phone'].toString());
      FirebaseMessaging.instance.subscribeToTopic("delivery");
      String id = MyServecies.sharedPreferences.getString("id")!;
      FirebaseMessaging.instance.subscribeToTopic("delivery$id");
      MyServecies.sharedPreferences.setString("step", "1");

      Get.offAll(() => const HomeSecreen());
    } else {
      Get.defaultDialog(
          title: "Warning", middleText: "The Email Or Passwprd is un correct");
      update();
    }
  }

  bool validetor() {
    var formdat = formState.currentState;
    if (formdat!.validate()) {
      return true;
    } else {
      return false;
    }
  }

  bool valditor() {
    var formdat = formstate.currentState;
    if (formdat!.validate()) {
      return true;
    } else {
      return false;
    }
  }
}
