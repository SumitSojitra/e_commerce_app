import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';

import '../Assets/colors.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: AppBar(
        backgroundColor: AppColors.bg,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(IconlyLight.bag),
          ),
          Gap(14)
        ],
        leading: IconButton(
          onPressed: () {
            Get.back;
          },
          icon: Icon(
            CupertinoIcons.back,
            color: AppColors.kPrimary,
          ),
        ),
        title: Text(
          "Cart",
          style: GoogleFonts.montserrat(fontWeight: FontWeight.w600),
        ),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
