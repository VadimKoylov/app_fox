// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GameStore on _GameStore, Store {
  late final _$selectedAnswerAtom =
      Atom(name: '_GameStore.selectedAnswer', context: context);

  @override
  List<Map<String, String?>> get selectedAnswer {
    _$selectedAnswerAtom.reportRead();
    return super.selectedAnswer;
  }

  @override
  set selectedAnswer(List<Map<String, String?>> value) {
    _$selectedAnswerAtom.reportWrite(value, super.selectedAnswer, () {
      super.selectedAnswer = value;
    });
  }

  late final _$_GameStoreActionController =
      ActionController(name: '_GameStore', context: context);

  @override
  void setAnswer(
      {required String answerName,
      required String answerValue,
      required int index}) {
    final _$actionInfo =
        _$_GameStoreActionController.startAction(name: '_GameStore.setAnswer');
    try {
      return super.setAnswer(
          answerName: answerName, answerValue: answerValue, index: index);
    } finally {
      _$_GameStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedAnswer: ${selectedAnswer}
    ''';
  }
}
