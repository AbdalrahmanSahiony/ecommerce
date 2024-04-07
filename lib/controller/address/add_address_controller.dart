import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_19/conection_state.dart';
import 'package:flutter_application_19/core/constans/routesString.dart';
import 'package:flutter_application_19/core/functions/handling_data.dart';
import 'package:flutter_application_19/core/servecies/servecies.dart';
import 'package:flutter_application_19/data/data_source/remote/address_data.dart';

abstract class AddAddressController extends GetxController {
  late TextEditingController city;
  late TextEditingController street;
  late TextEditingController name;
}

class AddAddressControllerIm extends AddAddressController {
  ConectionState stateRequest = ConectionState.none;
  AddressData addressData = AddressData(Get.find());
  String? id = MyServecies.sharedPreferences.getString("id");

  addAdress() async {
    var response =
        await addressData.addAddress(id!, city.text, name.text, street.text);
    stateRequest = handlingData(response);
    if (response["status"] == "succes") {
      city.clear();
      name.clear();
      street.clear();
      Get.toNamed(AppRoutes.viewAddress);
    }

    update();
  }

  @override
  void onInit() {
    city = TextEditingController();
    name = TextEditingController();
    street = TextEditingController();
    super.onInit();
  }
}
