import 'package:number_trivia/src/core/configuration/domain/repositories/configuration_repository.dart';

import '../entities/configuration.dart';

class GetConfiguration {
  final ConfigurationRepository repository;

  GetConfiguration(this.repository);

  Configuration call() {
    return repository.getConfiguration();
  }
}
