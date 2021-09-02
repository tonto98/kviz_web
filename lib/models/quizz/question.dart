class Question {
  String id;
  String order;
  String question;
  String answer;

  Question({
    required this.id,
    required this.order,
    required this.question,
    required this.answer,
  });
  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json["id"],
      order: json["order"],
      question: json["question"],
      answer: json["answer"],
    );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["id"] = id;
    data["order"] = order;
    data["question"] = question;
    data["answer"] = answer;
    return data;
  }
}
