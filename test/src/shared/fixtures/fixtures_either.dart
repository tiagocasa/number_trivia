import 'dart:io';

String fixture(String name) =>
    File('test/src/shared/fixtures/$name').readAsStringSync();
