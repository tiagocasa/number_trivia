import 'package:flutter/material.dart';
import 'package:number_trivia/src/core/configuration/domain/repositories/configuration_repository.dart';

class SaveConfiguration {
  final ConfigurationRepository repository;

  SaveConfiguration(this.repository);

  void call(ThemeMode? themeMode) {
    repository.saveConfiguration(themeMode);
  }
}
