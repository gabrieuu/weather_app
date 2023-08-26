import 'package:flutter/material.dart';
import 'package:weather_app/view/home_page.dart';
import 'package:weather_app/view/search_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: "/",
      routes: {
        "/" : (context) => const SearchPage(),
        "/homepage" : (context) => const HomePage(),
      },
    );
  }
}
