import 'package:flutter/material.dart';

void snackBar(BuildContext context, String message) {
  final snackBar = SnackBar(
    content: Text(
      message,
      style: const TextStyle(color: Colors.black),
    ),
    duration: const Duration(seconds: 1),
    backgroundColor: Colors.grey[200],
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
