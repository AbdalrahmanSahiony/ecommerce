import 'package:flutter_application_19/core/classes/curd.dart';
import 'package:flutter_application_19/core/constans/app_link.dart';

class AddressData {
  Curd curd;
  AddressData(this.curd);
  addAddress(String userId, String city, String name, String street) async {
    var response = await curd.postRequest(AppLink.addAdress,
        {"user_id": userId, "city": city, "street": street, "name": name});
    return response.fold((l) => l, (r) => r);
  }

  viewAddress(String userId) async {
    var response = await curd.postRequest(AppLink.viewAdress, {"id": userId});
    return response.fold((l) => l, (r) => r);
  }

  deleteAddress(String id) async {
    var response = await curd.postRequest(AppLink.deleteAdress, {"id": id});
    return response.fold((l) => l, (r) => r);
  }

  editAddress(String id, String city, String name, String street) async {
    var response = await curd.postRequest(AppLink.editAdress,
        {"id": id, "city": city, "street": street, "name": name});
    return response.fold((l) => l, (r) => r);
  }
}
