import 'package:favoutiteitems/Provider/favitemprovider.dart';
import 'package:favoutiteitems/Provider/theme_changer_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'View/homePage.dart';

void main() {
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
          create: (_) => FavouriteItem(),),
          ChangeNotifierProvider(
            create: (_) => DarkTheme(),),
        ],
          child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // final themeChanger = Provider.of<DarkTheme>(context);
    return MaterialApp(
      themeMode: Provider.of<DarkTheme>(context).themeMode,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.purple,
          iconTheme:const IconThemeData(
              color: Colors.pink
          )
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.teal,
          iconTheme:const IconThemeData(
            color: Colors.teal
          )
      ),
      home: const MyHomePage(),
    );
  }
}


