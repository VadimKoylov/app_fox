import 'package:app_fox/features/app/components/app_button.dart';
import 'package:app_fox/features/game/store/game_store.dart';
import 'package:app_fox/features/game_setup/game_setup.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Results extends StatefulWidget {
  final Result result;

  const Results({
    required this.result,
    Key? key,
  }) : super(key: key);

  @override
  State<Results> createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  bool isSave = false;

  Future<void> saveResult(BuildContext context) async {
    final db = FirebaseFirestore.instance;
    await db.collection("results").add(widget.result.toMap());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Results',
            style: TextStyle(
              color: Colors.white,
              fontSize: 34,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        body: SizedBox.expand(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Category: ${widget.result.category}',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Difficulty: ${widget.result.difficulty}',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Correct: ${widget.result.correctAnswers}',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Incorrect: ${widget.result.incorrectAnswers}',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 20),
                const Spacer(),
                AppButton(
                  onPressed: isSave
                      ? null
                      : () async {
                          isSave = true;
                          setState(() {});
                          await saveResult(context);
                          const snackBar = SnackBar(
                            padding: EdgeInsets.only(
                              left: 15.0,
                              right: 15.0,
                              top: 10,
                              bottom: 10,
                            ),
                            content: Text('Results saved!'),
                            behavior: SnackBarBehavior.floating,
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        },
                  color: Colors.blue,
                  title: 'Save results',
                ),
                AppButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => GameSetup(),
                      ),
                    );
                  },
                  color: Colors.blue,
                  title: 'New game',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
