import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notes_sphere_v116/pages/home_page.dart';
import 'package:notes_sphere_v116/pages/notes_page.dart';
import 'package:notes_sphere_v116/pages/todo_page.dart';

class AppRouter {
  static final router = GoRouter(
    navigatorKey: GlobalKey<NavigatorState>(),
    debugLogDiagnostics: false,
    initialLocation: "/",
    routes: [
      GoRoute(
        name: "home",
        path: "/",
        builder: (context, state) {
          return HomePage();
        },
      ),
      GoRoute(
        name: "notes",
        path: "/notes",
        builder: (context, state) {
          return NotesPage();
        },
      ),
      GoRoute(
        name: "todos",
        path: "/todos",
        builder: (context, state) {
          return TodoPage();
        },
      )
    ],
  );
}
