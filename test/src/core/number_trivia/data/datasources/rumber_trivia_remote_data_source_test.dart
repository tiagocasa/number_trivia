import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:number_trivia/src/core/number_trivia/data/datasources/number_trivia_remote_data_source.dart';
import 'package:number_trivia/src/core/number_trivia/data/models/number_trivia_model.dart';
import 'package:number_trivia/src/shared/error/exceptions.dart';
import 'package:number_trivia/src/shared/error/failure.dart';

import '../../../../shared/fixtures/fixtures_either.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  MockHttpClient mockHttpClient;
  NumberTriviaRemoteDataSourceImpl dataSource;

  mockHttpClient = MockHttpClient();

  dataSource = NumberTriviaRemoteDataSourceImpl(client: mockHttpClient);

  group('Concrete Number Trivia', () {
    const tNumber = 1;
    final tNumberTriviaMovel =
        NumberTriviaModel.fromJson(json.decode(fixture('trivia.json')));
    final url = Uri.http('numbersapi.com', '/$tNumber');

    test('Deve fazer um GET na URL com o numero sendo o endpoint', () async {
      when(
        () => mockHttpClient.get(url, headers: any(named: 'headers')),
      ).thenAnswer((_) async => http.Response(fixture('trivia.json'), 200));

      await dataSource.getConcreteNumberTrivia(tNumber);

      verify(
        () => mockHttpClient.get(
          url,
          headers: {'Content-Type': 'application/json'},
        ),
      );
    });
    test('Deve retornar um NumberTrivia quando a resposta for 200', () async {
      when(() => mockHttpClient.get(url, headers: any(named: 'headers')))
          .thenAnswer((_) async => http.Response(fixture('trivia.json'), 200));

      final result = await dataSource.getConcreteNumberTrivia(tNumber);

      expect(result, tNumberTriviaMovel);
    });

    test('Deve "thorw" um ServerException quando a resposta for 404', () async {
      when(() => mockHttpClient.get(url, headers: any(named: 'headers')))
          .thenAnswer((_) async => http.Response('Error', 404));

      final call = dataSource.getConcreteNumberTrivia;

      expect(
        () => call(tNumber),
        throwsA(const TypeMatcher<ServerExceptions>()),
      );
    });
  });

  group('Random Number Trivia', () {
    final tNumberTriviaMovel =
        NumberTriviaModel.fromJson(json.decode(fixture('trivia.json')));
    final url = Uri.http('numbersapi.com', '/random');

    test('Deve fazer um GET na URL com o numero sendo o endpoint', () async {
      when(
        () => mockHttpClient.get(url, headers: any(named: 'headers')),
      ).thenAnswer((_) async => http.Response(fixture('trivia.json'), 200));

      await dataSource.getRandomNumberTrivia();

      verify(
        () => mockHttpClient.get(
          url,
          headers: {'Content-Type': 'application/json'},
        ),
      );
    });
    test('Deve retornar um NumberTrivia quando a resposta for 200', () async {
      when(() => mockHttpClient.get(url, headers: any(named: 'headers')))
          .thenAnswer((_) async => http.Response(fixture('trivia.json'), 200));

      final result = await dataSource.getRandomNumberTrivia();

      expect(result, tNumberTriviaMovel);
    });

    test('Deve "thorw" um ServerException quando a resposta for 404', () async {
      when(() => mockHttpClient.get(url, headers: any(named: 'headers')))
          .thenAnswer((_) async => http.Response('Error', 404));

      final call = dataSource.getRandomNumberTrivia;

      expect(
        call,
        throwsA(const TypeMatcher<ServerExceptions>()),
      );
    });
  });
}
