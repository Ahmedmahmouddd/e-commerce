class CategoryModel {
  int? id;
  String? imageUrl;
  String? name;

  CategoryModel.fromJson({required Map<String, dynamic> data}) {
    id = data['id'];
    imageUrl = data['image'];
    name = data['name'];
  }
}
