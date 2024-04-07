import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_19/controller/auth/forget_password/reset_password_conroller.dart';
import 'package:flutter_application_19/core/classes/view_handling.dart';
import 'package:flutter_application_19/core/functions/validate.dart';
import 'package:flutter_application_19/view/widgets/auth/custtom_buttom_auth.dart';
import 'package:flutter_application_19/view/widgets/auth/custtom_head_text.dart';
import 'package:flutter_application_19/view/widgets/auth/custtom_text_form_field.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(ResetPasswordControllerIm());
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Reset Password",
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Colors.grey),
          ),
          centerTitle: true,
        ),
        body: GetBuilder<ResetPasswordControllerIm>(
            builder: (controller) => RequestHandling(
                  request: controller.stateRequest,
                  widget: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 35, vertical: 5),
                    child: Form(
                      key: controller.formState,
                      child: ListView(
                        children: [
                          const CusttomHeadText(
                              text: "Enter your new password"),
                          const SizedBox(
                            height: 20,
                          ),
                          CusttomTextFormFieldAuth(
                              keybordType: TextInputType.text,
                              validator: (val) {
                                return validit(val!, 100, 5, "password");
                              },
                              controller: controller.password,
                              text: "password",
                              hintText: "put your password here",
                              iconData: const Icon(Icons.lock_outline)),
                          const SizedBox(
                            height: 20,
                          ),
                          CusttomTextFormFieldAuth(
                              keybordType: TextInputType.text,
                              validator: (val) {
                                return validit(val!, 100, 5, "password");
                              },
                              controller: controller.rePassword,
                              text: "password",
                              hintText: "Re put your password here",
                              iconData: const Icon(Icons.lock_outline)),
                          const SizedBox(
                            height: 20,
                          ),
                          CusttomButtomAuth(
                            lable: "Reset Password",
                            onTap: () {
                              if (controller.validit()) {
                                controller.resetPassword();
                                controller.password.clear();
                                controller.rePassword.clear();
                              }
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                )));
  }
}
