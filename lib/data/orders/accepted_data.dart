import 'package:delivery/core/classes/curd.dart';
import 'package:delivery/core/const/app_link.dart';

class AcceptedViewData {
  Curd curd;
  AcceptedViewData(this.curd);
  acceptedViewData(deliveryId) async {
    var response = await curd
        .postRequest(AppLink.approvedOrdersView, {"deliveryId": deliveryId});
    return response.fold((l) => l, (r) => r);
  }
}
