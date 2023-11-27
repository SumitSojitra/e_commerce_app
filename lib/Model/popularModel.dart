import 'dart:ui';

class PopularModel {
  double hight;
  String color;
  String img;
  String title;
  String price;

  PopularModel(
      {required this.img,
      required this.title,
      required this.color,
      required this.hight,
      required this.price});
  factory PopularModel.fromMap({required Map data}) {
    return PopularModel(
      img: data['img'],
      title: data['title'],
      color: data['color'],
      hight: data['hight'],
      price: data['price'],
    );
  }
}
