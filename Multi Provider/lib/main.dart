import 'package:flutter/material.dart';
import 'package:multiprovider/Provider/countProvider.dart';
import 'package:multiprovider/Provider/oneProvider.dart';
import 'package:multiprovider/View/HomePage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FirstProvider()),
        ChangeNotifierProvider(create: (_) => CountProvider()),
      ],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Homepage(),
    );
  }
}


