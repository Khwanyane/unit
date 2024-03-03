import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:units_/routes/route_manager.dart';
import 'package:units_/views/widgets/button.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  late TextEditingController name;
  late String input;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    name = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    name.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[350],
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(60.0),
              child: Lottie.asset('assets/hi.json'),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                controller: name,
                decoration: const InputDecoration(
                    hintText: 'What is your name ?',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(9))),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(9)))),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  final snackBar = SnackBar(
                    content: Text(
                      'hello ${name.text}',
                      style: const TextStyle(color: Colors.black),
                    ),
                    backgroundColor: Colors.grey[200],
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                });
                Navigator.of(context).pushNamed(RouteManager.unitsPage);
              },
              child: const Text(
                'Submit',
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
            ),
          
          ],
        ),
      ),
    );
  }
}
