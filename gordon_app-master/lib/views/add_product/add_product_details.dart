import 'package:flutter/material.dart';
import 'package:gordon_app/common_widgets/custom_textfield.dart';
import 'package:gordon_app/conts/images.dart';

class AddProductDetails extends StatefulWidget {
  const AddProductDetails({super.key});

  @override
  State<AddProductDetails> createState() => _AddProductDetailsState();
}

class _AddProductDetailsState extends State<AddProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.45,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(sofaa_img), fit: BoxFit.fill),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.60,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30))),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextfield(
                    hintText: "Name",
                    maxLines: 1,
                  ),
                  CustomTextfield(
                    hintText: "Discription",
                    maxLines: 10,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
