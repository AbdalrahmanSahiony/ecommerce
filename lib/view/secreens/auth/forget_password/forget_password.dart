import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_19/controller/auth/forget_password/forget_password_controller.dart';
import 'package:flutter_application_19/core/classes/view_handling.dart';
import 'package:flutter_application_19/core/functions/validate.dart';
import 'package:flutter_application_19/view/widgets/auth/custtom_buttom_auth.dart';
import 'package:flutter_application_19/view/widgets/auth/custtom_head_text.dart';
import 'package:flutter_application_19/view/widgets/auth/custtom_text_form_field.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordControllerIm());
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Forget Password",
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Colors.grey),
          ),
          centerTitle: true,
        ),
        body: GetBuilder<ForgetPasswordControllerIm>(
          builder: (controller) => RequestHandling(
            request: controller.stateRequest,
            widget: Container(
              padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 5),
              child: Form(
                key: controller.formState,
                child: ListView(
                  children: [
                    const CusttomHeadText(text: "Check Email"),
                    CusttomTextFormFieldAuth(
                        validator: (val) {
                          return validit(val!, 100, 5, "email");
                        },
                        keybordType: TextInputType.text,
                        controller: controller.email,
                        text: "Email",
                        hintText: "put your email here",
                        iconData: const Icon(Icons.email_outlined)),
                    const SizedBox(
                      height: 10,
                    ),
                    CusttomButtomAuth(
                      lable: "Check Email",
                      onTap: () {
                        if (controller.validit()) {
                          controller.checkEmail();
                        }
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
