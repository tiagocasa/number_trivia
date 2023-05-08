import 'package:data_connection_checker_nulls/data_connection_checker_nulls.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;
import 'package:number_trivia/src/core/number_trivia/number_trivia_module.dart';
import 'package:number_trivia/src/shared/services/network/network_info.dart';
import 'package:number_trivia/src/shared/services/realm/realm_config.dart';
import 'package:number_trivia/src/shared/util/input_converter.dart';
import 'package:realm/realm.dart';

import 'core/configuration/configuration_module.dart';
import 'core/configuration/presentation/mobx/configuration_store.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [
        NumberTriviaModule(),
        ConfigurationModule(),
      ];

  @override
  List<Bind> get binds => [
        Bind.instance<Realm>(Realm(config)),
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
        ModuleRoute('/configuration', module: ConfigurationModule()),
      ];
}
