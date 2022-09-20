import 'package:app_fox/core/http/api_provider.dart';
import 'package:app_fox/core/models/question_model.dart';
import 'package:mobx/mobx.dart';

part 'game_setup_store.g.dart';

class GameSetupStore = _GameSetupStore with _$GameSetupStore;

abstract class _GameSetupStore with Store {
  static const List<String> _category = [
    'Linux',
    'BASH',
    'Docker',
    'DevOps',
  ];

  static const List<String> _difficulty = [
    'Easy',
    'Medium',
    'Hard',
  ];

  List<QuestionModel> questions = [];

  @observable
  bool isLoading = false;

  @observable
  bool isSuccess = false;

  @observable
  String selectedCategory = 'Linux';

  @observable
  String selectedDifficulty = 'Easy';

  List<String> get category => _category;

  List<String> get difficulty => _difficulty;

  @action
  void setDifficulty(String value) => selectedDifficulty = value;

  @action
  void setCategory(String value) => selectedCategory = value;

  @action
  Future<void> getQuestions() async {
    try {
      isLoading = true;
      questions = await Api().getQuestions(
        category: selectedCategory,
        difficulty: selectedDifficulty,
      );
      isLoading = false;
      isSuccess = true;
    } catch (e, trace) {
      print('Error: $e');
      print('Error: $trace');
      isLoading = false;
      isSuccess = false;
    }
  }
}
