import 'package:flutter_application_19/core/classes/curd.dart';
import 'package:flutter_application_19/core/constans/app_link.dart';

class CheckEmailData {
  Curd curd;
  CheckEmailData(this.curd);
  checkEmail(String email) async {
    var response = await curd.postRequest(AppLink.checkEmail, {
      "email": email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
