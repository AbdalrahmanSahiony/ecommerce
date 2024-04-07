import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:flutter_application_19/controller/auth/verfieucode_signup_controller.dart';
import 'package:flutter_application_19/core/classes/view_handling.dart';
import 'package:flutter_application_19/view/widgets/auth/custtom_head_text.dart';

class VerfieyCodeSignup extends StatelessWidget {
  const VerfieyCodeSignup({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(VerfieyCodeSignupControllerIm());
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
        body: GetBuilder<VerfieyCodeSignupControllerIm>(
            builder: (controller) => RequestHandling(
                  request: controller.stateRequest,
                  widget: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 35, vertical: 5),
                    child: ListView(
                      children: [
                        const CusttomHeadText(text: "Enter Code"),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: OtpTextField(
                              margin: const EdgeInsets.all(10),
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
                                controller.goToSuccesSignup(verificationCode);
                              }),
                        ),
                        const SizedBox(height: 20),
                        const SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () {
                            controller.resend();
                          },
                          child: const Center(
                              child: Text(
                            "Resend Verifiycode",
                            style: TextStyle(color: Colors.red, fontSize: 20),
                          )),
                        )
                      ],
                    ),
                  ),
                )));
  }
}
