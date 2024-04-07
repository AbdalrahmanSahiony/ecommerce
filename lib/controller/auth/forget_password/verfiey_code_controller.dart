import 'package:get/get.dart';
import 'package:flutter_application_19/conection_state.dart';
import 'package:flutter_application_19/core/constans/routesString.dart';
import 'package:flutter_application_19/core/functions/handling_data.dart';
import 'package:flutter_application_19/data/data_source/remote/forget_password/veryfieycode_data.dart';

abstract class VerfieyCodeController extends GetxController {
  goToResetPasword();
  checkCode(String vCode);
}

class VerfieyCodeControllerIm extends VerfieyCodeController {
  String? email;
  VryfieyCodeForgetPassword vryfieyCodeForgetPassword =
      VryfieyCodeForgetPassword(Get.find());
  ConectionState stateRequest = ConectionState.none;
  @override
  goToResetPasword() {}

  @override
  checkCode(vCode) async {
    stateRequest = ConectionState.loading;
    update();
    var response = await vryfieyCodeForgetPassword.codeData(email!, vCode);
    stateRequest = handlingData(response);
    if (stateRequest == ConectionState.succes) {
      if (response["status"] == "succes") {
        Get.toNamed(AppRoutes.resetPassword, arguments: {"email": email!});
      }
    } else {
      Get.defaultDialog(
          title: "Warning", middleText: "The Veryfieycode is not correct");
      stateRequest = ConectionState.failure;
    }
  }

  @override
  void onInit() {
    email = Get.arguments["email"];
    super.onInit();
  }
}
