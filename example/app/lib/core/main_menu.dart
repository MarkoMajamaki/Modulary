import 'package:app/widgets/modular_list_mainmenu_widget.dart';
import 'package:app/widgets/modular_tab_mainmenu_widget.dart';
import 'package:modulary/modulary.dart';
import 'package:flutkit/widgets/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:shared/extension_keys.dart';

class MainMenu extends StatefulWidget {
  static String route = "MainMenuWidget";

  MainMenu({Key? key}) : super(key: key);

  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  List<Widget> _mainMenuWidgets = [];

  @override
  Widget build(BuildContext context) {
    _mainMenuWidgets = Extensions.get<Widget>(mainMenuWidgetKey);
    _mainMenuWidgets.insert(0, ModularListMainMenuWidget());
    _mainMenuWidgets.insert(0, ModularTabMainMenuWidget());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        titleSpacing: 0,
        title: Container(
          width: 56,
          height: 56,
          child: IconButton(
            icon: Icon(Icons.menu, color: Colors.black),
            onPressed: () {
              SideBar.of(context).isMenuOpen = !SideBar.of(context).isMenuOpen;
            },
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(children: _mainMenuWidgets),
    );
  }
}
