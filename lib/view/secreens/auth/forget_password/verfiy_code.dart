import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:flutter_application_19/controller/auth/forget_password/verfiey_code_controller.dart';
import 'package:flutter_application_19/core/classes/view_handling.dart';
import 'package:flutter_application_19/view/widgets/auth/custtom_head_text.dart';

class VerfieyCode extends StatelessWidget {
  const VerfieyCode({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(VerfieyCodeControllerIm());
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Check Code",
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Colors.grey),
          ),
          centerTitle: true,
        ),
        body: GetBuilder<VerfieyCodeControllerIm>(
          builder: (controller) => RequestHandling(
            request: controller.stateRequest,
            widget: Container(
              padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 5),
              child: ListView(
                children: [
                  const CusttomHeadText(text: "Enter Code"),
                  const SizedBox(
                    height: 20,
                  ),
                  OtpTextField(
                      fieldWidth: 60,
                      numberOfFields: 5,
                      borderColor: const Color(0xFF512DA8),
                      //set to true to show as box or false to show as dash
                      showFieldAsBox: true,
                      //runs when a code is typed in
                      onCodeChanged: (String code) {
                        //handle validation or checks here
                      },
                      //runs when every textfield is filled
                      onSubmit: (String verificationCode) {
                        controller.checkCode(verificationCode);
                      }),
                  const SizedBox(height: 20),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
