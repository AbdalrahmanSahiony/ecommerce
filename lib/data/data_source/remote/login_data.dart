import 'package:flutter_application_19/core/classes/curd.dart';
import 'package:flutter_application_19/core/constans/app_link.dart';

class LoginData {
  Curd curd;
  LoginData(this.curd);
  loginData(String email, String password) async {
    var response = await curd.postRequest(AppLink.login, {
      "email": email,
      "password": password,
    });
    return response.fold((l) => l, (r) => r);
  }
}
