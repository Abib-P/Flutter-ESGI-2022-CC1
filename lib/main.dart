import 'package:flutter/material.dart';
import 'package:tp_paul_abib/footer.dart';
import 'package:tp_paul_abib/header.dart';

import 'choice_item.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'TP Paul Abib',
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Item> items = List.unmodifiable([
    Item(name: "cinema"),
    Item(name: "petanque"),
    Item(name: "fitness"),
    Item(name: "League of Legend"),
    Item(name: "basket"),
    Item(name: "shopping"),
    Item(name: "programmation"),
  ]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Header(
              items: items,
            ),
          ),
          Expanded(
            flex: 1,
            child: Footer(
              onTab: () => setState(() {}),
              items: items,
            ),
          ),
        ],
      ),
    );
  }
}
