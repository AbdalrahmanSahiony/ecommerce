import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_19/controller/auth/succes_signup_controller.dart';
import 'package:flutter_application_19/view/widgets/auth/custtom_buttom_auth.dart';

class SuccesSignup extends StatelessWidget {
  const SuccesSignup({super.key});

  @override
  Widget build(BuildContext context) {
    SuccesSignupControllerIm controller = Get.put(SuccesSignupControllerIm());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "succes signup",
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: Colors.grey),
        ),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
            ),
            const Center(
                child: Icon(
              Icons.check_circle_outline,
              color: Colors.deepOrange,
            )),
            const SizedBox(
              height: 100,
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
