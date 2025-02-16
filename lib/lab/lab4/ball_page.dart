import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_multi/lab/lab5/xylophone.dart';

class BallPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        backgroundColor: Colors.green[600],
        title: const Text('GeeksforGeeks'),
      ),
      body: const Ball(),
      floatingActionButton: Align(
        alignment: Alignment.bottomCenter, // Căn giữa dưới
        child: TextButton(
          onPressed: () => Get.to(() => Xylophone()),
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.green[600],
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          ),
          child: const Text(
            'Xylophone',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

// Creates a Stateful widget
class Ball extends StatefulWidget {
  const Ball({super.key});

  @override
  _BallState createState() => _BallState();
}

class _BallState extends State<Ball> {
  int ballNumber = 1;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () {
          setState(() {
            ballNumber = Random().nextInt(5) + 1;
          });
        },
        // Adding images
        child: Image.asset(
          'assets/images/balls/ball$ballNumber.png',
        ),
      ),
    );
  }
}
