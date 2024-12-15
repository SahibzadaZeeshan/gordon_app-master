import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gordon_app/common_widgets/custom_textfield.dart';
import 'package:gordon_app/conts/lists.dart';
import 'package:gordon_app/conts/styles.dart';
import 'package:gordon_app/views/auth_screens/login_screen.dart';
import 'package:gordon_app/views/category_screens/all_category.dart';
import 'package:gordon_app/views/home_screens/featured_screen.dart';
import 'package:velocity_x/velocity_x.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.logout),
          onPressed: () async {
            await FirebaseAuth.instance.signOut().then((value) => {
              VxToast.show(context, msg: "Log Out".text.make().toString()),
              Get.offAll(() => const LoginScreen()),
            });
          },
        ),
        title: "LOGO"
            .text
            .color(const Color(0xff3669C9))
            .fontFamily(bold)
            .size(18)
            .make(),
        actions: [
          Image.asset(
            "assets/images/truck.png",
            width: 25,
            height: 25,
          ),
          10.widthBox
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  CustomTextfield(
                    hintText: "Search Product Name",
                    suffIcon: const Icon(Icons.search),
                    isOb: false,
                    title: "",
                  ),
                  10.heightBox,
                  VxSwiper.builder(
                    autoPlay: true,
                    aspectRatio: 16 / 9,
                    height: 150,
                    enlargeCenterPage: true,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Image.asset("assets/images/Banner default.png",
                              fit: BoxFit.fill)
                          .box
                          .rounded
                          .margin(const EdgeInsets.symmetric(horizontal: 8))
                          .clip(Clip.antiAlias)
                          .make();
                    },
                  ),
                  10.heightBox,
                  Row(
                    children: [
                      "Categories".text.fontFamily(semibold).size(16).make(),
                      const Spacer(),
                      "See All"
                          .text
                          .fontFamily(semibold)
                          .color(const Color(0xff3669C9))
                          .size(12)
                          .make().onTap(() {
                        Get.to(() => AllCategory());
                      }),
                    ],
                  ),
                  10.heightBox,
                  Align(
                    alignment: Alignment.centerLeft,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          categoryList.length,
                          (index) => Column(
                            children: [
                              Image.asset(categoryList[index],
                                  height: 55, width: 55, fit: BoxFit.cover),
                              5.heightBox,
                              categoryListText[index]
                                  .text
                                  .fontFamily(semibold)
                                  .size(14)
                                  .make(),
                            ],
                          ).box.margin(const EdgeInsets.only(right: 20)).make(),
                        ),
                      ),
                    ),
                  ),
                  10.heightBox,
                ],
              ),
            ),

            /// Featured Product Container
            Column(
              children: [
                Row(
                  children: [
                    "Featured Product"
                        .text
                        .fontFamily(semibold)
                        .size(16)
                        .make(),

                    const Spacer(),
                    "See All"
                        .text
                        .fontFamily(semibold)
                        .color(const Color(0xff3669C9))
                        .size(12)
                        .make().onTap(() {
                      Get.to(() => FeaturedScreen());
                    }),
                  ],
                ),
                20.heightBox,
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
            )
                .box
                .color(const Color(0xffEDEDED))
                .padding(const EdgeInsets.all(20))
                .make(),
          ],
        ),
      ),
    );
  }
}
