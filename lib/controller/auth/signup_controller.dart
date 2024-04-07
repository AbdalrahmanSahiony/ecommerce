import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_19/conection_state.dart';
import 'package:flutter_application_19/core/constans/routesString.dart';
import 'package:flutter_application_19/core/functions/handling_data.dart';
import 'package:flutter_application_19/data/data_source/remote/signup_data.dart';
import 'package:flutter_application_19/view/secreens/auth/verfiycode_signup.dart';

abstract class SignUpController extends GetxController {
  signup();
  goToLogIn();
  validit();
  showAndHidePassword();
}

class SignUpControllerIm extends SignUpController {
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController userName;
  late TextEditingController phoneNumber;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  bool isHide = true;
  @override
  goToLogIn() {
    Get.toNamed(AppRoutes.logIn);
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    userName = TextEditingController();
    phoneNumber = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    userName.dispose();
    phoneNumber.dispose();
    // FirebaseMessaging.instance.getToken().then((value) => print(value));
    super.dispose();
  }

  ConectionState stateRequest = ConectionState.none;
  SignupData signupData = SignupData(Get.find());
  @override
  signup() async {
    stateRequest = ConectionState.loading;
    update();
    var response = await signupData.getData(userName.text.trim(),
        email.text.trim(), password.text.trim(), phoneNumber.text.trim());
    stateRequest = handlingData(response);
    if (stateRequest == ConectionState.succes) {
      if (response["status"] == "succes") {
        Get.to(() => const VerfieyCodeSignup(), arguments: {
          "email": email.text,
        });
      } else {
        Get.defaultDialog(
            title: "Warning",
            middleText: "The Email Or Phone Numer Is Alrady Exisit");
        stateRequest = ConectionState.failure;
        update();
      }
    }
  }

  @override
  bool validit() {
    var formdat = formState.currentState;
    if (formdat!.validate()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  showAndHidePassword() {
    isHide = !isHide;
    update();
  }
}
