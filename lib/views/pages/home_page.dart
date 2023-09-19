import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:units_/views/widgets/snackbar.dart';
import 'package:units_/views/widgets/units.dart';

import '../../routes/route_manager.dart';
import '../../services/units_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      appBar: AppBar(
        title: const Text('Welcome'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                context.read<FetchUnits>().fetchUnits;
                Navigator.of(context).pushNamed(RouteManager.signIn);
              },
              icon: const Icon(Icons.logout_outlined))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
                    snackBar(context, 'Incorrect input');
                  }
                },
                child: const Text('Search')),
            const SizedBox(
              height: 9,
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(RouteManager.unitsPage);
              },
              child: const Text('View all units'),
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
