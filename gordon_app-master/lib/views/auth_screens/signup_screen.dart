import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gordon_app/views/auth_screens/login_screen.dart';
import 'package:gordon_app/views/home_screens/home.dart';
import 'package:gordon_app/views/home_screens/home_navbar.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../common_widgets/custom_textfield.dart';
import '../../common_widgets/our_button.dart';
import '../../conts/styles.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailContoller = TextEditingController();
  final TextEditingController _nameContoller = TextEditingController();

  final TextEditingController _passwordContoller = TextEditingController();
 final TextEditingController _conformpasswordContoller = TextEditingController();
  bool isLoading=false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ));
            },
            child: const Icon(Icons.arrow_back_ios)),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              "Create An Account"
                  .text
                  .fontWeight(FontWeight.bold)
                  .size(24)
                  .make(),
              25.heightBox,
              "Enter the given details to create an account"
                  .text
                  .color(const Color(0xff838589))
                  .size(15)
                  .make(),
              40.heightBox,
              CustomTextfield(
                isOb: false,
                controller: _emailContoller,
                title: "Enter Your Email",
                hintText: "example@gmail.com",
              ),
              25.heightBox,
              CustomTextfield(
                isOb: false,
                controller: _nameContoller,
                title: "User Name",
                hintText: "Berlin",
              ),
              25.heightBox,
              CustomTextfield(
                isOb: true,
                controller: _passwordContoller,
                title: "Password",
                hintText: "******",
                suffIcon: const Icon(
                  Icons.visibility,
                  size: 25,
                  color: Colors.black,
                ),
              ),
              25.heightBox,
              CustomTextfield(
                isOb: true,
                controller: _conformpasswordContoller,
                title: "Conform Password",
                hintText: "******",
                suffIcon: const Icon(
                  Icons.visibility,
                  size: 25,
                  color: Colors.black,
                ),
              ),
              25.heightBox,
              SizedBox(
                height: 50,
                width: context.screenWidth - 40,
                child: OurButton(
                  onPress:() async{
                    setState(() {
                      isLoading=true;
                    });
                    await Future.delayed(Duration(seconds: 3));
                    _register();
                    setState(() {
                      isLoading=false;
                    });
                  },
                  title: "Confirmation",
                  textColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _register() async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
          email:_emailContoller.text, password: _passwordContoller.text)
          .then((value) async {
        String uid = FirebaseAuth.instance.currentUser!.uid;
        await FirebaseFirestore.instance.collection("user").doc(uid).set({
          "name": _nameContoller.text,
          "email": _emailContoller.text,
          "password": _passwordContoller.text,

        }).then((value) => {
        VxToast.show(context, msg: "Register Successfully".toString()),
        Get.to(()=> const HomeNavBar()),
        });
      });
    } on FirebaseException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }
}
