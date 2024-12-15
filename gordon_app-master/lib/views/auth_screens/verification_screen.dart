import 'package:flutter/material.dart';
import 'package:gordon_app/common_widgets/our_button.dart';
import 'package:velocity_x/velocity_x.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: GestureDetector(
            // onTap: () {
            //   Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => LoginScreen(),
            //       ));
            // },
            child: const Icon(Icons.arrow_back_ios)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            "Verification".text.fontWeight(FontWeight.bold).size(24).make(),
            25.heightBox,
            "We send you a confirmation on "
                .text
                .color(Color(0xff838589))
                .size(15)
                .make(),
            10.heightBox,
            Row(
              children: [
                "Gor*******@gmail.com "
                    .text
                    .color(Color(0xff838589))
                    .size(15)
                    .make(),
                "Wrong email? ".text.color(Color(0xff3669C9)).size(15).make(),
              ],
            ),
            50.heightBox,
            Center(
                child: Image.asset(
              "assets/images/messageIcon.png",
              width: 120,
              fit: BoxFit.fill,
            )),
            50.heightBox,
            Row(
              children: [
                "Retry for new confirmation"
                    .text
                    .color(Color(0xff838589))
                    .size(15)
                    .make(),
                Spacer(),
                "03:05"
                    .text
                    .color(Color(0xff838589))
                    .size(15)
                    .make(),
              ],
            ),
            25.heightBox,
            SizedBox(
              height: 50,
              width: context.screenWidth-40,
              child: OurButton(
                title:"Continue",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
