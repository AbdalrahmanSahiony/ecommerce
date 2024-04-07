import 'package:flutter_application_19/core/classes/curd.dart';
import 'package:flutter_application_19/core/constans/app_link.dart';

class TestData {
  Curd curd;
  TestData(this.curd);
  getData() async {
    var response = await curd.postRequest(AppLink.sever, {});
    return response.fold((l) => l, (r) => r);
  }
}
