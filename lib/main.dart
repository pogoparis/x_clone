import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:x_clone/pages/connection_page.dart';
import 'package:x_clone/pages/newtweet_page.dart';

import 'pages/twitter_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final goRouter = GoRouter(
      initialLocation: "/",
      routes: [
        GoRoute(
            path: "/tweets", builder: (context,state)=> const TwitterPage(),
            routes: [
              GoRoute(path: 'new', builder: (context,state)=> const NewTweetPage(),
              )
            ]
        ),
        GoRoute(path: "/",builder: (context,state)=> const ConnexionPage()),
      ]
  );

/*  final goRouter = GoRouter(
      initialLocation: "/", routes: [
    GoRoute(path: "/", builder: (context, state) => ConnexionPage()),
    GoRoute(path: "/tweets", builder: (context, state) => TwitterPage()),
    GoRoute(path: "/new", builder: (context, state) => NewTweetPage()),
  ]);*/

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