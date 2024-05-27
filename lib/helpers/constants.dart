
import 'package:flutter/cupertino.dart';

extension MediaQueryHelpers on BuildContext {
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;
  double get bottom => MediaQuery.of(this).viewInsets.bottom;
  double get topPadding => MediaQuery.of(this).viewPadding.top;
}