import 'package:flutter/material.dart';
import 'package:task_manager/core/config/app_router.dart';
import 'package:task_manager/core/config/injection_container.dart';

void main() {
  init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: route,
    );
  }
}
