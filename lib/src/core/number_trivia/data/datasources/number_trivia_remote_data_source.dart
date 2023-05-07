import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:number_trivia/src/core/number_trivia/data/models/number_trivia_model.dart';

import '../../../../shared/error/exceptions.dart';

abstract class NumberTriviaRemoteDataSource {
  Future<NumberTriviaModel> getConcreteNumberTrivia(int number);
  Future<NumberTriviaModel> getRandomNumberTrivia();
}

class NumberTriviaRemoteDataSourceImpl implements NumberTriviaRemoteDataSource {
  final http.Client client;

  NumberTriviaRemoteDataSourceImpl({required this.client});

  @override
  Future<NumberTriviaModel> getConcreteNumberTrivia(int number) =>
      _getTriviaFromUrl('/$number');

  @override
  Future<NumberTriviaModel> getRandomNumberTrivia() =>
      _getTriviaFromUrl('/random');

  Future<NumberTriviaModel> _getTriviaFromUrl(String unencodedPath) async {
    final response = await client.get(
      Uri.http('numbersapi.com', unencodedPath),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      return NumberTriviaModel.fromJson(json.decode(response.body));
    } else {
      throw ServerExceptions();
    }
  }
}
