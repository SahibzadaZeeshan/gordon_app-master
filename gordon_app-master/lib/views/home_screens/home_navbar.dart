import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gordon_app/conts/images.dart';
import 'package:gordon_app/views/cart_screens.dart';
import 'package:gordon_app/views/category_screens/all_category.dart';
import 'package:gordon_app/views/home_screens/featured_screen.dart';
import 'package:gordon_app/views/home_screens/home.dart';
import 'package:gordon_app/views/profile/profile_screen.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../conts/styles.dart';
import '../auth_screens/login_screen.dart';

class HomeNavBar extends StatefulWidget {
  const HomeNavBar({super.key});

  @override
  State<HomeNavBar> createState() => _HomeNavBarState();
}

class _HomeNavBarState extends State<HomeNavBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  List className=[
    Home(),
    AllCategory(),
    CartScreen(),
    ProfileScreen(),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:className[_selectedIndex] ,
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels:true,
        unselectedItemColor:Colors.black ,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'HOME',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category_outlined),
            label: 'CATEGORIES',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'CART',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_3_outlined),
            label: 'PROFILE',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xff3669C9),
        onTap: _onItemTapped,
      ),
    );
  }
}
