import 'dart:math';
import 'package:number_trivia/src/core/number_trivia/data/models/number_trivia_model.dart';
import 'package:realm/realm.dart';

import '../../domain/entities/number_trivia.dart';
import '../realm/number_trivia_realm.dart';

abstract class NumberTriviaLocalDataSource {
  Future<NumberTriviaModel> getRandomNumberTriviaCached();
  Future<void> cacheNumberTrivia(NumberTrivia triviaToCache);
}

class NumberTriviaLocalDataSourceImpl implements NumberTriviaLocalDataSource {
  final Realm realm;
  NumberTriviaLocalDataSourceImpl(this.realm);

  @override
  Future<void> cacheNumberTrivia(NumberTrivia triviaToCache) async {
    final numberTriviaRealm =
        NumberTriviaRealm(triviaToCache.number, triviaToCache.text);
    realm.write(() {
      realm.add(numberTriviaRealm);
    });
  }

  @override
  Future<NumberTriviaModel> getRandomNumberTriviaCached() async {
    try {
      final trivia = realm.all<NumberTriviaRealm>();
      final index = trivia.length > 1 ? Random().nextInt(trivia.length) : 0;
      final selectedTrivia = trivia[index];
      final myTrivia = NumberTriviaModel(
        number: selectedTrivia.number,
        text: selectedTrivia.text,
      );
      return myTrivia;
    } on RealmException {
      realm.write(() {
        realm.add(
            NumberTriviaRealm(0, 'You have 0 trivias cached in local memory'));
      });
      final trivia = realm.all<NumberTriviaRealm>();
      final selectedTrivia = trivia[0];
      final myTrivia = NumberTriviaModel(
        number: selectedTrivia.number,
        text: selectedTrivia.text,
      );
      return myTrivia;
    }
  }
}

// TODO
  // @override
  // void saveConfiguration(ThemeMode? themeMode) {
  //   final themeName = _getThemeModeName(themeMode);
  //   try {
  //     var model = realm.all<ConfigurationRealm>().first;
  //     realm.write(() {
  //       model.themeModeName = themeName;
  //     });
  //   } on StateError {
  //     realm.write(() {
  //       realm.add(ConfigurationRealm('system'));
  //     });
  //   }
  // }



  // @override
  // Future<NumberTriviaModel> getRandomNumberTriviaCached() async {
  //   final trivia = realm.all<NumberTriviaRealm>();

  //   final index = trivia.length > 1 ? Random().nextInt(trivia.length) : 0;
  //   final selectedTrivia = trivia[index];
  //   final myTrivia = NumberTriviaModel(
  //     number: selectedTrivia.number,
  //     text: selectedTrivia.text,
  //   );
  //   return myTrivia;
  // }