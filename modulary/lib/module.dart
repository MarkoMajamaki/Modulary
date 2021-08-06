import 'package:flutter/material.dart';

///
/// Module initialization class base. Create
///
abstract class Module {
  ///
  /// Called once when on startup
  ///
  void initialize();

  ///
  /// Module routes
  ///
  Map<String, Widget Function(BuildContext)> get routes;
}
