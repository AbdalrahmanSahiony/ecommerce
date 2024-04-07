import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_19/controller/auth/succes_reset_password_controller.dart';
import 'package:flutter_application_19/view/widgets/auth/custtom_buttom_auth.dart';

class SuccesResetPassword extends StatelessWidget {
  const SuccesResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    SuccesResetPasswordControllerIm controller =
        Get.put(SuccesResetPasswordControllerIm());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "succes reset password",
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: Colors.grey),
        ),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: Column(children: [
        const Center(
            child: Icon(
          Icons.check_circle_outline,
          color: Colors.deepOrange,
        )),
        const SizedBox(
          height: 30,
        ),
        CusttomButtomAuth(
          lable: "Go to login",
          onTap: () {
            controller.goToLogin();
          },
        ),
      ]),
    );
  }
}
