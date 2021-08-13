import 'package:app/core/shell.dart';
import 'package:app/services/servicelocator.dart';
import 'package:app/views/modular_list_view.dart';
import 'package:app/views/modular_tab_view.dart';
import 'package:flutter/src/widgets/navigator.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:modulary/modulary.dart';

class MainModule extends Module {
  void initialize() {
    setupServiceLocator();
  }

  Map<String, WidgetBuilder> get routes {
    return {
      '/': (context) => Shell(),
      Shell.route: (context) => Shell(),
      ModularTabView.route: (context) => ModularTabView(),
    };
  }

  Route? onGenerateRoute(RouteSettings settings) {
    if (settings.name == ModularListView.route) {
      return PageRouteBuilder(
        settings: settings,
        pageBuilder: (_, __, ___) => ModularListView(),
        transitionsBuilder: (_, a, __, c) =>
            FadeTransition(opacity: a, child: c),
      );
    }
  }
}
