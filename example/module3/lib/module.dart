import 'package:flutter/src/widgets/framework.dart';
import 'package:modulary/modulary.dart';
import 'package:modulary/module.dart';
import 'package:module3/widgets/mainmenu_widget.dart';
import 'package:shared/extension_keys.dart';

class Module3 implements Module {
  void initialize() {
    Extensions.registerExtension(mainMenuWidgetKey, () => MainMenuWidget());
  }

  Map<String, Widget Function(BuildContext p1)> get routes {
    return Map();
  }
}
