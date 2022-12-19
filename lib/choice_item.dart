import 'package:flutter/material.dart';

class ChoiceItem extends StatelessWidget {
  final Item item;
  final Color color;

  const ChoiceItem({
    Key? key,
    required this.color,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(
        item.name,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 17,
        ),
      ),
    );
  }
}

class ClickableChoiceItem extends StatefulWidget {
  final VoidCallback onTap;
  final Item item;
  final Color unpressedColor;
  final Color pressedColor;

  const ClickableChoiceItem({
    Key? key,
    required this.onTap,
    required this.item,
    required this.unpressedColor,
    required this.pressedColor,
  }) : super(key: key);

  @override
  State<ClickableChoiceItem> createState() => _ClickableChoiceItemState();
}

class _ClickableChoiceItemState extends State<ClickableChoiceItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        widget.onTap(),
        _onTap(widget.item),
      },
      child: ChoiceItem(
          item: widget.item,
          color: widget.item.isSelected
              ? widget.pressedColor
              : widget.unpressedColor),
    );
  }

  void _onTap(Item item) {
    setState(() {
      item.isSelected = !item.isSelected;
      item.lastUpdate = DateTime.now();
    });
  }
}

class Item {
  final String name;
  bool isSelected;
  DateTime lastUpdate = DateTime.now();

  Item({
    required this.name,
  })  : isSelected = false,
        lastUpdate = DateTime.now();
}
