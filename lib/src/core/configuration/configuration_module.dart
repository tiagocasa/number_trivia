import 'package:flutter_modular/flutter_modular.dart';
import 'package:number_trivia/src/core/configuration/data/datasources/configuration_local_data_source.dart';
import 'package:number_trivia/src/core/configuration/domain/repositories/configuration_repository.dart';
import 'package:number_trivia/src/core/configuration/domain/usecases/get_configuration.dart';
import 'package:number_trivia/src/core/configuration/domain/usecases/save_configuration.dart';
import 'package:number_trivia/src/core/configuration/presentation/mobx/configuration_store.dart';

import 'data/repositories/configuration_repository_impl.dart';
import 'presentation/pages/configuration_page.dart';

class ConfigurationModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => ConfigurationStore(i(), i()), export: true),
        Bind.singleton((i) => GetConfiguration(i()), export: true),
        Bind.singleton((i) => SaveConfiguration(i()), export: true),
        Bind.singleton<ConfigurationRepository>(
            (i) => ConfigurationRepositoryImpl(localDataSource: i()),
            export: true),
        Bind.singleton<ConfigurationLocalDataSource>(
            (i) => ConfigurationLocalDataSourceImpl(i()),
            export: true)
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const ConfigurationPage()),
      ];
}
