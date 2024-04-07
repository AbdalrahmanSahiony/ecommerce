import 'package:delivery/core/classes/curd.dart';
import 'package:delivery/core/const/app_link.dart';

class LoginData {
  Curd curd;
  LoginData(this.curd);
  loginData(email, password) async {
    var response = await curd
        .postRequest(AppLink.login, {"email": email, "password": password});
    return response.fold((l) => l, (r) => r);
  }
}
