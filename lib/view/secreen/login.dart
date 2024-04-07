import 'package:delivery/controller/login_controller.dart';
import 'package:delivery/core/classes/request_handling.dart';
import 'package:delivery/core/const/image.dart';
import 'package:delivery/core/function/validate.dart';
import 'package:delivery/view/widget/button_auth.dart';
import 'package:delivery/view/widget/form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogIn extends StatelessWidget {
  const LogIn({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Login",
          ),
          centerTitle: true,
        ),
        body: GetBuilder<LoginController>(
            builder: (controller) => ViewHandling(
                request: controller.stateRequest,
                widget: Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(10),
                    child: Form(
                        key: controller.formstate,
                        child: ListView(children: [
                          Image.asset(
                            AppImage.logo,
                            height: 180,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text(
                            "Sign in with your email and password or continue with social media",
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          CusttomTextFormFieldAuth(
                            keybordType: TextInputType.text,
                            controller: controller.emailController,
                            text: "Email",
                            hintText: "put your email here",
                            iconData: const Icon(Icons.email_outlined),
                            validator: (val) {
                              return validit(val!, 100, 5, "email");
                            },
                          ),
                          const SizedBox(height: 20),
                          CusttomTextFormFieldAuth(
                            keybordType: TextInputType.text,
                            validator: (val) {
                              return validit(val!, 100, 5, "password");
                            },
                            controller: controller.passwordController,
                            text: "password",
                            obscureText: controller.isHide,
                            hintText: "put your password here",
                            iconData: const Icon(Icons.lock_outline),
                            onTap: () {
                              controller.hidePassword();
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          CusttomButtomAuth(
                            lable: "Log In",
                            onTap: () {
                              if (controller.valditor()) {
                                controller.login();
                                controller.emailController.clear();
                                controller.passwordController.clear();
                              } else {
                                controller.passwordController.clear();
                              }
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                        ]))))));
  }
}
