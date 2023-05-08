import 'package:flutter_modular/flutter_modular.dart';
import 'package:number_trivia/src/core/number_trivia/data/datasources/number_trivia_local_data_source.dart';
import 'package:number_trivia/src/core/number_trivia/data/datasources/number_trivia_remote_data_source.dart';
import 'package:number_trivia/src/core/number_trivia/data/repositories/number_trivia_repository_impl.dart';
import 'package:number_trivia/src/core/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:number_trivia/src/core/number_trivia/domain/usecases/get_concrete_number_trivia.dart';
import 'package:number_trivia/src/core/number_trivia/domain/usecases/get_random_number_trivia.dart';
import 'package:number_trivia/src/core/number_trivia/presentation/pages/number_trivia_page.dart';

import 'presentation/mobx/number_trivia_store.dart';

class NumberTriviaModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton((i) => NumberTriviaStore(i(), i(), i())),
        Bind.lazySingleton((i) => GetConcreteNumberTrivia(i())),
        Bind.lazySingleton((i) => GetRandomNumberTrivia(i())),
        Bind.lazySingleton<NumberTriviaRepository>(
          (i) => NumberTriviaRepositoryImpl(
            remoteDataSource: i(),
            localDataSource: i(),
            networkInfo: i(),
          ),
        ),
        Bind.lazySingleton<NumberTriviaRemoteDataSource>(
          (i) => NumberTriviaRemoteDataSourceImpl(client: i()),
        ),
        Bind.lazySingleton<NumberTriviaLocalDataSource>(
          (i) => NumberTriviaLocalDataSourceImpl(i()),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const NumberTriviaPage()),
      ];
}
