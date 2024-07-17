import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'item_provider.dart';
import 'item_list_screen.dart';
import 'favorite_list_screen.dart';
import 'HomeScreen.dart'; 

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ItemProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(), 
      routes: {
        '/favorites': (context) => FavoriteListScreen(),
        '/itemList': (context) => ItemListScreen(), 
      },
    );
  }
}
