import 'package:flutter/material.dart';

class PagesMain extends StatefulWidget {
  const PagesMain({Key? key}) : super(key: key);

  @override
  _PagesMainState createState() => _PagesMainState();
}

class _PagesMainState extends State<PagesMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Manga Indo"),
        centerTitle: true,
        leading: const Icon(Icons.account_circle),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const Text("Recommended"),
            Row(
              children: const <Widget>[
                Expanded(
                  child: Text("Recommended manga for you"),
                ),
                Expanded(
                  child: Text("See all"),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
