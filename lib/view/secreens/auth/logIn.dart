import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_19/controller/auth/signin_conroller.dart';
import 'package:flutter_application_19/core/classes/view_handling.dart';
import 'package:flutter_application_19/core/constans/image_assets.dart';
import 'package:flutter_application_19/core/constans/routesString.dart';
import 'package:flutter_application_19/core/functions/alert_exit_app.dart';
import 'package:flutter_application_19/core/functions/validate.dart';
import 'package:flutter_application_19/view/widgets/auth/custtom_body_text.dart';
import 'package:flutter_application_19/view/widgets/auth/custtom_buttom_auth.dart';
import 'package:flutter_application_19/view/widgets/auth/custtom_head_text.dart';
import 'package:flutter_application_19/view/widgets/auth/custtom_row_auth.dart';
import 'package:flutter_application_19/view/widgets/auth/custtom_text_form_field.dart';

class LogIn extends StatelessWidget {
  const LogIn({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(SignInControllerIm());
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "9".tr,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Colors.grey),
          ),
          centerTitle: true,
        ),
        body: GetBuilder<SignInControllerIm>(
            builder: (controller) => RequestHandling(
                request: controller.stateRequest,
                widget: WillPopScope(
                  onWillPop: () => alertExitApp(),
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 35, vertical: 5),
                    child: Form(
                      key: controller.formstate,
                      child: ListView(
                        children: [
                          CusttomHeadText(text: "10".tr),
                          Image.asset(
                            AppImageAssets.logo,
                            height: 180,
                          ),
                          CusttomBodyText(text: "11".tr),
                          const SizedBox(
                            height: 15,
                          ),
                          CusttomTextFormFieldAuth(
                            keybordType: TextInputType.text,
                            controller: controller.email,
                            text: "39".tr,
                            hintText: "12".tr,
                            iconData: const Icon(Icons.email_outlined),
                            validator: (val) {
                              return validit(val!, 100, 5, "email");
                            },
                          ),
                          const SizedBox(height: 15),
                          GetBuilder<SignInControllerIm>(
                            builder: (controllerIm) => CusttomTextFormFieldAuth(
                              keybordType: TextInputType.text,
                              validator: (val) {
                                return validit(val!, 100, 5, "password");
                              },
                              controller: controller.password,
                              text: "40".tr,
                              obscureText: controllerIm.isHide,
                              hintText: "13".tr,
                              iconData: const Icon(Icons.lock_outline),
                              onTap: () {
                                controllerIm.showAndHidePassword();
                              },
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              controller.goToForgetPassword();
                            },
                            child: Text(
                              "14".tr,
                              textAlign: TextAlign.end,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(color: Colors.grey),
                            ),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          CusttomButtomAuth(
                            lable: "15".tr,
                            onTap: () {
                              if (controller.valditor()) {
                                controller.logIn();
                                controller.email.clear();
                                controller.password.clear();
                              }
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          CusttomRawAuth(
                            stringOne: "16".tr,
                            stringTow: "17".tr,
                            onTap: () {
                              Get.toNamed(AppRoutes.signUp);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ))));
  }
}
