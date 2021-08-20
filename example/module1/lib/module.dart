import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:modulary/modulary.dart';
import 'package:modulary/module.dart';
import 'package:module1/services/servicelocator.dart';
import 'package:module1/views/module1_view.dart';
import 'package:module1/widgets/mainmenu_widget.dart';
import 'package:shared/extension_keys.dart';

import 'extensions/modular_list_extension.dart';
import 'extensions/modular_tab_extension.dart';

class Module1 extends Module {
  ///
  /// Initialize module
  ///
  void initialize() {
    // Register mainmenu widget extensions
    Extensions.register(mainMenuWidgetKey, (context) => MainMenuWidget());

    // Register list view example extensions
    Extensions.register(
        modularListKey, (context) => getModularListSingleItemExtension());
    Extensions.registerCollction(
        modularListKey, (context) => getModularListMultipleItemExtension());
    Extensions.register(modularAsyncListKey,
        (context) => getModularListSingleItemExtensionAsync());
    Extensions.registerCollction(modularAsyncListKey,
        (context) => getModularListMultipleItemExtensionAsync());

    // Register tab view extension
    Extensions.register(modularTabKey, (context) => getTabExtension(context!));

    // Register viewmodels for dependency injection
    setupServiceLocator();
  }

  ///
  /// Get module routes
  ///
  Map<String, WidgetBuilder> get routes {
    return {
      Module1View.route: (context) => Module1View(),
    };
  }
}
