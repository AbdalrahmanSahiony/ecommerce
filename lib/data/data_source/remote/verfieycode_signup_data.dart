import 'package:flutter_application_19/core/classes/curd.dart';
import 'package:flutter_application_19/core/constans/app_link.dart';

class VerfieycodeSignupData {
  Curd curd;
  VerfieycodeSignupData(this.curd);
  getData(String email, String veryfieycod) async {
    var response = await curd.postRequest(AppLink.veryfieycode, {
      "email": email,
      "code": veryfieycod,
    });
    return response.fold((l) => l, (r) => r);
  }

  resendCode(String email) async {
    var response = await curd.postRequest(AppLink.resendVeryfieycode, {
      "email": email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
