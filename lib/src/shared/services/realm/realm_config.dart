import 'package:number_trivia/src/shared/services/realm/number_trivia_realm.dart';
import 'package:realm/realm.dart';

LocalConfiguration config = Configuration.local(
  [
    NumberTriviaRealm.schema,
  ],
  initialDataCallback: (realm) {
    realm.add(
      NumberTriviaRealm(
        0,
        'You have 0 trivias cached in your local memory',
      ),
    );
  },
);
