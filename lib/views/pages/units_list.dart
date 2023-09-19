import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../routes/route_manager.dart';
import '../../services/units_services.dart';
import '../widgets/units_card.dart';

class UnitsPage extends StatelessWidget {
  final int unitNumber = 0;
  const UnitsPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<FetchUnits>().fetchUnits;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Units'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                context.read<FetchUnits>().fetchUnits;
                Navigator.of(context).pushNamed(RouteManager.homePage);
                Navigator.of(context).pushNamed(RouteManager.homePage);
              },
              icon: const Icon(Icons.search))
        ],
      ),
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
                      ? const Text('Error Something went wrong...',
                          textAlign: TextAlign.center)
                      : ListView.builder(
                          itemCount: value.map['Specs'].length,
                          itemBuilder: (context, index) {
                            return UnitsCard(map: value.map['Specs'][index]);
                          },
                        );
            },
          ),
        ),
      ),
    );
  }
}
