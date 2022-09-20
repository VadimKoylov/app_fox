import 'package:app_fox/core/models/question_model.dart';
import 'package:app_fox/features/app/components/app_button.dart';
import 'package:app_fox/features/app/components/dialog.dart';
import 'package:app_fox/features/game/store/game_store.dart';
import 'package:app_fox/features/game/widgets/question_page.dart';
import 'package:app_fox/features/results/results.dart';
import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';

class GamePage extends StatefulWidget {
  final List<QuestionModel> questions;

  const GamePage({
    required this.questions,
    Key? key,
  }) : super(key: key);

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  final store = GameStore();

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 10)
      ..addListener(() {
        setState(() {});
      });
    store.setCategory(widget.questions[0].category);
    store.setDifficulty(widget.questions[0].difficulty);
    super.initState();
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
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              children: [
                Text(
                  '${store.category}, '
                  '${store.difficulty}',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      for (int index = 0; index < 10; index++)
                        QuestionPage(
                          question: widget.questions[index],
                          store: store,
                          index: index,
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                DotsIndicator(
                  dotsCount: 10,
                  position: _tabController.index.toDouble(),
                  decorator: const DotsDecorator(
                    color: Colors.black87,
                    activeColor: Colors.redAccent,
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: AppButton(
          onPressed: () {
            if (_tabController.index != 9) {
              _tabController.animateTo(
                _tabController.index + 1,
                duration: const Duration(microseconds: 250),
                curve: Curves.easeInOutCubic,
              );
            } else {
              store.getResult(widget.questions);
              AppDialog.showInfoAlertDialog(
                context,
                content: 'Are you sure you want to end the game?',
                okPressed: () {
                  Navigator.of(context, rootNavigator: true).pushReplacement(
                    MaterialPageRoute(
                      builder: (BuildContext context) => Results(
                        result: store.result!,
                      ),
                    ),
                  );
                },
              );
            }
          },
          color: Colors.blue,
          title: _tabController.index != 9 ? 'Next' : 'Finish',
        ),
      ),
    );
  }
}
