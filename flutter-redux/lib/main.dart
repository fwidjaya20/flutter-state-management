import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_reduxpersist_arch/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp
  ]);
  runApp(MyApp());
}
