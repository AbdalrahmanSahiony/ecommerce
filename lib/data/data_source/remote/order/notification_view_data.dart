import 'package:flutter_application_19/core/classes/curd.dart';
import 'package:flutter_application_19/core/constans/app_link.dart';

class NotificationViewData {
  Curd curd;
  NotificationViewData(this.curd);
  notificationData(String userId) async {
    var response = await curd.postRequest(AppLink.notificationView, {
      "userId": userId,
    });
    return response.fold((l) => l, (r) => r);
  }
}
