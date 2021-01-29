import 'package:flutter/material.dart';
import 'package:flutter_reduxpersist_arch/cores/constants/route.dart';
import 'package:flutter_reduxpersist_arch/features/counter/page/counter_page.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePath.COUNTER_PAGE:
        return AppRouter._buildRoute(builder: (BuildContext context) => CounterPage(), settings: settings);
      default:
        return AppRouter.unknownRoute(settings);
    }
  }

  static Route<dynamic> unknownRoute(RouteSettings settings) {
    return AppRouter._buildRoute(
        builder: (BuildContext context) {
          return Scaffold(
            body: Center(
              child: Text("No route defined for ${settings.name}."),
            ),
          );
        },
        settings: settings
    );
  }

  static Route<dynamic> _buildRoute({
    @required Function(BuildContext) builder,
    @required RouteSettings settings
  }) {
    return MaterialPageRoute(settings: settings, builder: builder);
  }
}