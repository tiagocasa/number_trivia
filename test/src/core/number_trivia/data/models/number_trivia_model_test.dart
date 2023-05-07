import 'dart:convert';

import 'package:number_trivia/src/core/number_trivia/data/models/number_trivia_model.dart';
import 'package:number_trivia/src/core/number_trivia/domain/entities/number_trivia.dart';

import 'package:test/test.dart';

import '../../../../shared/fixtures/fixtures_either.dart';

void main() {
  const tNumberTriviaModel = NumberTriviaModel(number: 1, text: 'test text');
  test('Should be a subclass of NumberTrivia entity', () async {
    expect(tNumberTriviaModel, isA<NumberTrivia>());
  });

  group('fromJson', () {
    test('should return a valid model when Json is a integer', () async {
      final Map<String, dynamic> jsonMap = json.decode(fixture('trivia.json'));

      final result = NumberTriviaModel.fromJson(jsonMap);

      expect(result, tNumberTriviaModel);
    });
    test('should return a valid model when Json is a double', () async {
      final Map<String, dynamic> jsonMap =
          json.decode(fixture('trivia_double.json'));

      final result = NumberTriviaModel.fromJson(jsonMap);

      expect(result, tNumberTriviaModel);
    });
  });

  group('toJson', () {
    test('should return a JSON map conteining the proper data', () async {
      final result = tNumberTriviaModel.toJson();
      final expectedMap = {'text': 'test text', 'number': 1};
      expect(result, expectedMap);
    });
  });
}
