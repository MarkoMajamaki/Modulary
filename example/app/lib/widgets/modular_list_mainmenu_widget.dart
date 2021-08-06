import 'package:app/views/modular_list_view.dart' as listview;
import 'package:flutter/material.dart';
import 'package:module1/services/servicelocator.dart';
import 'package:shared/services/navigation_service.dart';

class ModularListMainMenuWidget extends StatefulWidget {
  ModularListMainMenuWidget({Key? key}) : super(key: key);

  @override
  _ModularListMainMenuWidgetState createState() =>
      _ModularListMainMenuWidgetState();
}

class _ModularListMainMenuWidgetState extends State<ModularListMainMenuWidget> {
  NavigationService _navigationService = serviceLocator<NavigationService>();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("Modular list", maxLines: 1),
      leading: Icon(Icons.texture),
      onTap: () {
        _navigationService.navigate(listview.ModularListView.route);
      },
    );
  }
}
