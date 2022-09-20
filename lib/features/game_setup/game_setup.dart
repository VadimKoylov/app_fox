import 'package:app_fox/features/app/components/app_button.dart';
import 'package:app_fox/features/game/game_page.dart';
import 'package:app_fox/features/game_setup/store/game_setup_store.dart';
import 'package:app_fox/features/game_setup/widgets/drop_down_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class GameSetup extends StatefulWidget {
  const GameSetup({Key? key}) : super(key: key);

  @override
  State<GameSetup> createState() => _GameSetupState();
}

class _GameSetupState extends State<GameSetup> {
  final store = GameSetupStore();

  void goNext() {
    Navigator.of(context, rootNavigator: true).push(
      MaterialPageRoute(
        builder: (BuildContext context) => GamePage(questions: store.questions),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Quiz App',
            style: TextStyle(
              color: Colors.white,
              fontSize: 34,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        body: Observer(
          builder: (_) => store.isLoading
              ? const Center(
                  child: CircularProgressIndicator.adaptive(),
                )
              : Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Choose the theme and difficulty of the game',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 20),
                      DropDownWidget(
                        value: store.selectedCategory,
                        onChanged: (String? value) {
                          store.setCategory(value!);
                        },
                        items: store.category,
                      ),
                      const SizedBox(height: 20),
                      DropDownWidget(
                        value: store.selectedDifficulty,
                        onChanged: (String? value) {
                          store.setDifficulty(value!);
                        },
                        items: store.difficulty,
                      ),
                    ],
                  ),
                ),
        ),
        bottomNavigationBar: Observer(
          builder: (_) => AppButton(
            onPressed: store.isLoading
                ? null
                : () async {
                    await store.getQuestions();
                    if (store.isSuccess) goNext();
                  },
            color: Colors.blue,
            title: 'Start game',
          ),
        ),
      ),
    );
  }
}
