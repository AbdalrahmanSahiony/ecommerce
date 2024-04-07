import 'package:flutter_application_19/core/classes/curd.dart';
import 'package:flutter_application_19/core/constans/app_link.dart';

class CheckoutData {
  Curd curd;
  CheckoutData(this.curd);
  checkout(data) async {
    var response = await curd.postRequest(AppLink.checkout, data);
    return response.fold((l) => l, (r) => r);
  }
}
