import 'package:flutter/material.dart';
import 'package:gather/constants/assets.dart';
class Destination {
  const Destination({required this.imagePath});

  final String imagePath;
}

const destinations = [
  Destination( imagePath: Assets.home1),
  Destination( imagePath: Assets.locate),
  Destination( imagePath: Assets.add),
  Destination(imagePath: Assets.chat),
  Destination(imagePath: Assets.profile),
];
