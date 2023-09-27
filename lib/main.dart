import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:x_clone/connection_page.dart';

import 'twitter_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final goRouter = GoRouter(
    initialLocation: "/connection",
    routes: [
      GoRoute(path: '/connection', builder: (context,state)=> ConnexionPage(),),
      GoRoute(path: '/tweets', builder: (context,state)=> TweeterPage(),
      ),
    ],
  );



  @override
  Widget build(BuildContext context) {
  return MaterialApp.router(
      routerConfig: goRouter,
  title: 'XClone Appli',
  theme: ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
  useMaterial3: true,
  ),
  );
  }
}