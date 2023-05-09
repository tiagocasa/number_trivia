import 'package:flutter/material.dart';
import 'package:number_trivia/src/core/configuration/domain/entities/configuration.dart';

import '../../domain/repositories/configuration_repository.dart';
import '../datasources/configuration_local_data_source.dart';

class ConfigurationRepositoryImpl implements ConfigurationRepository {
  final ConfigurationLocalDataSource localDataSource;

  ConfigurationRepositoryImpl({
    required this.localDataSource,
  });

  @override
  Configuration getConfiguration() {
    return localDataSource.getConfiguration();
  }

  @override
  void saveConfiguration(ThemeMode? themeMode) {
    localDataSource.saveConfiguration(themeMode);
  }

  @override
  void clearCacheConfiguration() {
    localDataSource.clearCacheConfiguration();
  }
}
