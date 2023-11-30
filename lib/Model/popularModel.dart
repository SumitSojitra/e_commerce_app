import 'dart:ui';

class PopularModel {
  double hight;
  double imgHight;
  String color;
  String img;
  String title;
  String price;
  String json;

  PopularModel({
    required this.img,
    required this.title,
    required this.color,
    required this.hight,
    required this.price,
    required this.imgHight,
    required this.json,
  });

  factory PopularModel.fromMap({required Map data}) {
    return PopularModel(
      img: data['img'],
      title: data['title'],
      color: data['color'],
      hight: data['hight'],
      imgHight: data['imgHight'],
      price: data['price'],
      json: data['json'],
    );
  }
}
