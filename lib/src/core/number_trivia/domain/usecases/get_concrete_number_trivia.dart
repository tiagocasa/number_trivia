import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:number_trivia/src/core/number_trivia/domain/entities/number_trivia.dart';
import 'package:number_trivia/src/core/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:number_trivia/src/shared/error/failure.dart';
import 'package:number_trivia/src/shared/util/usecases.dart';

class GetConcreteNumberTrivia implements Usecase<NumberTrivia, Params> {
  final NumberTriviaRepository repository;

  GetConcreteNumberTrivia(this.repository);

  @override
  Future<Either<Failure, NumberTrivia>> call(Params params) {
    return repository.getConcreteNumberTrivia(params.number);
  }
}

class Params extends Equatable {
  final int number;
  const Params({required this.number});

  @override
  List<Object?> get props => [number];
}
