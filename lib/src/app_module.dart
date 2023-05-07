import 'package:data_connection_checker_nulls/data_connection_checker_nulls.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;
import 'package:number_trivia/src/core/number_trivia_module.dart';
import 'package:number_trivia/src/shared/services/network/network_info.dart';
import 'package:number_trivia/src/shared/services/realm/realm_config.dart';
import 'package:number_trivia/src/shared/util/input_converter.dart';
import 'package:realm/realm.dart';

import 'core/number_trivia/data/datasources/number_trivia_local_data_source.dart';
import 'core/number_trivia/data/datasources/number_trivia_remote_data_source.dart';
import 'core/number_trivia/data/repositories/number_trivia_repository_impl.dart';
import 'core/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'core/number_trivia/domain/usecases/get_concrete_number_trivia.dart';
import 'core/number_trivia/domain/usecases/get_random_number_trivia.dart';
import 'core/number_trivia/presentation/mobx/number_trivia_store.dart';

class AppModule extends Module {
  // @override
  // List<Module> get imports => [
  //       NumberTriviaModule(),
  //     ];

  @override
  List<Bind> get binds => [
        Bind.instance<Realm>(Realm(config)),
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
        Bind.lazySingleton<NetworkInfo>((i) => NetworkInfoImpl(i())),
        Bind.lazySingleton<DataConnectionChecker>(
          (i) => DataConnectionChecker(),
        ),
        Bind.lazySingleton((i) => InputConverter()),
        Bind.lazySingleton((i) => http.Client()),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/home', module: NumberTriviaModule()),
      ];
}
