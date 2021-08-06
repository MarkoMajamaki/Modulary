import 'package:flutter/material.dart';
import 'package:module1/services/servicelocator.dart';
import 'package:module1/views/module1_view.dart';
import 'package:shared/services/navigation_service.dart';

class MainMenuWidget extends StatefulWidget {
  MainMenuWidget({Key? key}) : super(key: key);

  @override
  _MainMenuWidgetState createState() => _MainMenuWidgetState();
}

class _MainMenuWidgetState extends State<MainMenuWidget> {
  NavigationService _navigationService = serviceLocator<NavigationService>();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("Module1", maxLines: 1),
      leading: Icon(Icons.texture),
      onTap: () {
        _navigationService.navigate(Module1View.route);
      },
    );
  }
}
