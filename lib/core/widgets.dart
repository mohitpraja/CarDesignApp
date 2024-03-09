import 'package:flutter/material.dart';

Widget bulletPointText(String text) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        margin: const EdgeInsets.only(top: 5, right: 5),
        child: const Icon(
          Icons.fiber_manual_record,
          size: 10,
        ),
      ),
      Expanded(
        child: Text(
          text,
          style: const TextStyle(fontSize: 14),
        ),
      ),
    ],
  );
}
