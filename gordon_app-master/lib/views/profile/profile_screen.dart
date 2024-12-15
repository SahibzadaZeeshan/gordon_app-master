import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gordon_app/models/profile_screens_model/profile_screen.dart';
import 'package:gordon_app/views/home_screens/home.dart';
import 'package:gordon_app/views/profile/update_profile.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../conts/styles.dart';
import '../auth_screens/login_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}


class _ProfileScreenState extends State<ProfileScreen> {
  String name = "";
  String email = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _userDetails();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "Profile"
            .text
            .color(const Color(0xff3669C9))
            .fontFamily(bold)
            .size(18)
            .make(),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await FirebaseAuth.instance.signOut().then((value) => {
                    VxToast.show(context,
                        msg: "Log Out".text.make().toString()),
                    Get.offAll(() => const LoginScreen()),
                    10.widthBox,
                  });
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              20.heightBox,
              Row(
                children: [
                  Image.asset(
                    "assets/images/Ellipse 30.png",
                    fit: BoxFit.fill,
                  ).box.size(80, 80).clip(Clip.antiAlias).make(),
                  10.widthBox,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       Text(name,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 20)),
                      5.heightBox,
                       Text(email,
                          style: const TextStyle(
                              color: Color(0xff808080), fontSize: 14)),
                    ],
                  ),
                ],
              ),
              20.heightBox,
              ListView.builder(
                itemCount: tittleModel.length,
                shrinkWrap: true,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  tittleModel[index].navigateIcon));
                    },
                    title: Text(tittleModel[index].tittleName,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.black)),
                    trailing: IconButton(
                        icon: const Icon(Icons.arrow_forward_ios_rounded,
                            color: Colors.black),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    tittleModel[index].navigateIcon,
                              ));
                        }),
                  ).box.color(Color(0xffFAFAFA)).roundedSM.make(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<dynamic> tittleModel = [
    ProfileScreenModel(tittleName: "Profile", navigateIcon: const UpdateProfile()),
    ProfileScreenModel(
        tittleName: "Custom Product", navigateIcon: const Home()),
    ProfileScreenModel(tittleName: "Support", navigateIcon: const Home()),
    ProfileScreenModel(
        tittleName: "Order Tracking", navigateIcon: const Home()),
    ProfileScreenModel(
        tittleName: "Add shipping address", navigateIcon: const Home()),
  ];

  _userDetails() async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    var user =
        await FirebaseFirestore.instance.collection('user').doc(uid).get();
    name = user['name'];
    email = user['email'];
    setState(() {});
  }
}
