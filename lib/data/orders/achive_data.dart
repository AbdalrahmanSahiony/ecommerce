import 'package:delivery/core/classes/curd.dart';
import 'package:delivery/core/const/app_link.dart';

class ArchiveData {
  Curd curd;
  ArchiveData(this.curd);
  archiveData(deliveryId) async {
    var response = await curd
        .postRequest(AppLink.archiveOrders, {"deliveryId": deliveryId});
    return response.fold((l) => l, (r) => r);
  }
}
