import 'package:flutter/material.dart';
import 'package:gordon_app/common_widgets/our_button.dart';
import 'package:gordon_app/common_widgets/text.dart';
import 'package:gordon_app/conts/images.dart';
import 'package:gordon_app/conts/strings.dart';
import 'package:gordon_app/models/cart_model.dart';
import 'package:velocity_x/velocity_x.dart';

import '../conts/styles.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Text(""),
        elevation: 1,
        title: "Cart"
            .text
            .color(const Color(0xff3669C9))
            .fontFamily(bold)
            .size(18)
            .make(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.60,
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: modelCart.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Color(0xffE0E0E0),
                                spreadRadius: 1,
                                offset: Offset(1, 0),
                                blurRadius: 15)
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                image: AssetImage(modelCart[index].pImg),
                                fit: BoxFit.fill,
                              )),
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      OurText(
                                        text: modelCart[index].pName,
                                        textColor: Color(0xff3669C9),
                                        fontBold: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                      Spacer(),
                                      Icon(Icons.cancel_outlined),
                                    ],
                                  ),
                                  OurText(
                                    text: modelCart[index].pPrice,
                                    fontBold: FontWeight.bold,
                                    fontSize: 16,
                                    textColor: Colors.black,
                                  ),
                                  20.heightBox,
                                  Row(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: Colors.grey[200]),
                                        child: Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Icon(Icons.add),
                                        ),
                                      ),
                                      5.widthBox,
                                      OurText(
                                        text: modelCart[index].pQuantity,
                                        fontBold: FontWeight.bold,
                                        fontSize: 18,
                                        textColor: Colors.black,
                                      ),
                                      5.widthBox,
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: Colors.grey[200]),
                                        child: Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Icon(Icons.add),
                                        ),
                                      ),
                                      Spacer(),
                                      OurText(
                                        fontBold: FontWeight.bold,
                                        fontSize: 16,
                                        textColor: Colors.black,
                                        text: modelCart[index].cbm,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 50),
            Container(
              color: Colors.transparent,
              child: Column(
                children: [
                  Row(
                    children: [
                      "Advance payment"
                          .text
                          .size(20)
                          .color(Color(0xff808080))
                          .fontFamily(bold)
                          .make(),
                      Spacer(),
                      "25.00"
                          .text
                          .size(20)
                          .color(Colors.black)
                          .fontFamily(bold)
                          .make(),
                    ],
                  ),
                  Row(
                    children: [
                      "Total:"
                          .text
                          .size(20)
                          .color(Color(0xff808080))
                          .fontFamily(bold)
                          .make(),
                      Spacer(),
                      "95.00"
                          .text
                          .size(20)
                          .color(Colors.black)
                          .fontFamily(bold)
                          .make(),
                    ],
                  ),
                  20.heightBox,
                  SizedBox(
                    height: 60,
                    width: double.infinity,
                    child: OurButton(
                      title: "Check out",
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<dynamic> modelCart = [
    CartModel(
      cbm: "CBM 2",
      pImg: product_img,
      pName: "Minimal Stand",
      pPrice: "25.00",
      pQuantity: "8",
    ),
    CartModel(
      cbm: "CBM 2",
      pImg: product_img,
      pName: "Minimal Stand",
      pPrice: "25.00",
      pQuantity: "8",
    ),
    CartModel(
      cbm: "CBM 2",
      pImg: product_img,
      pName: "Minimal Stand",
      pPrice: "25.00",
      pQuantity: "8",
    ),
    CartModel(
      cbm: "CBM 2",
      pImg: product_img,
      pName: "Minimal Stand",
      pPrice: "25.00",
      pQuantity: "8",
    ),
    CartModel(
      cbm: "CBM 2",
      pImg: product_img,
      pName: "Minimal Stand",
      pPrice: "25.00",
      pQuantity: "8",
    ),
    CartModel(
      cbm: "CBM 2",
      pImg: product_img,
      pName: "Minimal Stand",
      pPrice: "25.00",
      pQuantity: "8",
    ),
    CartModel(
      cbm: "CBM 2",
      pImg: product_img,
      pName: "Minimal Stand",
      pPrice: "25.00",
      pQuantity: "8",
    ),
    CartModel(
      cbm: "CBM 2",
      pImg: product_img,
      pName: "Minimal Stand",
      pPrice: "25.00",
      pQuantity: "8",
    ),
  ];
}
