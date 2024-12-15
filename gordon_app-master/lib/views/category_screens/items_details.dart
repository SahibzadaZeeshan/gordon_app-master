import 'package:flutter/material.dart';
import 'package:gordon_app/common_widgets/our_button.dart';
import 'package:gordon_app/conts/images.dart';
import 'package:gordon_app/conts/styles.dart';
import 'package:velocity_x/velocity_x.dart';

class ItemsDetails extends StatelessWidget {
  const ItemsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios),
        title: "Detail Product".text.fontFamily(semibold).make(),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// Product Image
            Image.asset(product_img,
                    width: double.infinity, height: 280, fit: BoxFit.fill)
                .box
                .color(Color(0xffEDEDED))
                .padding(EdgeInsets.all(10))
                .make(),

            /// Proudct Details
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                "Minimal Stand"
                    .text
                    .size(24)
                    .color(Color(0xff3669C9))
                    .fontFamily(bold)
                    .make(),
                5.heightBox,
                Row(
                  children: [
                    "S 25.00"
                        .text
                        .size(14)
                        .color(Color(0xff242424))
                        .fontFamily(semibold)
                        .make(),
                    Spacer(),
                    "CBM 13"
                        .text
                        .size(14)
                        .color(Color(0xff242424))
                        .fontFamily(semibold)
                        .make(),
                  ],
                ),
              ],
            )
                .box
                .padding(EdgeInsets.symmetric(horizontal: 20, vertical: 10))
                .make(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                "Product Description"
                    .text
                    .size(16)
                    .color(Color(0xff242424))
                    .fontFamily(bold)
                    .make(),
                5.heightBox,
                "Introducing our exquisitely crafted furniture collection,"
                    " designed to transform your living spaces into havens of style,"
                    " comfort, and functionality. Each piece in our collection "
                    "is meticulously"
                    " created with a blend of contemporary aesthetics, exceptional"
                    " craftsmanship, and premium..."
                    .text
                    .size(14).letterSpacing(0)
                    .color(Color(0xff242424))
                    .fontFamily(regular)
                    .make(),
                10.heightBox,
                Row(
                  children: [
                    Image.asset(alert_circle,width: 25,height: 25,),
                    "You can order minimum ".text
                        .size(14)
                        .color(Color(0xff242424))
                        .fontFamily(semibold)
                        .make(),
                    "4 items" .text.size(15)
                        .color(Color(0xff242424))
                        .fontFamily(bold)
                        .make(),
                  ],
                ),
                10.heightBox,
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: OurButton(
                    title: "Add to Cart",
                   // color:Color(0xff3669C9),
                    textColor:Colors.white,
                    onPress:(){}

                  ),
                ),
              ],
            )
                .box
                .padding(EdgeInsets.symmetric(horizontal: 20, vertical: 15))
                .color(Color(0xffEDEDED))
                .make(),
          ],
        ),
      ),
    );
  }
}
