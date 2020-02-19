import 'package:flutter/material.dart';

const BoxDecoration kCustomBox = const BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.only(
    topLeft: Radius.circular(15),
    topRight: Radius.circular(15),
    bottomLeft: Radius.circular(15),
    bottomRight: Radius.circular(15),
  ),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      offset: Offset(0, 2),
      blurRadius: 6,
    )
  ],
);
