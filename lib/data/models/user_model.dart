///The model of the user.
class UserModel {
  String? email;
  List<String>? likes;

  UserModel({this.email, this.likes});

  UserModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    likes = json['likes'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['likes'] = likes;
    return data;
  }
}
