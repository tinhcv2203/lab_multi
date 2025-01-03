import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import '../controller/dicee_controller.dart';

class RollDiceRight extends StatelessWidget {
  const RollDiceRight({
    super.key,
    required this.diceController,
  });

  final DiceController diceController;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: diceController.rollDiceRight,
      child: Obx(() => SizedBox(
        width: 300,
        height: 300,
        child: Image.asset(
          'assets/images/dices/dice${diceController.rightDiceNumber.value}.png',
        ),
      )),
    );
  }
}