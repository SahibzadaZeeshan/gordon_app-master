import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gordon_app/views/auth_screens/login_screen.dart';
import 'package:gordon_app/views/home_screens/home_navbar.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Timer(Duration(seconds: 3), () { _checkuser();});
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text("Splash Screen")),
        ],
      ) ,
    );
  }

  _checkuser()  async{
   User? user=FirebaseAuth.instance.currentUser;
   if(user != null){
     Navigator.push(context, MaterialPageRoute(builder: (context) => HomeNavBar(),));
   }
   else{
     Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
   }
  }
}
