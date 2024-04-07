import 'package:flutter_application_19/core/classes/curd.dart';
import 'package:flutter_application_19/core/constans/app_link.dart';

class SignupData {
  Curd curd;
  SignupData(this.curd);
  getData(String username, String email, String password, String phone) async {
    var response = await curd.postRequest(AppLink.signup, {
      "name": username,
      "email": email,
      "password": password,
      "phone": phone,
    });
    return response.fold((l) => l, (r) => r);
  }
}
