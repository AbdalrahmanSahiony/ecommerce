import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_19/controller/auth/signup_controller.dart';
import 'package:flutter_application_19/core/classes/view_handling.dart';
import 'package:flutter_application_19/core/functions/alert_exit_app.dart';
import 'package:flutter_application_19/core/functions/validate.dart';
import 'package:flutter_application_19/view/widgets/auth/custtom_body_text.dart';
import 'package:flutter_application_19/view/widgets/auth/custtom_buttom_auth.dart';
import 'package:flutter_application_19/view/widgets/auth/custtom_head_text.dart';
import 'package:flutter_application_19/view/widgets/auth/custtom_row_auth.dart';
import 'package:flutter_application_19/view/widgets/auth/custtom_text_form_field.dart';

class SignUp extends GetView<SignUpControllerIm> {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpControllerIm());
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "signup",
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Colors.grey),
          ),
          centerTitle: true,
        ),
        body: GetBuilder<SignUpControllerIm>(
            builder: (controller) => RequestHandling(
                  request: controller.stateRequest,
                  widget: WillPopScope(
                    onWillPop: () => alertExitApp(),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 35, vertical: 5),
                      child: Form(
                        key: controller.formState,
                        child: ListView(
                          children: [
                            const CusttomHeadText(text: "Wlecom Back"),
                            const CusttomBodyText(
                                text:
                                    "Sign in with your email and password or continue with social media"),
                            const SizedBox(
                              height: 20,
                            ),
                            CusttomTextFormFieldAuth(
                                keybordType: TextInputType.text,
                                validator: (val) {
                                  return validit(val!, 100, 5, "username");
                                },
                                text: "User Name",
                                hintText: "put your name here",
                                controller: controller.userName,
                                iconData: const Icon(Icons.person)),
                            const SizedBox(
                              height: 20,
                            ),
                            CusttomTextFormFieldAuth(
                                keybordType: TextInputType.text,
                                validator: (val) {
                                  return validit(val!, 100, 5, "email");
                                },
                                controller: controller.email,
                                text: "Email",
                                hintText: "put your email here",
                                iconData: const Icon(Icons.email_outlined)),
                            const SizedBox(height: 20),
                            CusttomTextFormFieldAuth(
                                validator: (val) {
                                  return validit(val!, 100, 5, "phoneNumber");
                                },
                                controller: controller.phoneNumber,
                                text: "Phon Number",
                                keybordType: TextInputType.phone,
                                hintText: "put your phone number here",
                                iconData: const Icon(Icons.phone)),
                            const SizedBox(height: 20),
                            GetBuilder<SignUpControllerIm>(
                                builder: (conrollerIm) {
                              return CusttomTextFormFieldAuth(
                                keybordType: TextInputType.text,
                                validator: (val) {
                                  return validit(val!, 100, 5, "password");
                                },
                                controller: conrollerIm.password,
                                text: "password",
                                hintText: "put your password here",
                                obscureText: conrollerIm.isHide,
                                iconData: Icon(!conrollerIm.isHide
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined),
                                onTap: () {
                                  conrollerIm.showAndHidePassword();
                                },
                              );
                            }),
                            const SizedBox(
                              height: 10,
                            ),
                            CusttomButtomAuth(
                              lable: "signup",
                              onTap: () {
                                if (controller.validit()) {
                                  controller.signup();
                                  controller.userName.clear();
                                  controller.password.clear();
                                  controller.phoneNumber.clear();
                                }
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            CusttomRawAuth(
                              stringOne: "Sign In ",
                              stringTow: "Sign In",
                              onTap: () {
                                controller.goToLogIn();
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )));
  }
}
