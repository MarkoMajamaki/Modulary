import 'package:flutter/material.dart';
import 'package:shared/extensions/tab_extension.dart';

TabExtension getTabExtension() {
  Tab tab = Tab(
    child: Text("Module1"),
  );

  Center view = Center(
    child: Text("Module1 content"),
  );

  return TabExtension(tab, view);
}
