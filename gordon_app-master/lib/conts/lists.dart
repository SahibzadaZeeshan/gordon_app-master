import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gordon_app/conts/images.dart';
import 'package:gordon_app/conts/strings.dart';
import 'package:gordon_app/views/auth_screens/login_screen.dart';
import 'package:gordon_app/views/auth_screens/signup_screen.dart';
import 'package:gordon_app/views/category_screens/all_category.dart';
import 'package:gordon_app/views/home_screens/home.dart';

const categoryList = [
  homeCTimg1,
  homeCTimg2,
  homeCTimg3,
  homeCTimg4,
  homeCTimg3,
  homeCTimg4,
];
const categoryListText = [table, chairs, wardrobe, beds, wardrobe, beds];
const all_CategoryList = [
  bathroom_furniture_img,
  kidsbed_img,
  kitechen_furniture_img,
  coffe_table_img,
  tv_Stands_img,
  Sofa_img
];
const all_CategoryListName = [
  bathroomFurniture,
  kidsBeds,
  kitchenFurniture,
  coffeeTables,
  tVStands,
  sofa
];
const all_CategoryClassNavigate=[
  Home(),
  AllCategory(),
  LoginScreen(),
  SignupScreen(),
  SignupScreen(),
  SignupScreen(),

];
