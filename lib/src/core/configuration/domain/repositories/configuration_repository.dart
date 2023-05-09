import 'package:flutter/material.dart';

import '../entities/configuration.dart';

abstract class ConfigurationRepository {
  Configuration getConfiguration();
  void saveConfiguration(ThemeMode? themeMode);
  void clearCacheConfiguration();
}
