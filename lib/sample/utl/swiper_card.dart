import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class SwiperCard extends StatelessWidget {
  final color;

  SwiperCard({required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("イルカ"),
    );
  }
}
