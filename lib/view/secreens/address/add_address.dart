import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_19/controller/address/add_address_controller.dart';
import 'package:flutter_application_19/core/classes/view_handling.dart';
import 'package:flutter_application_19/view/widgets/auth/custtom_buttom_auth.dart';
import 'package:flutter_application_19/view/widgets/auth/custtom_text_form_field.dart';

class AddAddress extends StatelessWidget {
  const AddAddress({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddAddressControllerIm());
    return Scaffold(
      appBar: AppBar(title: const Text("Add Address")),
      body: GetBuilder<AddAddressControllerIm>(
        builder: (controller) => RequestHandling(
          request: controller.stateRequest,
          widget: Container(
            margin: const EdgeInsets.all(15),
            child: ListView(
              children: [
                CusttomTextFormFieldAuth(
                    text: "city",
                    hintText: "city",
                    iconData: const Icon(Icons.location_city),
                    controller: controller.city,
                    keybordType: TextInputType.name),
                const SizedBox(
                  height: 15,
                ),
                CusttomTextFormFieldAuth(
                    text: "street",
                    hintText: "street",
                    iconData: const Icon(Icons.streetview),
                    controller: controller.street,
                    keybordType: TextInputType.name),
                const SizedBox(
                  height: 15,
                ),
                CusttomTextFormFieldAuth(
                    text: "name",
                    hintText: "name",
                    iconData: const Icon(Icons.abc_sharp),
                    controller: controller.name,
                    keybordType: TextInputType.name),
                const SizedBox(
                  height: 15,
                ),
                CusttomButtomAuth(
                    lable: "Add",
                    onTap: () {
                      controller.addAdress();
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
