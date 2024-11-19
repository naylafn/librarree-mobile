import 'package:flutter/material.dart';
import 'package:librarree/screens/list_book.dart';
import 'package:librarree/screens/menu.dart';
import 'package:librarree/screens/book_form.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(children: [
      DrawerHeader(
        decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary),
        child: const Column(
          children: [
            Text(
              'Librarree',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Padding(padding: EdgeInsets.all(8)),
            Text(
              "Never Judge a Book by Its Cover",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      ListTile(
          leading: const Icon(Icons.home_outlined, color: Colors.blue),
          title: const Text('Home Page'),
          onTap: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => MyHomePage(),
                ));
          }),
      ListTile(
          leading: const Icon(
            IconData(0xee3c, fontFamily: 'MaterialIcons'),
            color: Colors.blue, // Customize the color if needed
          ),
          title: const Text('Add a New Book'),
          onTap: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const BookFormPage(),
                ));
          }),
      ListTile(
          leading: const Icon(
            IconData(0xf5cc, fontFamily: 'MaterialIcons'),
            color: Colors.blue, // Customize the color if needed
          ),
          title: const Text('Book List'),
          onTap: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const BookPage(),
                ));
          }),
    ]));
  }
}
