import 'package:flutter/material.dart';
import 'package:notes_sphere_v116/utils/router.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
    );
  }
}
