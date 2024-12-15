import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gordon_app/common_widgets/custom_textfield.dart';
import 'package:gordon_app/common_widgets/our_button.dart';
import 'package:gordon_app/conts/images.dart';
import 'package:gordon_app/views/profile/save_changes.dart';
import 'package:velocity_x/velocity_x.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({super.key});

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  String name = "";
  String email = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getUserDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios),
        title: Text("Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Stack(
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage("assets/images/Ellipse 30.png"),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Positioned(
                    bottom: 5,
                    right: 2,
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Color(0xff3669C9)),
                      child: Center(
                        child: GestureDetector(
                            onTap: () {},
                            child: Icon(
                              Icons.edit,
                              color: Colors.white,
                              size: 20,
                            )),
                      ),
                    ),
                  ),
                ],
              ),
              CustomTextfield(
                  title: "Full Name",
                  hintText: name,
                  isOb: false,
                  controller: _fullnameController),
              CustomTextfield(
                  hintText: email,
                  title: "Email",
                  isOb: false,
                  controller: _emailController),
              SizedBox(height: MediaQuery.of(context).size.height * 0.32),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: OurButton(
                  title: "Update",
                  onPress: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SaveChanges(),
                        ));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _getUserDetails() async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    var user =
        await FirebaseFirestore.instance.collection('user').doc(uid).get();
    name = user['name'];
    email = user['email'];
    setState(() {});
  }
}
