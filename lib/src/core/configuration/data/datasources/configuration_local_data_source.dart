import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:number_trivia/src/core/number_trivia/data/realm/number_trivia_realm.dart';
import 'package:realm/realm.dart';

import '../models/configuration_model.dart';
import '../realm/configuration_realm.dart';

abstract class ConfigurationLocalDataSource {
  ConfigurationModel getConfiguration();
  void saveConfiguration(ThemeMode? themeMode);
  void clearCacheConfiguration();
}

class ConfigurationLocalDataSourceImpl implements ConfigurationLocalDataSource {
  final Realm realm;
  ConfigurationLocalDataSourceImpl(this.realm);

  @override
  ConfigurationModel getConfiguration() {
    ConfigurationRealm configuration;
    try {
      configuration = realm.all<ConfigurationRealm>().first;
    } on StateError {
      realm.write(() {
        realm.add(ConfigurationRealm('system'));
      });
      configuration = ConfigurationRealm('system');
    }
    final themeName = _getThemeModeByName(configuration.themeModeName);
    return ConfigurationModel(themeMode: themeName);
  }

  ThemeMode _getThemeModeByName(String name) {
    return ThemeMode.values.firstWhere((mode) => mode.name == name);
  }

  @override
  void saveConfiguration(ThemeMode? themeMode) {
    final themeName = _getThemeModeName(themeMode);
    try {
      var model = realm.all<ConfigurationRealm>().first;
      realm.write(() {
        model.themeModeName = themeName;
      });
    } on StateError {
      realm.write(() {
        realm.add(ConfigurationRealm('system'));
      });
    }
  }

  String _getThemeModeName(ThemeMode? themeMode) {
    if (themeMode?.index == 1) {
      return 'light';
    } else if (themeMode?.index == 2) {
      return 'dark';
    }
    return 'system';
  }

  @override
  void clearCacheConfiguration() {
    realm.write(() => realm.deleteAll<ConfigurationRealm>());
    realm.write(() => realm.deleteAll<NumberTriviaRealm>());
    SystemNavigator.pop();
  }
}
