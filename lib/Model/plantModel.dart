class PlantModel {
  String img;
  String title;
  String price;

  PlantModel({required this.img, required this.title, required this.price});
  factory PlantModel.fromMap({required Map data}) {
    return PlantModel(
      img: data['img'],
      title: data['title'],
      price: data['price'],
    );
  }
}
