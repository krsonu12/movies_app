import 'package:flutter/material.dart';
import 'package:movies_app/routes/app_router.dart';
import 'package:movies_app/service_locator/service_locator.dart';

void main() {
  serviceLocator();
  getIt.allReady();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}
