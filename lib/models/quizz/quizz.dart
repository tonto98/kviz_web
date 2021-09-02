import 'package:kviz_web/models/quizz/category.dart';

class Quizz {
  String id;
  String author;
  String name;
  List<Category> categories;

  Quizz({
    required this.id,
    required this.author,
    required this.name,
    required this.categories,
  });
  factory Quizz.fromJson(Map<String, dynamic> json) {
    var id = json["id"] ?? json["id"];
    var author = json["author"] ?? json["author"];
    var name = json["name"] ?? json["name"];
    final v = json["categories"] ?? json["categories"];
    final arr0 = <Category>[];
    v.forEach((v) {
      arr0.add(Category.fromJson(v));
    });
    var categories = arr0;
    return Quizz(id: id, author: author, name: name, categories: categories);
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["id"] = id;
    data["author"] = author;
    data["name"] = name;
    if (categories != null) {
      final v = categories;
      final arr0 = [];
      v.forEach((v) {
        arr0.add(v.toJson());
      });
      data["categories"] = arr0;
    }
    return data;
  }
}
