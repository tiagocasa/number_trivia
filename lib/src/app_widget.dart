import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'core/configuration/presentation/mobx/configuration_store.dart';
import 'shared/themes/themes.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  final configuration = Modular.get<ConfigurationStore>();

  @override
  Widget build(BuildContext context) {
    Modular.setInitialRoute('/home/');
    return Observer(builder: (context) {
      return MaterialApp.router(
        title: 'Number Trivia',
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: configuration.themeMode,
        routerDelegate: Modular.routerDelegate,
        routeInformationParser: Modular.routeInformationParser,
      );
    });
  }
}
