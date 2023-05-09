import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:number_trivia/src/core/number_trivia/domain/entities/number_trivia.dart';
import 'package:number_trivia/src/core/number_trivia/domain/usecases/get_concrete_number_trivia.dart';
import 'package:number_trivia/src/core/number_trivia/domain/usecases/get_random_number_trivia.dart';
import 'package:number_trivia/src/core/number_trivia/presentation/mobx/number_trivia_store.dart';
import 'package:number_trivia/src/shared/error/failure.dart';
import 'package:number_trivia/src/shared/util/constants.dart';
import 'package:number_trivia/src/shared/util/input_converter.dart';

class MockGetConcreteNumberTrivia extends Mock
    implements GetConcreteNumberTrivia {}

class MockGetRandomNumberTrivia extends Mock implements GetRandomNumberTrivia {}

class MockInputConverter extends Mock implements InputConverter {}

void main() {
  late NumberTriviaStore store;
  late MockGetConcreteNumberTrivia concreteNumber;
  late MockGetRandomNumberTrivia randomNumber;
  late MockInputConverter inputConverter;

  concreteNumber = MockGetConcreteNumberTrivia();
  randomNumber = MockGetRandomNumberTrivia();
  inputConverter = MockInputConverter();
  store = NumberTriviaStore(concreteNumber, randomNumber, inputConverter);

  group('Should get concrete trivia from the usecase and set variables', () {
    test('Converter should return failure', () async {
      const int triviaNumber = 0;
      const String triviaNumberString = '-1';
      const String triviaText = INVALID_INPUT_FAILURE;

      when(() => inputConverter.stringtoUnisgnedInteger(triviaNumberString))
          .thenReturn(Left(InvalidInputFailure()));

      await store.getConcreteNumberTrivia(triviaNumberString);

      expect(store.triviaText, triviaText);
      expect(store.triviaNumber, triviaNumber);
      expect(store.isLoading, false);
    });

    test('Converter should return int and failed to get trivia', () async {
      const int triviaNumber = 5;
      const String triviaNumberString = '5';
      const String triviaText = 'Server Failure';

      when(() => inputConverter.stringtoUnisgnedInteger(triviaNumberString))
          .thenReturn(const Right(triviaNumber));
      when(() => concreteNumber(const Params(number: triviaNumber)))
          .thenAnswer((_) async => Left(ServerFailure()));

      await store.getConcreteNumberTrivia(triviaNumberString);

      expect(store.triviaText, triviaText);
      expect(store.triviaNumber, 0);
      expect(store.isLoading, false);
    });

    test('Converter should return int and Success to get trivia', () async {
      const int triviaNumber = 5;
      const String triviaNumberString = '5';
      const String triviaText = 'test';

      when(() => inputConverter.stringtoUnisgnedInteger(triviaNumberString))
          .thenReturn(const Right(triviaNumber));
      when(() => concreteNumber(const Params(number: triviaNumber))).thenAnswer(
          (_) async => const Right(NumberTrivia(number: 5, text: 'test')));

      await store.getConcreteNumberTrivia(triviaNumberString);

      expect(store.triviaText, triviaText);
      expect(store.triviaNumber, triviaNumber);
      expect(store.isLoading, false);
    });
  });

  group('Should get random trivia from the usecase and set variables', () {
    test('Failed to get trivia', () async {
      const String triviaText = 'Server Failure';

      when(() => randomNumber(NoParams()))
          .thenAnswer((_) async => Left(ServerFailure()));

      await store.getRandomNumberTrivia();

      expect(store.triviaText, triviaText);
      expect(store.triviaNumber, 0);
      expect(store.isLoading, false);
    });

    test('Success to get trivia', () async {
      const int triviaNumber = 5;
      const String triviaText = 'test';

      when(() => randomNumber(NoParams())).thenAnswer(
          (_) async => const Right(NumberTrivia(number: 5, text: 'test')));

      await store.getRandomNumberTrivia();

      expect(store.triviaText, triviaText);
      expect(store.triviaNumber, triviaNumber);
      expect(store.isLoading, false);
    });
  });
}
