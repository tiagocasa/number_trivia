import 'package:realm/realm.dart';

part 'number_trivia_realm.g.dart';

@RealmModel()
class _NumberTriviaRealm {
  late int number;
  late String text;
}
