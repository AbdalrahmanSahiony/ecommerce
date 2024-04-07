import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_19/controller/address/view_address_controller.dart';
import 'package:flutter_application_19/core/classes/view_handling.dart';

class ViewAddress extends StatelessWidget {
  const ViewAddress({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ViewAdressControllerIm());
    return GetBuilder<ViewAdressControllerIm>(
      builder: (controller) => Scaffold(
        appBar: AppBar(title: const Text("Address")),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              controller.goTOAddAddress();
            },
            child: const Icon(Icons.add)),
        body: RequestHandling(
          request: controller.stateRequest,
          widget: Container(
            margin: const EdgeInsets.all(5),
            padding: const EdgeInsets.all(5),
            child: ListView.builder(
              itemCount: controller.data.length,
              itemBuilder: (context, index) => Card(
                  child: ListTile(
                title: Text("${controller.address[index].name}"),
                subtitle: Text(
                    "${controller.address[index].city} ${controller.address[index].street}"),
                trailing: IconButton(
                  onPressed: () {
                    controller.deleteAddress(
                        "${controller.address[index].addressId}");
                  },
                  icon: const Icon(Icons.delete_outline),
                ),
                leading: IconButton(
                  onPressed: () {
                    controller.goToEditAddress(
                        "${controller.address[index].addressId}");
                  },
                  icon: const Icon(Icons.edit_outlined),
                ),
              )),
            ),
          ),
        ),
      ),
    );
  }
}
