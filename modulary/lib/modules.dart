import 'package:flutter/widgets.dart';
import 'module.dart';

class Modules {
  static final List<Module> _modules = [];

  ///
  /// Initialize modules
  ///
  static void initialize(List<Module> modules) {
    // Save module initialize object
    _modules.addAll(modules);

    // Initialize all modules
    for (int i = 0; i < modules.length; i++) {
      _modules[i].initialize();
    }
  }

  ///
  /// Get all routes from every module
  ///
  static Map<String, WidgetBuilder> routes() {
    Map<String, WidgetBuilder> allRoutes = Map();

    // Add routes from every modyle
    for (int i = 0; i < _modules.length; i++) {
      allRoutes.addAll(_modules[i].routes);
    }

    return allRoutes;
  }

  ///
  /// Generate routes
  ///
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    // Add routes from every modyle
    for (int i = 0; i < _modules.length; i++) {
      Route<dynamic>? route = _modules[i].onGenerateRoute(settings);

      if (route != null) {
        return route;
      }
    }

    return null;
  }
}
