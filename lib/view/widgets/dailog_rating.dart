import 'package:flutter/material.dart';
import 'package:flutter_application_19/controller/orders/order_archive_controller.dart';
import 'package:flutter_application_19/core/constans/app_color.dart';
import 'package:flutter_application_19/core/constans/image_assets.dart';
import 'package:flutter_application_19/data/model/orders_model.dart';
import 'package:get/get.dart';
import 'package:rating_dialog/rating_dialog.dart';

ArchiveOrderController controller = Get.find();
late OrdersModel order;
final _dialog = RatingDialog(
  initialRating: 1.0,
  // your app's name?
  image: Image.asset(AppImageAssets.logo),
  title: const Text(
    'Rating Dialog',
    textAlign: TextAlign.center,
    style: TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.bold,
    ),
  ),
  // encourage your user to leave a high rating?
  message: const Text(
    'Tap a star to set your rating. Add more description here if you want.',
    textAlign: TextAlign.center,
    style: TextStyle(fontSize: 15),
  ),
  // your app's logo?

  submitButtonText: 'Submit',
  submitButtonTextStyle: const TextStyle(
      color: AppColor.primaryColor, fontWeight: FontWeight.bold),
  commentHint: 'Set your custom comment hint',
  onSubmitted: (response) {
    //  controller.grtOrderRating(ordersModel!.ordersId.toString(), 1.0, "rere");
    controller.grtOrderRating(
        order.ordersId.toString(), response.rating, response.comment);
  },
);

// show the dialog
showRating(BuildContext context, ordersModel) {
  order = ordersModel;
  showDialog(
    context: context,
    barrierDismissible: true, // set to false if you want to force a rating
    builder: (context) => _dialog,
  );
}
