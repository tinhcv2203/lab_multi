import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lab_multi/lab/lab3/dicee.dart';
import '../../utils/constants/image_strings.dart';
import '../../widgets/card.dart';
import 'package:get/get.dart';

class MiCard extends StatelessWidget {
  const MiCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text(
          'Mi Card',
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ),
      backgroundColor: Colors.teal,
      body: Center(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage(HpImages.profile),
              ),
              Text(
                'Tinh Van Cao',
                style: GoogleFonts.pacifico(
                  fontSize: 40.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'SOFTWARE ENGINEER',
                style: GoogleFonts.sourceSans3(
                  color: Colors.teal.shade100,
                  fontSize: 20.0,
                  letterSpacing: 2.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20.0,
                width: 150.0,
                child: Divider(
                  color: Colors.teal,
                ),
              ),
              const CardWidgets(text: '0357896515', icon: Icons.phone),
              const CardWidgets(text: 'tinhcv.21it@vku.udn.vn', icon: Icons.mail),
              const SizedBox(height: 50),
              TextButton(
                onPressed: () => Get.to(() => DicePage()),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.green[600],
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
                child: const Text(
                  'Dicee',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}