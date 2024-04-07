import 'dart:io';

import 'package:admin/core/classes/curd.dart';
import 'package:admin/core/constant/app_link.dart';

class CategorisData {
  Curd curd;
  CategorisData(this.curd);
  viewData() async {
    var response = await curd.postRequest(AppLink.categoriesView, {});
    return response.fold((l) => l, (r) => r);
  }

  addData(data, image) async {
    var response =
        await curd.addRequestWithImageOne(AppLink.categoriesAdd, data, image);
    return response.fold((l) => l, (r) => r);
  }

  deleteData(id, image) async {
    var response = await curd
        .postRequest(AppLink.categoriesDelete, {"id": id, "img": image});
    return response.fold((l) => l, (r) => r);
  }

  editData(Map<String, dynamic> data, [File? file]) async {
    var response;
    if (file == null) {
      response = await curd.postRequest(AppLink.categoriesedit, data);
    } else {
      response =
          await curd.addRequestWithImageOne(AppLink.categoriesedit, data, file);
    }

    return response.fold((l) => l, (r) => r);
  }
}
