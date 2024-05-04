class UserModel {
  int id;
  String name;
  String email;
  String phone;
  String image;
  String token;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.image,
    required this.token,
  });

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
        id: json["data"]["id"],
        name: json["data"]["name"],
        email: json["data"]["email"],
        phone: json["data"]["phone"],
        image: json["data"]["image"],
        token: json["data"]["token"],
      );
}
