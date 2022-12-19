import 'package:flutter/material.dart';
import 'package:tp_paul_abib/choice_item.dart';

class Header extends StatelessWidget {
  final List<Item> items;

  const Header({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var itemsList = items
        .where((item) => item.isSelected)
        .map((item) => ChoiceItem(
              item: item,
              color: const Color.fromRGBO(236, 236, 236, 1),
            ))
        .toList();

    itemsList.sort((a, b) => a.item.lastUpdate.compareTo(b.item.lastUpdate));

    return Container(
      color: const Color.fromRGBO(107, 59, 235, 1),
      width: double.infinity,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Vos choix :",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: atLeastOneItemIsSelected() ? Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: itemsList,
                ) : const Text(
                  "Cliquez sur les choix en dessous !",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool atLeastOneItemIsSelected() {
    return items.where((element) => element.isSelected).toList().isNotEmpty;
  }
}
