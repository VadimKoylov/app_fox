import 'package:app_fox/features/game_setup/game_setup.dart';
import 'package:flutter/material.dart';

class CoreApp extends StatelessWidget {
  const CoreApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GameSetup(),
    );
  }
}
