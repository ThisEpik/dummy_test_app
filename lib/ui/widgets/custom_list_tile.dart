import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final String hintText;
  final String valueText;

  const CustomListTile(
      {super.key, required this.hintText, required this.valueText});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
          color: Colors.grey[200], borderRadius: BorderRadius.circular(6)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(hintText),
          Text(valueText),
        ],
      ),
    );
  }
}
