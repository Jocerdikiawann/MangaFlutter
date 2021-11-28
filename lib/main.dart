import 'package:flutter/material.dart';
import 'package:manga/Provider/manga_provider.dart';
import 'package:manga/Ui/Main/pages_account.dart';
import 'package:manga/Ui/Main/pages_home.dart';
import 'package:manga/Ui/Main/pages_library.dart';
import 'package:manga/Ui/Main/pages_main.dart';
import 'package:manga/Ui/Main/pages_search.dart';
import 'package:provider/provider.dart';

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MangaProvider(),
        ),
      ],
      child: MaterialApp(
        title: "Manga Indo",
        theme: ThemeData(fontFamily: "Montserrat"),
        initialRoute: "/",
        routes: {
          '/': (context) => const PagesMain(),
          "/home": (context) => const PagesHome(),
          '/library': (context) => const PagesLibrary(),
          '/search': (context) => const PagesSearch(),
          '/account': (context) => const PagesAccount()
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
