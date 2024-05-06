class ProductModel {
  String? name;
  String? describtion;
  int? price;
  int? oldPrice;
  String? image;
  int? id;
  int? discount;

  ProductModel.fromJson({required Map<String, dynamic> data}) {
    name = data['name'].toString();
    describtion = data['description'].toString();
    price = data['price'] as int;
    oldPrice = data['old_price'] as int;
    id = data['id'] as int;
    discount = data['discount'] as int;
    image = data['image'].toString();
  }
}
