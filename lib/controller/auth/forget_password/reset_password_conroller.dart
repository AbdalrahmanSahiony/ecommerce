import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter_application_19/conection_state.dart';
import 'package:flutter_application_19/core/functions/handling_data.dart';
import 'package:flutter_application_19/data/data_source/remote/forget_password/reset_password_dat.dart';
import 'package:flutter_application_19/view/secreens/auth/forget_password/succes_reset_password.dart';

abstract class ResetPasswordController extends GetxController {
  validit();
  resetPassword();
}

class ResetPasswordControllerIm extends ResetPasswordController {
  late TextEditingController password;
  late TextEditingController rePassword;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  ConectionState stateRequest = ConectionState.none;
  ResetPasswordData resetPasswordData = ResetPasswordData(Get.find());
  String? email;
  @override
  void onInit() {
    password = TextEditingController();
    rePassword = TextEditingController();
    email = Get.arguments["email"];
    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    rePassword.dispose();
    super.dispose();
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
  resetPassword() async {
    if (password.text == rePassword.text) {
      stateRequest = ConectionState.loading;
      update();

      var response =
          await resetPasswordData.resetPasswordData(email!, password.text);
      stateRequest = handlingData(response);
      if (stateRequest == ConectionState.succes) {
        if (response["status"] == "succes") {
          Get.to(() => const SuccesResetPassword());
        }
      } else {
        Get.defaultDialog(title: "Warning", middleText: "Try Again");
        stateRequest = ConectionState.failure;
      }
    } else {
      return Get.defaultDialog(
          title: "Warning", middleText: "password dont match");
    }
  }
}
