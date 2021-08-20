import 'package:flutter/material.dart';
import 'package:shared/extensions/tab_extension.dart';
import 'package:flutkit/widgets/sidebar.dart';

TabExtension getTabExtension(BuildContext context) {
  Tab tab = Tab(
    child: Text("Module1"),
  );

  Center view = Center(
    child: Center(
      child: ElevatedButton(
        onPressed: () {
          SideBar.of(context).isMenuOpen = !SideBar.of(context).isMenuOpen;
        },
        child: Text("Open/close main menu from module 1"),
      ),
    ),
  );

  return TabExtension(tab, view);
}
