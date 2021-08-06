import 'package:flutter/material.dart';

class MainMenuWidget extends StatefulWidget {
  MainMenuWidget({Key? key}) : super(key: key);

  @override
  _MainMenuWidgetState createState() => _MainMenuWidgetState();
}

class _MainMenuWidgetState extends State<MainMenuWidget> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("Module2", maxLines: 1),
      leading: Icon(Icons.texture),
    );
  }
}
