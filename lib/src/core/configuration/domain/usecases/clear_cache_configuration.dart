import 'package:flutter/material.dart';
import 'package:number_trivia/src/core/configuration/domain/repositories/configuration_repository.dart';

class ClearCacheConfiguration {
  final ConfigurationRepository repository;

  ClearCacheConfiguration(this.repository);

  void call() {
    repository.clearCacheConfiguration();
  }
}
