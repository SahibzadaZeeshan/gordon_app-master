import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:gordon_app/views/add_product/add_product_details.dart';
import 'package:gordon_app/views/auth_screens/login_screen.dart';
import 'package:gordon_app/views/auth_screens/reset_password.dart';
import 'package:gordon_app/views/auth_screens/signup_screen.dart';
import 'package:gordon_app/views/auth_screens/verification_screen.dart';
import 'package:gordon_app/views/cart_screens.dart';
import 'package:gordon_app/views/category_screens/all_category.dart';
import 'package:gordon_app/views/category_screens/items_details.dart';
import 'package:gordon_app/views/category_screens/items_screen.dart';
import 'package:gordon_app/views/home_screens/home.dart';
import 'package:gordon_app/views/home_screens/home_navbar.dart';
import 'package:gordon_app/views/profile/profile_screen.dart';
import 'package:gordon_app/views/profile/update_profile.dart';
import 'package:gordon_app/views/splash/splash_screen.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xffFFFFFF),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          titleTextStyle: TextStyle(
              color: Color(0xff000000),
              fontSize: 16,
              fontWeight: FontWeight.bold),
          elevation: 1,
          backgroundColor: Color(0xffFFFFFF),
          iconTheme: IconThemeData(
            color: Colors.black,
            size: 24,
          ),
        ),
      ),
      home:Home(),
    );
  }
}
