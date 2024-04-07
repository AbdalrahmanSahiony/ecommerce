import 'package:get/get.dart';
import 'package:flutter_application_19/conection_state.dart';
import 'package:flutter_application_19/core/constans/routesString.dart';
import 'package:flutter_application_19/core/functions/handling_data.dart';
import 'package:flutter_application_19/core/servecies/servecies.dart';
import 'package:flutter_application_19/data/data_source/remote/address_data.dart';
import 'package:flutter_application_19/data/model/address_model.dart';

class ViewAdressControllerIm extends GetxController {
  ConectionState stateRequest = ConectionState.none;
  AddressData addressData = AddressData(Get.find());
  String? id = MyServecies.sharedPreferences.getString("id");
  List data = [];
  List<AddressModel> address = [];
  viewAdress() async {
    stateRequest = ConectionState.loading;
    update();
    data.clear();
    update();
    address.clear();
    update();
    var response = await addressData.viewAddress(id!);
    stateRequest = handlingData(response);
    if (response["status"] == "succes") {
      data = response["data"];
      address.addAll(data.map((e) => AddressModel.fromJson(e)));
      update();
    }

    update();
  }

  goTOAddAddress() {
    Get.toNamed(AppRoutes.addAddress);
  }

  @override
  void onInit() {
    viewAdress();
    super.onInit();
  }

  goToEditAddress(id) {
    Get.toNamed(AppRoutes.editAddress, arguments: {
      "id": id,
    });
  }

  deleteAddress(id) async {
    data.clear();
    address.clear();
    var response = await addressData.deleteAddress(id);
    stateRequest = handlingData(response);
    if (response["status"] == "succes") {
      viewAdress();
      update();
    }

    update();
  }
}
