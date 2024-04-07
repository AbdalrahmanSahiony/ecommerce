import 'package:admin/core/app_routes_string.dart';
import 'package:admin/core/constant/image.dart';
import 'package:admin/core/function/fcm.dart';
import 'package:get/get.dart';

class HomeConroller extends GetxController {
  List home = [
    {
      "image": AppImage.cat,
      "text": "categories",
      "route": AppRoutesString.categorisView
    },
    {
      "image": AppImage.item,
      "text": "Item",
      "route": AppRoutesString.itemsView
    },
    {"image": AppImage.user, "text": "Users", "route": ""},
    {
      "image": AppImage.order,
      "text": "Orders",
      "route": AppRoutesString.orders
    },
    {"image": AppImage.report, "text": "Reports", "route": ""},
    {"image": AppImage.noty, "text": "Notifications", "route": ""},
  ];
  goToPage(String route) {
    Get.toNamed(route);
  }

  @override
  void onInit() {
    fcmConfig();
    super.onInit();
  }
}
