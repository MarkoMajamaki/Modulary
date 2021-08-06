import 'package:flutter/src/widgets/framework.dart';
import 'package:modulary/modulary.dart';
import 'package:modulary/module.dart';
import 'package:module2/widgets/mainmenu_widget.dart';
import 'package:shared/extension_keys.dart';

import 'extensions/modular_list_extension.dart';
import 'extensions/modular_tab_extension.dart';

class Module2 implements Module {
  void initialize() {
    Extensions.registerExtension(mainMenuWidgetKey, () => MainMenuWidget());

    // Register list example extensions
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
  }

  Map<String, Widget Function(BuildContext p1)> get routes {
    return Map();
  }
}
