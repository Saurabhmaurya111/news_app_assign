// main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:news_app/providers/theme_provider.dart';
import 'package:news_app/screens/login_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: themeProvider.themeMode,
          home: const SignInPage(),
        );
      },
    );
  }
}
