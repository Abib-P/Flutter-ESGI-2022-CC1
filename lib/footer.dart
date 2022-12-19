import 'package:flutter/material.dart';
import 'package:tp_paul_abib/choice_item.dart';

class Footer extends StatelessWidget {
  final VoidCallback onTab;
  final List<Item> items;

  const Footer({
    Key? key,
    required this.onTab,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.only(
        top: 10,
      ),
      child: Wrap(
        spacing: 10,
        runSpacing: 10,
        children: items
            .map((item) => ClickableChoiceItem(
                  onTap: onTab,
                  item: item,
                  unpressedColor: const Color.fromRGBO(236, 236, 236, 1),
                  pressedColor: const Color.fromRGBO(229, 184, 87, 1),
                ))
            .toList(),
      ),
    );
  }
}
