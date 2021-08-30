// import 'package:kviz_web/models/category.dart';

// class Quizz {
//   late String id;
//   late String name;
//   late String author;
//   late List<Category> categories;

//   Quizz({
//     required this.id,
//     required this.name,
//     required this.author,
//     required this.categories,
//   });

//   Quizz.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     author = json['author'];
//     if (json['categories'] != null) {
//       categories = [];
//       json['categories'].forEach((v) {
//         categories.add(new Category.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['author'] = this.author;
//     if (this.categories != null) {
//       data['categories'] = this.categories.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
