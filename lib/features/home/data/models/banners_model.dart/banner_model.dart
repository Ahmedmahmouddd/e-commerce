class BannerModel {
  int? id;
  String? imageUrl;

  BannerModel.fromJson({required Map<String, dynamic> data}) {
    id = data['id'];
    imageUrl = data['image'];
  }
}
