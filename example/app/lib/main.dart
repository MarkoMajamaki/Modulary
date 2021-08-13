import 'package:app/module.dart';
import 'package:flutter/material.dart';

import 'package:app/core/shell.dart';
import 'package:modulary/modules.dart';
import 'package:module1/module.dart';
import 'package:module2/module.dart';
import 'package:module3/module.dart';

void main() {
  // Initialize all modules
  Modules.initialize([
    MainModule(),
    Module1(),
    Module2(),
    Module3(),
  ]);

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Shell(),
    ),
  );
}
