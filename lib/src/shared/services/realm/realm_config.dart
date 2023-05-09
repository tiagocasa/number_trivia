import 'package:realm/realm.dart';

import '../../../core/configuration/data/realm/configuration_realm.dart';
import '../../../core/number_trivia/data/realm/number_trivia_realm.dart';

LocalConfiguration config = Configuration.local(
  [
    NumberTriviaRealm.schema,
    ConfigurationRealm.schema,
  ],
);
