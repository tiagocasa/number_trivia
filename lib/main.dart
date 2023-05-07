import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:number_trivia/src/app_module.dart';

import 'src/app_widget.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}
