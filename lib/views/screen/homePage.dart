import 'dart:convert';

import 'package:extra_project/Model/catagoriesModel.dart';
import 'package:extra_project/Model/popularModel.dart';
import 'package:extra_project/views/Assets/Assets.dart';
import 'package:extra_project/views/Assets/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:like_button/like_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController textController = TextEditingController();

  List<Color> colors = [
    AppColors.pop1,
    AppColors.pop2,
    AppColors.pop3,
    AppColors.pop4,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: AppBar(
        backgroundColor: AppColors.bg,
        centerTitle: true,
        actions: [Icon(IconlyLight.bag), Gap(14)],
        leading: Image.asset(
          AppAssets.option,
          scale: 7,
        ),
        title: Text(
          "Home",
          style: GoogleFonts.montserrat(fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
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
              Gap(16),
              //discount
              Container(
                width: MediaQuery.of(context).size.width,
                height: 130,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xff7f52ba),
                      Color(0xff81cde3),
                    ],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Stack(
                    children: [
                      Container(
                        height: 150,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Color(0xff9682cc),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Gap(6),
                            Text(
                              "Get the special discount",
                              style: GoogleFonts.roboto(
                                  color: AppColors.kWhite,
                                  fontSize: 7,
                                  letterSpacing: 0.4),
                            ),
                            Text(
                              "50 %",
                              style: GoogleFonts.roboto(
                                color: AppColors.kWhite,
                                fontWeight: FontWeight.w500,
                                fontSize: 29,
                              ),
                            ),
                            Text(
                              "OFF",
                              style: GoogleFonts.roboto(
                                  color: AppColors.kWhite,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 29,
                                  letterSpacing: 0.4),
                            )
                          ],
                        ),
                      ),
                      Gap(20),
                      Positioned(
                        left: 130,
                        bottom: 0,
                        top: 4,
                        child: Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(AppAssets.disShoes),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 274,
                        bottom: 120,
                        top: 0,
                        child: LikeButton(
                          circleColor: const CircleColor(
                              start: Color(0xff00ddff), end: Color(0xff0099cc)),
                          bubblesColor: const BubblesColor(
                            dotPrimaryColor: Colors.pink,
                            dotSecondaryColor: Colors.white,
                          ),
                          likeBuilder: (bool isLiked) {
                            return Icon(
                              IconlyLight.heart,
                              color: isLiked ? Colors.red : Colors.white60,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Gap(14),
              Container(
                height: 50,
                child: FutureBuilder(
                    future:
                        rootBundle.loadString("lib/views/json/catagories.json"),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        String data = snapshot.data!;
                        Map decodedData = jsonDecode(data);

                        List myData = decodedData['data'];
                        List<CatagoriesModel> modelData = myData
                            .map((e) => CatagoriesModel.fromMap(data: e))
                            .toList();
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: modelData.length,
                          itemBuilder: (context, i) => Row(
                            children: [
                              Container(
                                height: 40,
                                width: modelData[i].widht,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    (i == 0)
                                        ? Image(
                                            image: AssetImage(modelData[i].img),
                                            height: 16,
                                          )
                                        : Image(
                                            image:
                                                NetworkImage(modelData[i].img),
                                            height: 16,
                                          ),
                                    Text(
                                      modelData[i].txt,
                                      style: GoogleFonts.montserrat(
                                          color: AppColors.kPrimary,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 13),
                                    ),
                                  ],
                                ),
                              ),
                              Gap(8)
                            ],
                          ),
                        );
                      }
                      return CircularProgressIndicator();
                    }),
              ),
              Gap(14),
              ////
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Popular",
                    style: AppAssets.textStyle,
                  ),
                  Text(
                    "View All",
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w600,
                      color: Colors.grey,
                      fontSize: 10,
                    ),
                  )
                ],
              ),
              Gap(12),

              FutureBuilder(
                future: rootBundle.loadString("lib/views/json/popular.json"),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    String data = snapshot.data!;
                    Map decodedData = jsonDecode(data);
                    List popular = decodedData['data'];

                    List<PopularModel> myData = popular
                        .map((e) => PopularModel.fromMap(data: e))
                        .toList();
                    return Container(
                      height: 410,
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
                            return InkWell(
                              borderRadius: BorderRadius.circular(12),
                              // splashColor: Color(0xffa5be27),
                              onTap: () {
                                Get.toNamed('/AllItemPage');
                              },
                              child: Container(
                                // height: 4,
                                width: 155,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: colors[i],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Gap(10),
                                      Image(
                                        alignment: Alignment.center,
                                        image: AssetImage(myData[i].img),
                                        height: myData[i].imgHight,
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
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                    );
                  }
                  return CircularProgressIndicator();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//
// Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Container(
//                     height: 180,
//                     width: 155,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(12),
//                       color: AppColors.pop1,
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Gap(10),
//                           Image(
//                             alignment: Alignment.center,
//                             image: AssetImage(AppAssets.nike),
//                             height: 78,
//                           ),
//                           Gap(24),
//                           Text(
//                             "Nike Shoes",
//                             style: GoogleFonts.montserrat(
//                                 color: Colors.grey.shade700,
//                                 fontWeight: FontWeight.w600),
//                           ),
//                           Gap(1),
//                           Text(
//                             "\$12.00",
//                             style: GoogleFonts.montserrat(
//                                 // color: Colors.grey.shade700,
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   Spacer(),
//                   Container(
//                     height: 200,
//                     width: 155,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(12),
//                       color: AppColors.pop2,
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Gap(10),
//                           Image(
//                             alignment: Alignment.centerRight,
//                             image: AssetImage(AppAssets.chair),
//                             height: 100,
//                           ),
//                           Gap(24),
//                           Align(
//                             alignment: Alignment.centerLeft,
//                             child: Text(
//                               "Chair",
//                               style: GoogleFonts.montserrat(
//                                   color: Colors.grey.shade700,
//                                   fontWeight: FontWeight.w600),
//                             ),
//                           ),
//                           Gap(1),
//                           Align(
//                             alignment: Alignment.centerLeft,
//                             child: Text(
//                               "\$30.00",
//                               style: GoogleFonts.montserrat(
//                                   // color: Colors.grey.shade700,
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//
//               ///
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Container(
//                     height: 190,
//                     width: 155,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(12),
//                       color: AppColors.pop3,
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Gap(10),
//                           Image(
//                             alignment: Alignment.center,
//                             image: AssetImage(AppAssets.watch),
//                             height: 90,
//                           ),
//                           Gap(24),
//                           Align(
//                             alignment: Alignment.centerLeft,
//                             child: Text(
//                               "Watch",
//                               style: GoogleFonts.montserrat(
//                                   color: Colors.grey.shade700,
//                                   fontWeight: FontWeight.w600),
//                             ),
//                           ),
//                           Gap(1),
//                           Align(
//                             alignment: Alignment.centerLeft,
//                             child: Text(
//                               "\$10.00",
//                               style: GoogleFonts.montserrat(
//                                   // color: Colors.grey.shade700,
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   Spacer(),
//                   Container(
//                     height: 210,
//                     width: 155,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(12),
//                       color: AppColors.pop4,
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Gap(10),
//                           Image(
//                             alignment: Alignment.centerRight,
//                             image: AssetImage(AppAssets.plants),
//                             height: 110,
//                           ),
//                           Gap(24),
//                           Align(
//                             alignment: Alignment.centerLeft,
//                             child: Text(
//                               "Plants",
//                               style: GoogleFonts.montserrat(
//                                   color: Colors.grey.shade700,
//                                   fontWeight: FontWeight.w600),
//                             ),
//                           ),
//                           Gap(1),
//                           Align(
//                             alignment: Alignment.centerLeft,
//                             child: Text(
//                               "\$7.00",
//                               style: GoogleFonts.montserrat(
//                                   // color: Colors.grey.shade700,
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               )
