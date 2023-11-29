class ShoesModel {
  String img;
  String title;
  String price;

  ShoesModel({required this.img, required this.title, required this.price});
  factory ShoesModel.fromMap({required Map data}) {
    return ShoesModel(
      img: data['img'],
      title: data['title'],
      price: data['price'],
    );
  }
}
