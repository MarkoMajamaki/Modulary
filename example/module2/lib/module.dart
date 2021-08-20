import 'package:flutter/src/widgets/framework.dart';
import 'package:modulary/modulary.dart';
import 'package:modulary/module.dart';
import 'package:module2/widgets/mainmenu_widget.dart';
import 'package:shared/extension_keys.dart';

import 'extensions/modular_list_extension.dart';
import 'extensions/modular_tab_extension.dart';

class Module2 extends Module {
  void initialize() {
    Extensions.register(mainMenuWidgetKey, (context) => MainMenuWidget());

    // Register list example extensions
    Extensions.register(
        modularListKey, (context) => getModularListSingleItemExtension());
    Extensions.registerCollction(
        modularListKey, (context) => getModularListMultipleItemExtension());
    Extensions.register(modularAsyncListKey,
        (context) => getModularListSingleItemExtensionAsync());
    Extensions.registerCollction(modularAsyncListKey,
        (context) => getModularListMultipleItemExtensionAsync());

    // Register tab view extension
    Extensions.register(modularTabKey, (context) => getTabExtension());
  }

  Map<String, Widget Function(BuildContext p1)> get routes {
    return Map();
  }
}
