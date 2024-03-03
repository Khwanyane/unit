import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:units_/views/widgets/snackbar.dart';
import 'package:units_/views/widgets/units_card.dart';
import '../../routes/route_manager.dart';
import '../../services/units_services.dart';

class Unit extends StatelessWidget {
  final int unitNumber;

  const Unit({super.key, required this.unitNumber});

  @override
  Widget build(BuildContext context) {
    context.read<FetchUnits>().fetchUnits;
    return Scaffold(
      backgroundColor: Colors.grey[350],
      appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(RouteManager.unitsPage);
              },
              icon: const Icon(Icons.arrow_back)),
          automaticallyImplyLeading: false,
          title: const Text('u n i t'),
          centerTitle: true,
          backgroundColor: Colors.grey[350],
          actions: [
            IconButton(
                onPressed: () {
                  context.read<FetchUnits>().fetchUnits;
                  Navigator.of(context).pushNamed(RouteManager.searchPage);
                },
                icon: const Icon(Icons.search))
          ]),
      body: RefreshIndicator(
        onRefresh: () async {
          await context.read<FetchUnits>().fetchUnits;
        },
        child: Center(
          child: Consumer<FetchUnits>(
            builder: (context, value, child) {
              return value.map.isEmpty && !value.error
                  ? const CircularProgressIndicator()
                  : value.error
                      ? const Text('Error: Incorrect input detected ',
                          textAlign: TextAlign.center)
                      : ListView.builder(
                          itemCount: value.map['Specs'].length - 3,
                          itemBuilder: (context, index) {
                            if (unitNumber < 1 && unitNumber > 4) {
                              snackBar(context, 'error');
                            } else {
                              return UnitsCard(
                                map: value.map['Specs'][unitNumber - 1],
                              );
                            }
                          },
                        );
            },
          ),
        ),
      ),
    );
  }
}
