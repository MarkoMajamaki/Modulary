import 'package:app/core/theme.dart';
import 'package:app/services/servicelocator.dart';
import 'package:app/core/main_menu.dart';
import 'package:app/views/modular_list_view.dart';
import 'package:flutkit/flutkit.dart';
import 'package:flutter/material.dart';
import 'package:modulary/modulary.dart';
import 'package:shared/services/navigation_service.dart';

class Shell extends StatefulWidget {
  static String route = "Shell";

  @override
  _ShellState createState() => _ShellState();
}

class _ShellState extends State<Shell> {
  @override
  Widget build(BuildContext context) {
    // Is app running on mobile
    final bool useMobileLayout = MediaQuery.of(context).size.shortestSide < 600;

    if (useMobileLayout) {
      return SideBar(
        body: MaterialApp(
          theme: getTheme(),
          initialRoute: ModularListView.route,
          debugShowCheckedModeBanner: false,
          navigatorKey: serviceLocator<NavigationService>().getNavigatorKey(),
          routes: Modules.routes(),
          onGenerateRoute: (settings) => Modules.onGenerateRoute(settings),
        ),
        menu: MainMenu(),
        subMenuWidth: 250,
        menuSpacing: 64,
        bodyBehavior: BodyBehavior.Move,
        verticalSeparatorThickness: 1,
        verticalSeparatorColor: Colors.black12,
        menuLocation: MenuLocation.Left,
      );
    } else {
      return SideBar(
        body: MaterialApp(
          theme: getTheme(),
          initialRoute: ModularListView.route,
          debugShowCheckedModeBanner: false,
          navigatorKey: serviceLocator<NavigationService>().getNavigatorKey(),
          routes: Modules.routes(),
          onGenerateRoute: (settings) => Modules.onGenerateRoute(settings),
        ),
        menu: MainMenu(),
        menuWidth: 230,
        menuNarrowWidth: 60,
        subMenuWidth: 250,
        bodyBehavior: BodyBehavior.Resize,
        menuOpenMode: MenuOpenMode.Default,
        menuCloseMode: MenuCloseMode.Narrow,
        subMenuOpenMode: SubMenuOpenMode.Floating,
        verticalSeparatorThickness: 1,
        verticalSeparatorColor: Colors.black12,
        menuLocation: MenuLocation.Left,
      );
    }
  }
}
