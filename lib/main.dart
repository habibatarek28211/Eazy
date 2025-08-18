import 'dart:async';
import 'package:easy_app/core/routing/app_routes.dart';
import 'package:easy_app/notification/presentation/screen/no_notification_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';


void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const EasyApp());
  Timer(Duration(seconds: 1), () => FlutterNativeSplash.remove());
}

class EasyApp extends StatelessWidget {
  const EasyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Cairo'),
      routes: AppRoutes.routes,
      debugShowCheckedModeBanner: false,
      initialRoute: NoNotificationBody.routeName,
    );
  }
}
