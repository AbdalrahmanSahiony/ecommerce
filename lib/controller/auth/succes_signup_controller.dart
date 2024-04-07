import 'package:get/get.dart';
import 'package:flutter_application_19/core/constans/routesString.dart';

abstract class SuccesSignupController extends GetxController {
  goToLogin();
}

class SuccesSignupControllerIm extends SuccesSignupController {
  @override
  goToLogin() {
    Get.offAllNamed(AppRoutes.logIn);
  }
}
