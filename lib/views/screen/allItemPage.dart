import 'dart:convert';

import 'package:extra_project/Model/popularModel.dart';
import 'package:extra_project/Model/shoesModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';

import '../Assets/Assets.dart';
import '../Assets/colors.dart';

class AllItemPage extends StatefulWidget {
  const AllItemPage({super.key});

  @override
  State<AllItemPage> createState() => _AllItemPageState();
}

class _AllItemPageState extends State<AllItemPage> {
  TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    PopularModel data =
        ModalRoute.of(context)!.settings.arguments as PopularModel;

    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: AppBar(
          backgroundColor: AppColors.bg,
          centerTitle: true,
          actions: [Icon(IconlyLight.bag), Gap(14)],
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //search
              Container(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                        offset: const Offset(12, 26),
                        blurRadius: 50,
                        spreadRadius: 0,
                        color: Colors.grey.withOpacity(.1)),
                  ]),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 6,
                        child: TextField(
                          controller: textController,
                          onChanged: (value) {
                            //Do something wi
                          },
                          decoration: const InputDecoration(
                            suffixIcon: Icon(
                              IconlyLight.search,
                              color: Colors.grey,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "Search...",
                            hintStyle: TextStyle(color: Colors.grey),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.0)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 1.0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.0)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 2.0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.0)),
                            ),
                          ),
                        ),
                      ),
                      Gap(10),
                      Expanded(
                        child: Container(
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                            color: AppColors.kPrimary,
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Icon(
                            IconlyLight.filter,
                            color: AppColors.kWhite,
                          ),
                        ),
                      )
                    ],
                  )),
              Gap(10),
              //
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Sport Shoes",
                    style: AppAssets.textStyle,
                  ),
                  Container(
                    height: 26,
                    width: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: AppColors.kWhite),
                    alignment: Alignment.center,
                    child: Text(
                      "Sort By '",
                      style: GoogleFonts.montserrat(
                        fontSize: 10,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                ],
              ),
              Gap(10),
              FutureBuilder(
                future: rootBundle.loadString(data.json),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    String data = snapshot.data!;
                    Map decodedData = jsonDecode(data);
                    List popular = decodedData['data'];

                    List<ShoesModel> myData = popular
                        .map((e) => ShoesModel.fromMap(data: e))
                        .toList();
                    return Container(
                      height: 840,
                      child: GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisExtent: 200,
                                mainAxisSpacing: 12,
                                crossAxisSpacing: 12),
                        itemCount: myData.length,
                        itemBuilder: (BuildContext context, int i) {
                          return Stack(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed('/DetailPage',
                                      arguments: myData[i]);
                                },
                                child: Container(
                                  height: 200,
                                  width: 155,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: AppColors.kWhite,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Gap(10),
                                        Image(
                                          alignment: Alignment.center,
                                          image: AssetImage(myData[i].img),
                                          height: 78,
                                        ),
                                        Gap(24),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            myData[i].title,
                                            style: GoogleFonts.montserrat(
                                                color: Colors.grey.shade700,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                        Gap(1),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            myData[i].price,
                                            style: GoogleFonts.montserrat(
                                                // color: Colors.grey.shade700,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: RatingBar.builder(
                                            initialRating: 3,
                                            itemSize: 14,
                                            minRating: 1,
                                            direction: Axis.horizontal,
                                            allowHalfRating: true,
                                            itemCount: 5,
                                            itemPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 0),
                                            itemBuilder: (context, _) => Icon(
                                                Icons.star,
                                                color: AppColors.kPrimary),
                                            onRatingUpdate: (rating) {},
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 154,
                                left: 116,
                                child: Container(
                                  height: 30,
                                  width: 30,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColors.kPrimary),
                                  alignment: Alignment.center,
                                  child: const Icon(
                                    IconlyLight.bag,
                                    size: 18,
                                    color: AppColors.kWhite,
                                  ),
                                ),
                              )
                            ],
                          );
                        },
                      ),
                    );
                  }
                  return const CircularProgressIndicator();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/*


*/
