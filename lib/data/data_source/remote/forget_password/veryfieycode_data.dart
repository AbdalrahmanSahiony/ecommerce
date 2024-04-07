import 'package:flutter_application_19/core/classes/curd.dart';
import 'package:flutter_application_19/core/constans/app_link.dart';

class VryfieyCodeForgetPassword {
  Curd curd;
  VryfieyCodeForgetPassword(this.curd);
  codeData(String email, String vCode) async {
    var response = await curd.postRequest(AppLink.veryfieycodeForgetPassword, {
      "email": email,
      "code": vCode,
    });
    return response.fold((l) => l, (r) => r);
  }
}
