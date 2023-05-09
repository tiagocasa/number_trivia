import 'package:mobx/mobx.dart';
import 'package:number_trivia/src/core/number_trivia/domain/usecases/get_concrete_number_trivia.dart';
import 'package:number_trivia/src/core/number_trivia/domain/usecases/get_random_number_trivia.dart';
import 'package:number_trivia/src/shared/util/input_converter.dart';

import '../../../../shared/error/failure.dart';
import '../../../../shared/util/constants.dart';

part 'number_trivia_store.g.dart';

class NumberTriviaStore = NumberTriviaStoreBase with _$NumberTriviaStore;

abstract class NumberTriviaStoreBase with Store {
  final GetConcreteNumberTrivia concrete;
  final GetRandomNumberTrivia random;
  final InputConverter converter;
  NumberTriviaStoreBase(this.concrete, this.random, this.converter);

  @observable
  String numberString = '';

  @observable
  String triviaText = 'Start searching';

  @observable
  int triviaNumber = 0;

  @observable
  bool isLoading = false;

  void _changeLoading() {
    if (isLoading) {
      isLoading = false;
    } else {
      isLoading = true;
    }
  }

  @action
  Future<void> getConcreteNumberTrivia(String numberString) async {
    _changeLoading();
    final numberConverted = converter.stringtoUnisgnedInteger(numberString);
    await numberConverted.fold(
      (l) {
        triviaNumber = 0;
        triviaText = failureToMessage(l);
        _changeLoading();
        return;
      },
      (r) async {
        final failureOrTrivia = await concrete(Params(number: r));
        _changeLoading();
        failureOrTrivia.fold((l) {
          triviaText = failureToMessage(l);
          return;
        }, (r) {
          triviaText = r.text;
          triviaNumber = r.number;

          return;
        });
      },
    );
  }

  @action
  Future<void> getRandomNumberTrivia() async {
    _changeLoading();
    final failureOrTrivia = await random(NoParams());
    _changeLoading();

    failureOrTrivia.fold((l) {
      triviaText = failureToMessage(l);
      return;
    }, (r) {
      triviaText = r.text;
      triviaNumber = r.number;
      return;
    });
  }

  String failureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE;
      case CacheFailure:
        return CACHE_FAILURE;
      case InvalidInputFailure:
        return INVALID_INPUT_FAILURE;
      default:
        return 'Unexpected Error';
    }
  }
}
