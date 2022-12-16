import "package:flutter/material.dart";
import './parts/backgroundcurvewidget.dart';
import 'cardstackwidget.dart';

class Swipepage extends StatelessWidget {
  const Swipepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [
        BackgroudCurveWidget(),
        CardsStackWidget(),
      ],
    );
  }
}
