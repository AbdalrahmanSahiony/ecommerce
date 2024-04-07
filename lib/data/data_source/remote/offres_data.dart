import 'package:flutter_application_19/core/classes/curd.dart';
import 'package:flutter_application_19/core/constans/app_link.dart';

class OffersData {
  Curd curd;
  OffersData(this.curd);
  offersViewData() async {
    var response = await curd.postRequest(AppLink.offersView, {});
    return response.fold((l) => l, (r) => r);
  }
}
