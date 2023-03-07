
import 'package:effective_mobile_flutter_task/themes/theme.dart';
import 'package:flutter/material.dart';

extension BuildContextExt on BuildContext {
  ThemeTextStyles get text => Theme.of(this).extension<ThemeTextStyles>()!;
  ThemeColors get color => Theme.of(this).extension<ThemeColors>()!;

  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;
}
