import 'package:app_fox/core/models/question_model.dart';
import 'package:mobx/mobx.dart';

part 'game_store.g.dart';

class GameStore = _GameStore with _$GameStore;

abstract class _GameStore with Store {
  @observable
  List<Map<String, String?>> selectedAnswer =
      List.generate(10, (index) => {'': ''});

  Result? result;

  String category = '';

  String difficulty = '';

  int correctAnswers = 0;

  void setCategory(String value) => category = value;

  void setDifficulty(String value) => difficulty = value;

  @action
  void setAnswer({
    required String answerName,
    required String answerValue,
    required int index,
  }) {
    selectedAnswer[index].clear();
    selectedAnswer[index][answerName] = answerValue;
  }

  void getResult(List<QuestionModel> questions) {
    for (int i = 0; i < 10; i++) {
      for (var e in questions[i].correctAnswers.keys) { 
        if (e.contains(selectedAnswer[i].keys.first)){
          if (questions[i].correctAnswers[e] == 'true'){
            correctAnswers++;
          }
        }
      }
    }
    result = Result(
      time: DateTime.now(),
      category: category,
      difficulty: difficulty,
      correctAnswers: correctAnswers,
      incorrectAnswers: 10 - correctAnswers,
    );
  }
}

class Result {
  final DateTime time;
  final String category;
  final String difficulty;
  final int correctAnswers;
  final int incorrectAnswers;

  Result({
    required this.time,
    required this.category,
    required this.difficulty,
    required this.correctAnswers,
    required this.incorrectAnswers,
  });

  Map<String, dynamic> toMap() => {
        'time': time,
        'category': category,
        'difficulty': difficulty,
        'correctAnswers': correctAnswers,
        'incorrectAnswers': incorrectAnswers,
      };
}
