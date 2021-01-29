import 'package:flutter/material.dart';
import 'package:flutter_reduxpersist_arch/cores/constants/route.dart';
import 'package:flutter_reduxpersist_arch/router.dart';

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Redux Persist Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: RoutePath.TODO_PAGE,
      onGenerateRoute: AppRouter.generateRoute,
      onUnknownRoute: AppRouter.unknownRoute,
    );
  }
}
