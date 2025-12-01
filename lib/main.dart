import 'package:flutter/material.dart';
import 'package:pertemuan8/homepage.dart';
import 'package:pertemuan8/themeprovider.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ChangeNotifierProvider(
      create: (context) => Themeprovider(),
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Themeprovider>(
      builder:(context, tema, child) {
        return MaterialApp(
          title: 'Demo Tema Aplikasi',
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light(useMaterial3: true),
          darkTheme: ThemeData.dark(useMaterial3: true),
          themeMode:  tema.themeMode,
          home: const Homepage(),
        );
      },
    );
  }
}