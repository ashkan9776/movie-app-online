import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_app/main.dart';

class ConnectionScreen extends StatefulWidget {
  const ConnectionScreen({super.key});

  @override
  State<ConnectionScreen> createState() => _ConnectionScreenState();
}

class _ConnectionScreenState extends State<ConnectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset("assets/animation/check-internet.json", height: 100),
            const Text("No Connection Internet!\n check your connection"),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MyApp(),
                    ));
              },
              child: const Text("Try Again"),
            )
          ],
        ),
      ),
    );
  }
}
