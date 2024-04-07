import 'package:get/get.dart';
import 'package:flutter_application_19/core/constans/routesString.dart';

abstract class SuccesResetPasswordController extends GetxController {
  goToLogin();
}

class SuccesResetPasswordControllerIm extends SuccesResetPasswordController {
  @override
  goToLogin() {
    Get.offAllNamed(AppRoutes.logIn);
  }
}
