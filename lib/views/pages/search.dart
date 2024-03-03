import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:units_/views/widgets/snackbar.dart';
import 'package:units_/views/widgets/units.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _HomePageState();
}

class _HomePageState extends State<Search> {
  late TextEditingController unit;
  int unitNumber = 0;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    unit = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    unit.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[350],
      appBar: AppBar(
        backgroundColor: Colors.grey[350],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Lottie.asset('assets/search.json'),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                controller: unit,
                decoration: const InputDecoration(
                    hintText: 'Please enter the unit number',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(9))),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(9)))),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () {
                unitNumber = int.parse(unit.text);

                if (unitNumber >= 1 && unitNumber <= 4) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => Unit(
                            unitNumber: unitNumber,
                          )),
                    ),
                  );
                } else {
                  snackBar(context, 'incorrect input');
                }
              },
              child: const Text(
                'Search',
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
            ),
            const SizedBox(
              height: 9,
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
