import 'dart:io';

import 'package:admin/core/classes/curd.dart';
import 'package:admin/core/constant/app_link.dart';

class ItemsData {
  Curd curd;
  ItemsData(this.curd);
  viewData() async {
    var response = await curd.postRequest(AppLink.itemsView, {});
    return response.fold((l) => l, (r) => r);
  }

  addData(data, image) async {
    var response =
        await curd.addRequestWithImageOne(AppLink.itemsAdd, data, image);
    return response.fold((l) => l, (r) => r);
  }

  deleteData(id, image) async {
    var response =
        await curd.postRequest(AppLink.itemsDelete, {"id": id, "img": image});
    return response.fold((l) => l, (r) => r);
  }

  serchData(serch) async {
    var response =
        await curd.postRequest(AppLink.itemsSerch, {"search": serch});
    return response.fold((l) => l, (r) => r);
  }

  editData(Map<String, dynamic> data, [File? file]) async {
    dynamic response;
    if (file == null) {
      response = await curd.postRequest(AppLink.itemsEdit, data);
    } else {
      response =
          await curd.addRequestWithImageOne(AppLink.itemsEdit, data, file);
    }

    return response.fold((l) => l, (r) => r);
  }
}
