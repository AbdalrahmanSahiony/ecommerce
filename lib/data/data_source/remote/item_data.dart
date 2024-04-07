import 'package:flutter_application_19/core/classes/curd.dart';
import 'package:flutter_application_19/core/constans/app_link.dart';

class ItemData {
  Curd curd = Curd();
  ItemData(this.curd);
  getItemData(String categoryId, String userId) async {
    var response = await curd.postRequest(
        AppLink.item, {"id": categoryId.toString(), "user_id": userId});
    return response.fold((l) => l, (r) => r);
  }
}
