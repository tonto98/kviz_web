// class Category {
//   late String id;
//   late Map<String, String> answers;
//   late Map<String, String> questions;
//   late String name;
//   late List<Submissions> submissions;

//   Category(
//       {required this.id, required this.answers, required this.questions, required this.name, required this.submissions});

//   Category.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     answers =
//         json['answers'] != null ? new Answers.fromJson(json['answers']) : null;
//     questions = json['questions'] != null
//         ? new Answers.fromJson(json['questions'])
//         : null;
//     name = json['name'];
//     if (json['submissions'] != null) {
//       submissions = new List<Submissions>();
//       json['submissions'].forEach((v) {
//         submissions.add(new Submissions.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     if (this.answers != null) {
//       data['answers'] = this.answers.toJson();
//     }
//     if (this.questions != null) {
//       data['questions'] = this.questions.toJson();
//     }
//     data['name'] = this.name;
//     if (this.submissions != null) {
//       data['submissions'] = this.submissions.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
