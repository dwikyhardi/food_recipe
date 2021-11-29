import 'dart:io';

String fixture(String name) => File('test/src/fixture/$name').readAsStringSync();