import 'package:get/get.dart';
import 'package:flutter_application_19/conection_state.dart';
import 'package:flutter_application_19/controller/auth/signin_conroller.dart';
import 'package:flutter_application_19/core/constans/routesString.dart';
import 'package:flutter_application_19/core/functions/handling_data.dart';
import 'package:flutter_application_19/data/data_source/remote/verfieycode_signup_data.dart';

abstract class VerfieyCodeSignupController extends GetxController {
  goToSuccesSignup(String veryfieycode);
  checkCode();
}

class VerfieyCodeSignupControllerIm extends VerfieyCodeSignupController {
  VerfieycodeSignupData verfieycodeSignupData =
      VerfieycodeSignupData(Get.find());
  SignInControllerIm controllerIm = Get.put(SignInControllerIm());
  ConectionState stateRequest = ConectionState.none;
  String? email;
  @override
  goToSuccesSignup(String veryfieycode) async {
    stateRequest = ConectionState.loading;
    update();
    var response = await verfieycodeSignupData.getData(email!, veryfieycode);
    stateRequest = handlingData(response);
    if (stateRequest == ConectionState.succes) {
      if (response["status"] == "succes") {
        Get.toNamed(AppRoutes.succsesSignup);
        controllerIm.email.clear();
      } else {
        Get.defaultDialog(title: "Warning", middleText: response["massege"]);
        stateRequest = ConectionState.failure;
      }
    }
  }

  resend() {
    verfieycodeSignupData.resendCode(email!);
  }

  @override
  checkCode() {}
  @override
  void onInit() {
    email = Get.arguments["email"];
    super.onInit();
  }
}
