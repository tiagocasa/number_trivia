// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'configuration_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ConfigurationStore on ConfigurationStoreBase, Store {
  late final _$themeModeAtom =
      Atom(name: 'ConfigurationStoreBase.themeMode', context: context);

  @override
  ThemeMode? get themeMode {
    _$themeModeAtom.reportRead();
    return super.themeMode;
  }

  @override
  set themeMode(ThemeMode? value) {
    _$themeModeAtom.reportWrite(value, super.themeMode, () {
      super.themeMode = value;
    });
  }

  late final _$ConfigurationStoreBaseActionController =
      ActionController(name: 'ConfigurationStoreBase', context: context);

  @override
  void changeThemeMode(ThemeMode? newThemeMode) {
    final _$actionInfo = _$ConfigurationStoreBaseActionController.startAction(
        name: 'ConfigurationStoreBase.changeThemeMode');
    try {
      return super.changeThemeMode(newThemeMode);
    } finally {
      _$ConfigurationStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void init() {
    final _$actionInfo = _$ConfigurationStoreBaseActionController.startAction(
        name: 'ConfigurationStoreBase.init');
    try {
      return super.init();
    } finally {
      _$ConfigurationStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
themeMode: ${themeMode}
    ''';
  }
}
