import 'package:extra_project/views/screen/CartPage.dart';
import 'package:extra_project/views/screen/allItemPage.dart';
import 'package:extra_project/views/screen/navigationPage.dart';
import 'package:extra_project/views/screen/onBoardPage.dart';
import 'package:extra_project/views/screen/productDetailPage.dart';
import 'package:extra_project/views/screen/signInPage.dart';
import 'package:extra_project/views/screen/signUpPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      useMaterial3: true,
    ),
    getPages: [
      GetPage(
        name: '/',
        page: () => Navigation(),
      ),
      GetPage(
        name: '/SignIn',
        page: () => SignInPage(),
      ),
      GetPage(
        name: '/SignUp',
        page: () => SignUpPage(),
      ),
      GetPage(
        name: '/AllItemPage',
        page: () => AllItemPage(),
      ),
      GetPage(
        name: "/DetailPage",
        page: () => DetailPage(),
      ),
      GetPage(
        name: "/CartPage",
        page: () => CartPage(),
      )
    ],
  ));
}
