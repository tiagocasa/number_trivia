// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'configuration_realm.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class ConfigurationRealm extends _ConfigurationRealm
    with RealmEntity, RealmObjectBase, RealmObject {
  ConfigurationRealm(
    String themeModeName,
  ) {
    RealmObjectBase.set(this, 'themeModeName', themeModeName);
  }

  ConfigurationRealm._();

  @override
  String get themeModeName =>
      RealmObjectBase.get<String>(this, 'themeModeName') as String;
  @override
  set themeModeName(String value) =>
      RealmObjectBase.set(this, 'themeModeName', value);

  @override
  Stream<RealmObjectChanges<ConfigurationRealm>> get changes =>
      RealmObjectBase.getChanges<ConfigurationRealm>(this);

  @override
  ConfigurationRealm freeze() =>
      RealmObjectBase.freezeObject<ConfigurationRealm>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(ConfigurationRealm._);
    return const SchemaObject(
        ObjectType.realmObject, ConfigurationRealm, 'ConfigurationRealm', [
      SchemaProperty('themeModeName', RealmPropertyType.string),
    ]);
  }
}
