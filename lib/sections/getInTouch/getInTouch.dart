import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'getInTouchDesktop.dart';
import 'getInTouchMob.dart';

class GetInTouch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: GetInTouchMob(),
      tablet: GetInTouchMob(),
      desktop: GetInTouchDesktop(),
    );
  }
}
