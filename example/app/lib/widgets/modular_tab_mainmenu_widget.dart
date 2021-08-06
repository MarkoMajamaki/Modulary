import 'package:app/views/modular_tab_view.dart';
import 'package:flutter/material.dart';
import 'package:module1/services/servicelocator.dart';
import 'package:shared/services/navigation_service.dart';

class ModularTabMainMenuWidget extends StatefulWidget {
  ModularTabMainMenuWidget({Key? key}) : super(key: key);

  @override
  _ModularTabMainMenuWidgetState createState() =>
      _ModularTabMainMenuWidgetState();
}

class _ModularTabMainMenuWidgetState extends State<ModularTabMainMenuWidget> {
  NavigationService _navigationService = serviceLocator<NavigationService>();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("Modular tab", maxLines: 1),
      leading: Icon(Icons.texture),
      onTap: () {
        _navigationService.navigate(ModularTabView.route);
      },
    );
  }
}
