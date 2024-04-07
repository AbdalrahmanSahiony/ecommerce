import 'package:flutter_application_19/core/classes/curd.dart';
import 'package:flutter_application_19/core/constans/app_link.dart';

class ResetPasswordData {
  Curd curd;
  ResetPasswordData(this.curd);
  resetPasswordData(String email, String password) async {
    var response = await curd.postRequest(AppLink.resetPassword, {
      "email": email,
      "password": password,
    });
    return response.fold((l) => l, (r) => r);
  }
}
