import 'package:flutter/material.dart';

class SideBarItem extends StatelessWidget {
  const SideBarItem(
      {Key? key,
      required this.item,
      required this.currentItem,
      required this.onSelectedItem})
      : super(key: key);
  final String item;
  final String currentItem;
  final ValueChanged<String> onSelectedItem;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 5),
      child: Container(
        decoration: BoxDecoration(
          color: item == currentItem ? Colors.black12 : Colors.transparent,
        ),
        child: ListTile(
          minLeadingWidth: 20,
          selected: item == currentItem,
          title: Text(
            item,
            style: const TextStyle(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          onTap: () => onSelectedItem(item),
        ),
      ),
    );
  }
}
