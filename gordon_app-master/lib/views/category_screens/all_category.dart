import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gordon_app/conts/lists.dart';
import 'package:gordon_app/conts/styles.dart';
import 'package:gordon_app/views/category_screens/items_screen.dart';
import 'package:velocity_x/velocity_x.dart';

class AllCategory extends StatelessWidget {
  const AllCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        leading: Icon(Icons.arrow_back),
        title: "All Category"
            .text
            .color(Colors.black)
            .size(16)
            .fontFamily(semibold)
            .make(),
        actions: [Icon(Icons.search), 10.widthBox],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            GridView.builder(
              itemCount: all_CategoryListName.length,
              shrinkWrap: true,
              gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisExtent: 100,
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 10

              ),
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Image
                        .asset(
                      all_CategoryList[index],
                      fit: BoxFit.fill,
                      width: 50,
                      height: 50,
                    )
                        .box
                        .roundedSM
                        .make(),
                    10.heightBox,
                    all_CategoryListName[index]
                        .text
                        .color(Color(0xff0C1A30))
                        .size(14)
                        .fontFamily(semibold)
                        .make(),
                  ],
                ).box.make().onTap(() {
                  Get.to(() => ItemsScreen());
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
