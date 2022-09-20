import 'package:app_fox/core/models/question_model.dart';
import 'package:app_fox/features/game/store/game_store.dart';
import 'package:app_fox/features/game/widgets/question_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class QuestionPage extends StatefulWidget {
  final QuestionModel question;
  final GameStore store;
  final int index;

  const QuestionPage({
    required this.question,
    required this.store,
    required this.index,
    Key? key,
  }) : super(key: key);

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  String answerName = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          widget.question.question,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 20),
        Observer(
          builder: (_) {
            return QuestionCard(
              answers: widget.question.answers,
              onChanged: (value) {
                widget.question.answers.forEach((key, answer) {
                  if (answer == value) {
                    answerName = key;
                  }
                });
                widget.store.setAnswer(
                  answerName: answerName,
                  answerValue: value!,
                  index: widget.index,
                );
                setState(() {});
              },
              value: widget.store.selectedAnswer[widget.index][answerName]!,
            );
          },
        ),
      ],
    );
  }
}
