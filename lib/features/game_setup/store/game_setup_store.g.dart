// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_setup_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GameSetupStore on _GameSetupStore, Store {
  late final _$isLoadingAtom =
      Atom(name: '_GameSetupStore.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$isSuccessAtom =
      Atom(name: '_GameSetupStore.isSuccess', context: context);

  @override
  bool get isSuccess {
    _$isSuccessAtom.reportRead();
    return super.isSuccess;
  }

  @override
  set isSuccess(bool value) {
    _$isSuccessAtom.reportWrite(value, super.isSuccess, () {
      super.isSuccess = value;
    });
  }

  late final _$selectedCategoryAtom =
      Atom(name: '_GameSetupStore.selectedCategory', context: context);

  @override
  String get selectedCategory {
    _$selectedCategoryAtom.reportRead();
    return super.selectedCategory;
  }

  @override
  set selectedCategory(String value) {
    _$selectedCategoryAtom.reportWrite(value, super.selectedCategory, () {
      super.selectedCategory = value;
    });
  }

  late final _$selectedDifficultyAtom =
      Atom(name: '_GameSetupStore.selectedDifficulty', context: context);

  @override
  String get selectedDifficulty {
    _$selectedDifficultyAtom.reportRead();
    return super.selectedDifficulty;
  }

  @override
  set selectedDifficulty(String value) {
    _$selectedDifficultyAtom.reportWrite(value, super.selectedDifficulty, () {
      super.selectedDifficulty = value;
    });
  }

  late final _$getQuestionsAsyncAction =
      AsyncAction('_GameSetupStore.getQuestions', context: context);

  @override
  Future<void> getQuestions() {
    return _$getQuestionsAsyncAction.run(() => super.getQuestions());
  }

  late final _$_GameSetupStoreActionController =
      ActionController(name: '_GameSetupStore', context: context);

  @override
  void setDifficulty(String value) {
    final _$actionInfo = _$_GameSetupStoreActionController.startAction(
        name: '_GameSetupStore.setDifficulty');
    try {
      return super.setDifficulty(value);
    } finally {
      _$_GameSetupStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCategory(String value) {
    final _$actionInfo = _$_GameSetupStoreActionController.startAction(
        name: '_GameSetupStore.setCategory');
    try {
      return super.setCategory(value);
    } finally {
      _$_GameSetupStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
isSuccess: ${isSuccess},
selectedCategory: ${selectedCategory},
selectedDifficulty: ${selectedDifficulty}
    ''';
  }
}
