import 'package:flutter/material.dart';

class UnitsCard extends StatelessWidget {
  const UnitsCard({
    super.key,
    required this.map,
  });
  final Map<String, dynamic> map;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Padding(
          //   padding: const EdgeInsets.all(14.0),
          //   child: Image.network('${map['image']}'),
          // ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Text(
              '${map['unit']}',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Text('${map['concepts']}',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Text('${map['definition']}'),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
