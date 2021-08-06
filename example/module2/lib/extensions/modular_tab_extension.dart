import 'package:flutter/material.dart';
import 'package:shared/extensions/tab_extension.dart';

TabExtension getTabExtension() {
  Tab tab = Tab(
    child: Text("Module2"),
  );

  Center view = Center(
    child: Text("Module2 content"),
  );

  return TabExtension(tab, view);
}
