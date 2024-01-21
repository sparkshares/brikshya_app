class ProfileModel {
  int? id;
  String? email;
  String? name;
  int? phone;
  int? role;
  String? createdAt;

  ProfileModel({this.id, this.email, this.name, this.role, this.createdAt});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    phone = json['phone'];

    name = json['name'];
    role = json['role'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['name'] = this.name;
    data['role'] = this.role;
    data['created_at'] = this.createdAt;
    return data;
  }
}
