import 'package:flutter/material.dart';

import 'cup_cake.dart';
import 'face_page.dart';
import 'game_page.dart';
import 'hail_page.dart';

class ScaffoldPage extends StatefulWidget {
  const ScaffoldPage({super.key});

  @override
  State<ScaffoldPage> createState() => _ScaffoldPageState();
}

class _ScaffoldPageState extends State<ScaffoldPage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.menu_book),
          title: const Text("My Scaffold"),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.settings),
            ),
            IconButton(
              onPressed: () {},
              icon:
                  const Badge(label: Text('1'), child: Icon(Icons.accessible)),
            ),
            PopupMenuButton<String>(
              padding: EdgeInsets.zero,
              onSelected: (value) {
                if (value == 'Apple') {}
              },
              itemBuilder: (context) => <PopupMenuItem<String>>[
                const PopupMenuItem<String>(
                  value: "Apple",
                  child: Text("Apple"),
                ),
                const PopupMenuItem<String>(
                  enabled: false,
                  child: Text("Orange"),
                ),
                const PopupMenuItem<String>(
                  value: "Grapes",
                  child: Text("Grapes"),
                ),
              ],
            ),
          ],
        ),
        drawer: const Drawer(),
        endDrawer: const Drawer(),
        bottomNavigationBar: BottomNavigationBar(
          useLegacyColorScheme: false,
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          currentIndex: currentIndex,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.face), label: 'Face'),
            BottomNavigationBarItem(icon: Icon(Icons.gamepad), label: 'game'),
            BottomNavigationBarItem(icon: Icon(Icons.hail), label: 'Heal'),
            BottomNavigationBarItem(icon: Icon(Icons.cake), label: 'Cake')
          ],
        ),
        body: Builder(builder: (context) {
          switch (currentIndex) {
            case 0:
              return const FacePage();
            case 1:
              return const GamePage();
            case 2:
              return const HailPage();

            case 3:
              return CupCake();
            default:
              return const SizedBox();
          }
        }));
  }
}
