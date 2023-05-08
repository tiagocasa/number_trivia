import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:number_trivia/src/core/number_trivia/domain/usecases/get_concrete_number_trivia.dart';
import 'package:number_trivia/src/core/number_trivia/domain/usecases/get_random_number_trivia.dart';
import 'package:number_trivia/src/core/number_trivia/presentation/mobx/number_trivia_store.dart';
import 'package:number_trivia/src/shared/util/constants.dart';
import 'package:number_trivia/src/shared/util/input_converter.dart';

class MockGetConcreteNumber extends Mock implements GetConcreteNumberTrivia {}

class MockGetRandomNumberTrivia extends Mock implements GetRandomNumberTrivia {}

class MockInputConverter extends Mock implements InputConverter {}

void main() {
  late NumberTriviaStore store;
  late MockGetConcreteNumber concreteNumber;
  late MockGetRandomNumberTrivia randomNumber;
  late MockInputConverter inputConverter;

  concreteNumber = MockGetConcreteNumber();
  randomNumber = MockGetRandomNumberTrivia();
  inputConverter = MockInputConverter();
  store = NumberTriviaStore(concreteNumber, randomNumber, inputConverter);

  const String triviaText = INVALID_INPUT_FAILURE;
  const int triviaNumber = 0;
  const String triviaNumberString = '-1';

  group('Should get concrete trivia from the usecase and set variables', () {
    test('Converter should return failure', () async {
      when(() => inputConverter.stringtoUnisgnedInteger(triviaNumberString))
          .thenAnswer((_) => Left(InvalidInputFailure()));

      await store.getConcreteNumberTrivia(triviaNumberString);

      //expect(store.isLoading, true);
      expect(store.triviaText, triviaText);
      expect(store.triviaNumber, triviaNumber);
      expect(store.isLoading, false);
      verify(() => store.getConcreteNumberTrivia(triviaNumberString));
      // verifyNoMoreInteractions(mockNumberTriviaRepository);
    });
  });
}
