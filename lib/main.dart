import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_sphere_v116/models/note_model.dart';
import 'package:notes_sphere_v116/models/task_model.dart';
import 'package:notes_sphere_v116/providers/font_provider.dart';
import 'package:notes_sphere_v116/providers/note_Providers/note_provider.dart';
import 'package:notes_sphere_v116/providers/todo_providers/progress_provider.dart';
import 'package:notes_sphere_v116/providers/theme_provider.dart';
import 'package:notes_sphere_v116/providers/todo_providers/todo_provider.dart';
import 'package:notes_sphere_v116/utils/router.dart';
import 'package:notes_sphere_v116/theme/theme_data.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  // Ensure proper initialization
  WidgetsFlutterBinding.ensureInitialized();
  //initialized hive for flutter
  await Hive.initFlutter();
  await Hive.openBox('themeBox');

  //register adapter
  Hive.registerAdapter(NoteModelAdapter());
  Hive.registerAdapter(TaskModelAdapter());

  //open hive boxes
  await Hive.openBox('notes');
  await Hive.openBox("fonts");
  await Hive.openBox<TaskModel>('tasksBox');

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProgressProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => NoteProvider()),
        ChangeNotifierProvider(create: (_) => TodoProvider()),
        ChangeNotifierProvider(create: (_) => FontProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<ThemeProvider, FontProvider>(
      builder: (context, themeProvider, fontProvider, child) =>
          MaterialApp.router(
        themeMode: themeProvider.themeMode,
        theme: AppThemes.lightTheme(context),
        darkTheme: AppThemes.darkTheme(context),
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
