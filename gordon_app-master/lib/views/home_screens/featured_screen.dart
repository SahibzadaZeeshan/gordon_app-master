import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../conts/styles.dart';
class FeaturedScreen extends StatelessWidget {
  const FeaturedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:Icon(Icons.arrow_back_ios),
        title:"Category Name".text.fontFamily(semibold).make(),
      ),
      body:SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          child: Column(
            children: [
              GridView.builder(
                itemCount: 6,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    mainAxisExtent: 230),
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        "assets/images/Mask Group.png",
                        width: 200,
                      ).box.roundedSM.make(),
                      5.heightBox,
                      "Coffee Chair"
                          .text
                          .fontFamily(semibold)
                          .size(14)
                          .make(),
                      5.heightBox,
                      "Rp. 1.500.000"
                          .text
                          .fontFamily(semibold)
                          .size(12)
                          .color(const Color(0xff3669C9))
                          .make(),
                      2.heightBox,
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          "4.6".text.fontFamily(semibold).size(10).make(),
                          15.widthBox,
                          "86 Reviews"
                              .text
                              .fontFamily(semibold)
                              .size(10)
                              .make(),
                          const Spacer(),
                          const Icon(
                            Icons.more_vert,
                            size: 15,
                          ),
                        ],
                      ),
                    ],
                  )
                      .box
                      .roundedSM
                      .padding(const EdgeInsets.all(5))
                      .color(Colors.white)
                      .make();
                },
              ),
            ],
          ),
        ),
      ) ,
    );
  }
}
