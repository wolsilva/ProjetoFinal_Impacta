// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
//fonte https://github.com/DevGomes78/Flutter-ViaCep-Api/tree/master

class ContainerWidget extends StatelessWidget {
  Alignment? alignment;
  double? height;
  double? width;
  Widget? child;
  Color? color;

  ContainerWidget(
    this.alignment,
    this.height,
    this.width,{
    this.child,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      alignment: alignment,
      child: child,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
      ),
    );
  }
}
