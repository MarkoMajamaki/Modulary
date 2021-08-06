import 'package:flutter/material.dart';
import 'package:modulary/modulary.dart';
import 'package:shared/extension_keys.dart';
import 'package:shared/extensions/tab_extension.dart';

///
/// Multi module tab view example
///
class ModularTabView extends StatefulWidget {
  static String route = "ModularTabView";
  ModularTabView({Key? key}) : super(key: key);

  @override
  _ModularTabViewState createState() => _ModularTabViewState();
}

class _ModularTabViewState extends State<ModularTabView> {
  late List<TabExtension> _tabs;

  @override
  void initState() {
    super.initState();

    // Get tab extensions
    _tabs = Extensions.getExtensions<TabExtension>(modularTabKey);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Modular TabView"),
          bottom: TabBar(
            tabs: _tabs.map<Widget>((x) => x.tab).toList(),
          ),
        ),
        body: TabBarView(
          children: _tabs.map<Widget>((x) => x.view).toList(),
        ),
      ),
    );
  }
}
