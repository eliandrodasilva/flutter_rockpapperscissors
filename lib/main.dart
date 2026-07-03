import 'package:flutter/material.dart';
import 'package:flutter_rockpapperscissors/screens/home_screen.dart';
import 'package:flutter_rockpapperscissors/screens/game_screen.dart';
import 'package:flutter_rockpapperscissors/screens/result_screen.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  final GoRouter _routes = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
      GoRoute(path: '/game', builder: (context, state) => const GameScreen()),
      GoRoute(
        path: '/result/:choice',
        builder: (context, state) {
          final choice = state.pathParameters['choice'];
          return ResultScreen(choice: choice);
        },
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Rock, Paper & Scissors',
      routerConfig: _routes,
    );
  }
}
