import 'package:app/views/modular_list_view.dart';
import 'package:app/core/shell.dart';
import 'package:app/views/modular_tab_view.dart';

getRoutes() {
  return {
    '/': (context) => Shell(),
    Shell.route: (context) => Shell(),
    ModularListView.route: (context) => ModularListView(),
    ModularTabView.route: (context) => ModularTabView(),
  };
}
