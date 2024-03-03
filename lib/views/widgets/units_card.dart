import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class UnitsCard extends StatelessWidget {
  const UnitsCard({
    super.key,
    required this.map,
  });
  final Map<String, dynamic> map;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[350],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Text(
              '${map['unit']}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
              padding: const EdgeInsets.all(14.0),
              child: Text(
                '${map['concepts']}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              )),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Text(
              '${map['definition']}',
            ),
          ),
          const SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}
