class ChairModel {
  String img;
  String title;
  String price;

  ChairModel({required this.img, required this.title, required this.price});
  factory ChairModel.fromMap({required Map data}) {
    return ChairModel(
      img: data['img'],
      title: data['title'],
      price: data['price'],
    );
  }
}
