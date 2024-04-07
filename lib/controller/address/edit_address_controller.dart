import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:flutter_application_19/conection_state.dart';
import 'package:flutter_application_19/controller/address/view_address_controller.dart';
import 'package:flutter_application_19/core/constans/routesString.dart';
import 'package:flutter_application_19/core/functions/handling_data.dart';
import 'package:flutter_application_19/data/data_source/remote/address_data.dart';

class EditAddressController extends GetxController {
  TextEditingController city = TextEditingController();
  TextEditingController street = TextEditingController();
  TextEditingController name = TextEditingController();
  ConectionState stateRequest = ConectionState.none;
  late String id;
  AddressData addressData = AddressData(Get.find());
  ViewAdressControllerIm controller = Get.find();
  goToViewAddress() {
    Get.toNamed(AppRoutes.viewAddress);
  }

  editAdress() async {
    var response =
        await addressData.editAddress(id, city.text, name.text, street.text);
    stateRequest = handlingData(response);
    if (response["status"] == "succes") {
      controller.viewAdress();
      goToViewAddress();
      Get.defaultDialog(title: "alert", middleText: "the address edited");

      city.clear();
      street.clear();
      name.clear();
    }

    update();
  }

  @override
  void onInit() {
    id = Get.arguments["id"];
    super.onInit();
  }
}
