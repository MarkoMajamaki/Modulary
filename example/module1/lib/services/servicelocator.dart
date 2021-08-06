import 'package:get_it/get_it.dart';
import 'package:module1/viewmodels/module1_viewmodel.dart';

// ViewModels

GetIt serviceLocator = GetIt.instance;

/// Initialize service locator
///
void setupServiceLocator() {
  // Viewmodels
  serviceLocator.registerFactory<Module1ViewModel>(() => Module1ViewModel());
}
