import 'package:flutter/material.dart';
import 'package:notes_sphere_v116/providers/progress_provider.dart';
import 'package:notes_sphere_v116/utils/router.dart';
import 'package:notes_sphere_v116/theme/theme_data.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProgressProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: AppThemes.darkTheme,
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
    );
  }
}
