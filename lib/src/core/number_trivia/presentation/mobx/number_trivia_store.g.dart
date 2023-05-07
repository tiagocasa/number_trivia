// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'number_trivia_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NumberTriviaStore on NumberTriviaStoreBase, Store {
  late final _$numberStringAtom =
      Atom(name: 'NumberTriviaStoreBase.numberString', context: context);

  @override
  String get numberString {
    _$numberStringAtom.reportRead();
    return super.numberString;
  }

  @override
  set numberString(String value) {
    _$numberStringAtom.reportWrite(value, super.numberString, () {
      super.numberString = value;
    });
  }

  late final _$triviaTextAtom =
      Atom(name: 'NumberTriviaStoreBase.triviaText', context: context);

  @override
  String get triviaText {
    _$triviaTextAtom.reportRead();
    return super.triviaText;
  }

  @override
  set triviaText(String value) {
    _$triviaTextAtom.reportWrite(value, super.triviaText, () {
      super.triviaText = value;
    });
  }

  late final _$triviaNumberAtom =
      Atom(name: 'NumberTriviaStoreBase.triviaNumber', context: context);

  @override
  int get triviaNumber {
    _$triviaNumberAtom.reportRead();
    return super.triviaNumber;
  }

  @override
  set triviaNumber(int value) {
    _$triviaNumberAtom.reportWrite(value, super.triviaNumber, () {
      super.triviaNumber = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: 'NumberTriviaStoreBase.isLoading', context: context);

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

  late final _$getConcreteNumberTriviaAsyncAction = AsyncAction(
      'NumberTriviaStoreBase.getConcreteNumberTrivia',
      context: context);

  @override
  Future<void> getConcreteNumberTrivia(String numberString) {
    return _$getConcreteNumberTriviaAsyncAction
        .run(() => super.getConcreteNumberTrivia(numberString));
  }

  late final _$getRandomNumberTriviaAsyncAction = AsyncAction(
      'NumberTriviaStoreBase.getRandomNumberTrivia',
      context: context);

  @override
  Future<void> getRandomNumberTrivia() {
    return _$getRandomNumberTriviaAsyncAction
        .run(() => super.getRandomNumberTrivia());
  }

  @override
  String toString() {
    return '''
numberString: ${numberString},
triviaText: ${triviaText},
triviaNumber: ${triviaNumber},
isLoading: ${isLoading}
    ''';
  }
}
