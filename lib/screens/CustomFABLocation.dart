import 'package:flutter/material.dart';

class CustomFABLocation extends FloatingActionButtonLocation {
  final double offsetX; // Horizontal offset from the aligned position
  final double offsetY; // Vertical offset from the aligned position
  final FloatingActionButtonLocation baseLocation;

  CustomFABLocation(this.baseLocation, this.offsetX, this.offsetY);

  @override
  Offset getOffset(ScaffoldPrelayoutGeometry scaffoldGeometry) {
    // Get the Offset provided by the base location
    final Offset baseOffset = baseLocation.getOffset(scaffoldGeometry);
    return Offset(baseOffset.dx + offsetX, baseOffset.dy + offsetY);
  }
}
