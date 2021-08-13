import 'package:flutter/material.dart';

///
/// Module initialization class base. Create
///
class Module {
  ///
  /// Called once when on startup
  ///
  void initialize() {}

  ///
  /// Module routes
  ///
  Map<String, WidgetBuilder> get routes {
    return Map();
  }

  ///
  /// Generate route
  ///
  Route<dynamic>? onGenerateRoute(RouteSettings settings) {}
}
