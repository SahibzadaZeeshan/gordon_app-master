import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gordon_app/views/profile/update_profile.dart';

import '../../common_widgets/custom_textfield.dart';
import '../../common_widgets/our_button.dart';

class SaveChanges extends StatefulWidget {
  const SaveChanges({super.key});

  @override
  State<SaveChanges> createState() => _SaveChangesState();
}

class _SaveChangesState extends State<SaveChanges> {
  @override
  final TextEditingController _fullname = TextEditingController();

  final TextEditingController _email = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UpdateProfile(),
                  ));
            },
            child: Icon(Icons.arrow_back_ios)),
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
                  title: "Full Name", isOb: false, controller: _fullname),
              CustomTextfield(title: "Email", isOb: false, controller: _email),
              SizedBox(height: MediaQuery.of(context).size.height * 0.32),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: OurButton(
                  title: "Save Changes",
                  onPress: () {
                   _updateUserDetails();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _updateUserDetails() async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    FirebaseFirestore.instance.collection('user').doc(uid).set({
      "name": _fullname.text,
    },SetOptions(merge: true));
    setState(() {

    });
  }
}
