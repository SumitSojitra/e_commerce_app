import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:extra_project/Model/shoesModel.dart';

import '../Assets/colors.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController buttonController;
  final Duration _animationDuration = const Duration(milliseconds: 300);
  final Tween<double> _tween = Tween<double>(begin: 1.0, end: 0.95);

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: _animationDuration,
    )..addListener(() {
        setState(() {});
      });

    buttonController = AnimationController(
      vsync: this,
      duration: _animationDuration,
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    buttonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ShoesModel data = ModalRoute.of(context)!.settings.arguments as ShoesModel;

    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: AppBar(
          backgroundColor: AppColors.kWhite,
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  Get.toNamed('/CartPage');
                },
                icon: Icon(IconlyLight.bag)),
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
          )
          // title: Text(
          //   "Home",
          //   style: GoogleFonts.montserrat(fontWeight: FontWeight.w600),
          // ),
          ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            color: AppColors.kWhite,
            alignment: Alignment.topCenter,
            child: Image(image: AssetImage(data.img)),
          ),
          Container(
            height: 500,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.dt,
              borderRadius: BorderRadius.circular(50),
            ),
            padding: EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      data.title,
                      style: GoogleFonts.montserrat(
                          fontSize: 24,
                          color: Colors.grey.shade700,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      data.price,
                      style: GoogleFonts.montserrat(
                          // color: Colors.grey.shade700,
                          fontSize: 24,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                Gap(5),
                RatingBar.builder(
                  initialRating: 3,
                  itemSize: 20,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 1),
                  itemBuilder: (context, _) =>
                      Icon(Icons.star, color: AppColors.kPrimary),
                  onRatingUpdate: (rating) {},
                ),
                Gap(30),
                Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                  style: GoogleFonts.montserrat(
                    height: 1.8,
                    fontSize: 14,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 140,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.kPrimary,
              borderRadius: BorderRadius.circular(36),
            ),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    buttonController.forward().then((_) {
                      buttonController.reverse();
                    });
                    // widget.onTap();
                  },
                  child: ScaleTransition(
                    scale: _tween.animate(
                      CurvedAnimation(
                        parent: buttonController,
                        curve: Curves.easeOut,
                        reverseCurve: Curves.easeIn,
                      ),
                    ),
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 2, color: AppColors.kWhite),
                      ),
                      alignment: Alignment.center,
                      child: Icon(
                        IconlyLight.heart,
                        color: AppColors.kWhite,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _controller.forward().then((_) {
                      _controller.reverse();
                    });
                    // widget.onTap();
                  },
                  child: ScaleTransition(
                      scale: _tween.animate(
                        CurvedAnimation(
                          parent: _controller,
                          curve: Curves.easeOut,
                          reverseCurve: Curves.easeIn,
                        ),
                      ),
                      child: Container(
                        height: 50,
                        width: 200,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.kWhite,
                        ),
                        child: Text(
                          'Add To Cart',
                          style: GoogleFonts.montserrat(
                              fontSize: 16,
                              color: AppColors.kPrimary,
                              fontWeight: FontWeight.w500),
                        ),
                      )),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
