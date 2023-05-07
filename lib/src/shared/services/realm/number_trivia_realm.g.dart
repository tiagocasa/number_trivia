// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'number_trivia_realm.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class NumberTriviaRealm extends _NumberTriviaRealm
    with RealmEntity, RealmObjectBase, RealmObject {
  NumberTriviaRealm(
    int number,
    String text,
  ) {
    RealmObjectBase.set(this, 'number', number);
    RealmObjectBase.set(this, 'text', text);
  }

  NumberTriviaRealm._();

  @override
  int get number => RealmObjectBase.get<int>(this, 'number') as int;
  @override
  set number(int value) => RealmObjectBase.set(this, 'number', value);

  @override
  String get text => RealmObjectBase.get<String>(this, 'text') as String;
  @override
  set text(String value) => RealmObjectBase.set(this, 'text', value);

  @override
  Stream<RealmObjectChanges<NumberTriviaRealm>> get changes =>
      RealmObjectBase.getChanges<NumberTriviaRealm>(this);

  @override
  NumberTriviaRealm freeze() =>
      RealmObjectBase.freezeObject<NumberTriviaRealm>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(NumberTriviaRealm._);
    return const SchemaObject(
        ObjectType.realmObject, NumberTriviaRealm, 'NumberTriviaRealm', [
      SchemaProperty('number', RealmPropertyType.int),
      SchemaProperty('text', RealmPropertyType.string),
    ]);
  }
}
