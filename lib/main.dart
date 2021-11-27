import 'package:flutter/material.dart';
import 'package:manga/Ui/Main/pages_account.dart';
import 'package:manga/Ui/Main/pages_library.dart';
import 'package:manga/Ui/Main/pages_main.dart';
import 'package:manga/Ui/Main/pages_search.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "Manga Indo", initialRoute: "/", routes: {
      '/': (context) => const PagesMain(),
      '/library': (context) => const PagesLibrary(),
      '/search': (context) => const PagesSearch(),
      '/account': (context) => const PagesAccount()
    });
  }
}
