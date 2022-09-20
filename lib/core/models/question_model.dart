class QuestionModel {
  QuestionModel({
    required this.id,
    required this.question,
    required this.description,
    required this.answers,
    required this.multipleCorrectAnswers,
    required this.correctAnswers,
    required this.correctAnswer,
    required this.explanation,
    required this.tip,
    required this.tags,
    required this.category,
    required this.difficulty,
  });

  int id;
  String question;
  dynamic description;
  Map<String, String?> answers;
  String multipleCorrectAnswers;
  Map<String, String> correctAnswers;
  String? correctAnswer;
  dynamic explanation;
  dynamic tip;
  List<Tag> tags;
  String category;
  String difficulty;

  factory QuestionModel.fromJson(Map<String, dynamic> json) => QuestionModel(
        id: json['id'],
        question: json['question'],
        description: json['description'],
        answers: Map<String, String?>.from(json['answers']),
        multipleCorrectAnswers: json['multiple_correct_answers'],
        correctAnswers: Map<String, String>.from(json['correct_answers']),
        correctAnswer: json['correct_answer'],
        explanation: json['explanation'],
        tip: json['tip'],
        tags: List<Tag>.from(json['tags'].map((x) => Tag.fromJson(x))),
        category: json['category'],
        difficulty: json['difficulty'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'question': question,
        'description': description,
        'answers': answers,
        'multiple_correct_answers': multipleCorrectAnswers,
        'correct_answers': correctAnswers,
        'correct_answer': correctAnswer,
        'explanation': explanation,
        'tip': tip,
        'tags': List<dynamic>.from(tags.map((x) => x.toJson())),
        'category': category,
        'difficulty': difficulty,
      };
}

class Tag {
  Tag({
    required this.name,
  });

  String name;

  factory Tag.fromJson(Map<String, dynamic> json) => Tag(
        name: json['name'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
      };
}
