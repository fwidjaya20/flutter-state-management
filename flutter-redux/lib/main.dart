import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_reduxpersist_arch/app.dart';
import 'package:flutter_reduxpersist_arch/store.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp
  ]);
  await SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent
    )
  );

  final store = createStore();

  runApp(
    StoreProvider(
      store: store,
      child: MyApp()
    )
  );
}
