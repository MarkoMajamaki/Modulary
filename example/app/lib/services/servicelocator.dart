import 'package:app/viewmodels/modular_list_viewmodel.dart';
import 'package:app/viewmodels/modular_tab_viewmodel.dart';
import 'package:get_it/get_it.dart';
import 'package:shared/services/navigation_service.dart';

GetIt serviceLocator = GetIt.instance;

/// Register common services
///
void setupServiceLocator() {
  // Services
  serviceLocator.registerLazySingleton(() => NavigationService());

  // Viewmodels
  serviceLocator
      .registerFactory<ModularListViewModel>(() => ModularListViewModel());
  serviceLocator
      .registerFactory<ModularTabViewModel>(() => ModularTabViewModel());
}
