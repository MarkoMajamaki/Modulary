import 'package:flutter/src/widgets/framework.dart';
import 'package:modulary/modulary.dart';
import 'package:modulary/module.dart';
import 'package:module1/services/servicelocator.dart';
import 'package:module1/views/module1_view.dart';
import 'package:module1/widgets/mainmenu_widget.dart';
import 'package:shared/extension_keys.dart';

import 'extensions/modular_list_extension.dart';
import 'extensions/modular_tab_extension.dart';

class Module1 implements Module {
  ///
  /// Initialize module
  ///
  void initialize() {
    // Register mainmenu widget extensions
    Extensions.registerExtension(mainMenuWidgetKey, () => MainMenuWidget());

    // Register list view example extensions
    Extensions.registerExtension(
        modularListKey, () => getModularListSingleItemExtension());
    Extensions.registerExtensionCollction(
        modularListKey, () => getModularListMultipleItemExtension());
    Extensions.registerExtension(
        modularAsyncListKey, () => getModularListSingleItemExtensionAsync());
    Extensions.registerExtensionCollction(
        modularAsyncListKey, () => getModularListMultipleItemExtensionAsync());

    // Register tab view extension
    Extensions.registerExtension(modularTabKey, () => getTabExtension());

    // Register viewmodels for dependency injection
    setupServiceLocator();
  }

  ///
  /// Get module routes
  ///
  Map<String, Widget Function(BuildContext p1)> get routes {
    return {
      Module1View.route: (context) => Module1View(),
    };
  }
}
