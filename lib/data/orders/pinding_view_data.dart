import 'package:delivery/core/classes/curd.dart';
import 'package:delivery/core/const/app_link.dart';

class PindingData {
  Curd curd;
  PindingData(this.curd);
  pindingData(deliveryId) async {
    var response = await curd.postRequest(AppLink.waitingOrders, {});
    return response.fold((l) => l, (r) => r);
  }
}
