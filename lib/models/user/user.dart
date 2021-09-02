class User {
  String? id;
  String? photoUrl;
  String? email;
  bool? isAdmin;
  String? uid;
  String? name;

  User({
    this.id,
    this.photoUrl,
    this.email,
    this.isAdmin,
    this.uid,
    this.name,
  });
  User.fromJson(Map<String, dynamic> json) {
    id = json["id"]?.toString();
    photoUrl = json["photoUrl"]?.toString();
    email = json["email"]?.toString();
    isAdmin = json["isAdmin"];
    uid = json["uid"]?.toString();
    name = json["name"]?.toString();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["id"] = id;
    data["photoUrl"] = photoUrl;
    data["email"] = email;
    data["isAdmin"] = isAdmin;
    data["uid"] = uid;
    data["name"] = name;
    return data;
  }
}