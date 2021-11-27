import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:manga/Ui/Main/pages_account.dart';
import 'package:manga/Ui/Main/pages_home.dart';
import 'package:manga/Ui/Main/pages_library.dart';
import 'package:manga/Ui/Main/pages_search.dart';
import 'package:manga/Utils/colors.dart';

class PagesMain extends StatefulWidget {
  const PagesMain({Key? key}) : super(key: key);

  @override
  _PagesMainState createState() => _PagesMainState();
}

class _PagesMainState extends State<PagesMain> {
  int _index = 0;
  final List<Widget> _pages = [
    const PagesHome(),
    const PagesLibrary(),
    const PagesSearch(),
    const PagesAccount(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: _pages[_index],
      bottomNavigationBar: FloatingNavbar(
          backgroundColor: primaryColor,
          selectedItemColor: primaryColor,
          items: [
            FloatingNavbarItem(
              icon: Icons.home,
              title: 'Home',
            ),
            FloatingNavbarItem(
                icon: Icons.format_list_bulleted_sharp, title: 'Library'),
            FloatingNavbarItem(icon: Icons.search, title: 'Search'),
            FloatingNavbarItem(icon: Icons.account_circle, title: 'Account'),
          ],
          currentIndex: _index,
          onTap: (int val) {
            setState(() {
              _index = val;
            });
          }),
    );
  }
}
