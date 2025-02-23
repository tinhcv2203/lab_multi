import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Thêm GetX để điều hướng dễ dàng
import 'package:lab_multi/lab/lab6/quizzler.dart'; // Import trang Quizzler

class Xylophone extends StatelessWidget {
  final AudioPlayer player = AudioPlayer();

  void playSound(int noteNumber) async {
    await player.setSource(AssetSource('note$noteNumber.wav'));
    player.resume(); // Phát âm thanh
  }

  Expanded buildKey({required Color color, required int noteNumber}) {
    return Expanded(
      child: TextButton(
        onPressed: () {
          playSound(noteNumber);
        },
        style: TextButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
        ),
        child: const SizedBox.shrink(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        backgroundColor: Colors.green[600],
        title: const Text('Xylophone'),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildKey(color: Colors.red, noteNumber: 1),
            buildKey(color: Colors.orange, noteNumber: 2),
            buildKey(color: Colors.yellow, noteNumber: 3),
            buildKey(color: Colors.green, noteNumber: 4),
            buildKey(color: Colors.teal, noteNumber: 5),
            buildKey(color: Colors.blue, noteNumber: 6),
            buildKey(color: Colors.purple, noteNumber: 7),
            const SizedBox(height: 20),
            Center(
              child: TextButton(
                onPressed: () => Get.to(() => Quizzler()),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.green[600],
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
                child: const Text(
                  'Quizzler',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
