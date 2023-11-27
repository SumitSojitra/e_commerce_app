class CatagoriesModel {
  String img;
  String txt;
  double widht;

  CatagoriesModel({required this.img, required this.txt, required this.widht});
  factory CatagoriesModel.fromMap({required Map data}) {
    return CatagoriesModel(
      img: data['img'],
      txt: data['txt'],
      widht: data['widht'],
    );
  }
}
