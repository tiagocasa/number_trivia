import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:number_trivia/src/core/configuration/domain/usecases/get_configuration.dart';
import 'package:number_trivia/src/core/configuration/domain/usecases/save_configuration.dart';

part 'configuration_store.g.dart';

class ConfigurationStore = ConfigurationStoreBase with _$ConfigurationStore;

abstract class ConfigurationStoreBase with Store {
  final GetConfiguration getConfiguration;
  final SaveConfiguration saveConfiguration;

  ConfigurationStoreBase(this.getConfiguration, this.saveConfiguration) {
    init();
  }

  @observable
  ThemeMode? themeMode = ThemeMode.system;

  @action
  void changeThemeMode(ThemeMode? newThemeMode) {
    themeMode = newThemeMode;
    saveConfiguration(themeMode);
  }

  @action
  void init() {
    final configuration = getConfiguration();
    themeMode = configuration.themeMode;
  }
}
