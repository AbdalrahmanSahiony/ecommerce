import 'package:flutter/material.dart';
import 'package:flutter_application_19/controller/orders/notification_view_controller.dart';
import 'package:flutter_application_19/core/classes/view_handling.dart';
import 'package:flutter_application_19/core/constans/app_color.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NotificationViewController());
    return Scaffold(
        appBar: AppBar(title: const Text("Notification")),
        body: GetBuilder<NotificationViewController>(
            builder: (controller) => RequestHandling(
                  request: controller.stateRequest,
                  widget: Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: ListView(children: [
                      ...List.generate(
                        controller.data.length,
                        (index) => Stack(
                          children: [
                            ListTile(
                              title: Text(
                                  "${controller.data[index]["notify_title"]}"),
                              subtitle: Text(
                                  "${controller.data[index]["notify_body"]}"),
                            ),
                            Positioned(
                              right: 5,
                              child: Text(
                                Jiffy.parse(controller.data[index]
                                        ["notify_datetime"])
                                    .fromNow(),
                                style: const TextStyle(
                                    color: AppColor.primaryColor,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]),
                  ),
                )));
  }
}
