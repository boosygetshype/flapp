import 'package:flutter/material.dart';

extension PaddingExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  double get width => mediaQuery.size.width;
  double get height => mediaQuery.size.height;
  //-----------------------------< >-----------------------------//
}
