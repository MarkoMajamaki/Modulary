import 'package:flutter/material.dart';

import 'package:app/services/servicelocator.dart';
import 'package:app/core/shell.dart';
import 'package:modulary/modules.dart';
import 'package:module1/module.dart';
import 'package:module2/module.dart';
import 'package:module3/module.dart';

void main() {
  setupServiceLocator();

  // Initialize all modules
  Modules.initialize([
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
