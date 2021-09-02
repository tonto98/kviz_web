class Answer {
  String id;
  String order;
  String answer;
  String question;

  Answer({
    required this.id,
    required this.order,
    required this.answer,
    required this.question,
  });
  factory Answer.fromJson(Map<String, dynamic> json) {
    return Answer(
      id: json["id"],
      order: json["order"],
      answer: json["answer"],
      question: json["question"],
    );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["id"] = id;
    data["order"] = order;
    data["answer"] = answer;
    data["question"] = question;
    return data;
  }
}
