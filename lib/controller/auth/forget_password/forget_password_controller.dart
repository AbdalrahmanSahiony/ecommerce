import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter_application_19/conection_state.dart';
import 'package:flutter_application_19/core/functions/handling_data.dart';
import 'package:flutter_application_19/data/data_source/remote/forget_password/check_email_data.dart';
import 'package:flutter_application_19/view/secreens/auth/forget_password/verfiy_code.dart';

abstract class ForgetPasswordController extends GetxController {
  validit();
  checkEmail();
}

class ForgetPasswordControllerIm extends ForgetPasswordController {
  late TextEditingController email;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  ConectionState stateRequest = ConectionState.none;
  CheckEmailData checkEmailData = CheckEmailData(Get.find());

  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
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
  checkEmail() async {
    stateRequest = ConectionState.loading;
    update();
    var response = await checkEmailData.checkEmail(email.text);
    stateRequest = handlingData(response);
    if (stateRequest == ConectionState.succes) {
      if (response["status"] == "succes") {
        Get.to(() => const VerfieyCode(), arguments: {
          "email": email.text,
        });
      }
    } else {
      Get.defaultDialog(
          title: "Warning", middleText: "The Email Or Not Exisit");
      stateRequest = ConectionState.failure;
    }
  }
}
