class WatchModel {
  String img;
  String title;
  String price;

  WatchModel({required this.img, required this.title, required this.price});
  factory WatchModel.fromMap({required Map data}) {
    return WatchModel(
      img: data['img'],
      title: data['title'],
      price: data['price'],
    );
  }
}
