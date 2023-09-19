import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:units_/routes/route_manager.dart';
import 'package:units_/services/units_services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FetchUnits(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: RouteManager.signIn,
        onGenerateRoute: RouteManager.routeGenerator,
      ),
    );
  }
}
