// ignore_for_file: prefer_conditional_assignment

import 'package:ta_caro/shared/theme/app_colors.dart';
import 'package:ta_caro/shared/theme/app_text_styles.dart';

export 'app_text.dart';

class AppTheme {
  static final AppTheme instance = AppTheme();

  final _colors = AppColors();
  static AppColors get colors => instance._colors;

  final _textStyles = AppTextStyles();
  static AppTextStyles get textStyles => instance._textStyles;
}
