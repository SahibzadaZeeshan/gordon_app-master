import 'package:flutter/material.dart';
import 'package:gordon_app/common_widgets/custom_textfield.dart';
import 'package:gordon_app/common_widgets/our_button.dart';
import 'package:gordon_app/conts/styles.dart';
import 'package:velocity_x/velocity_x.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) => LoginScreen(),
              //     ));
            },
            child: const Icon(Icons.arrow_back_ios)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            "Reset Password".text.fontWeight(FontWeight.bold).size(24).make(),
            25.heightBox,
            "Enter your email that we will send password changing email"
                .text
                .color(Color(0xff838589))
                .size(15)
                .make(),
            80.heightBox,
            CustomTextfield(
              title: "Email / Password",
              hintText: "Berlin@gmail.com",
              isOb: false,
            ),
            25.heightBox,
            SizedBox(
              height: 50,
              width: context.screenWidth - 40,
              child: OurButton(
                title: "Reset",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
