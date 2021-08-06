import 'package:flutter/material.dart';
import 'package:module1/services/servicelocator.dart';
import 'package:module1/viewmodels/module1_viewmodel.dart';

class Module1View extends StatefulWidget {
  static String route = "Module1View";
  Module1View({Key? key}) : super(key: key);

  @override
  _Module1ViewState createState() => _Module1ViewState();
}

class _Module1ViewState extends State<Module1View> {
  Module1ViewModel _viewmodel = serviceLocator<Module1ViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Center(
          child: Text(_viewmodel.viewName),
        ),
      ),
    );
  }
}
