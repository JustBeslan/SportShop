part of "../theme.dart";

class ThemeColors extends ThemeExtension<ThemeColors> {
  final Color backgroundColor;
  final Color otherItemColor;
  final Color textFieldBackgroundColor;
  final Color mainButtonBackgroundColor;
  final Color otherTextOnBackgroundColor;
  final Color startGradientOnCardProductColor;
  final Color backgroundInfoTextOnCardProductColor;
  final Color buttonIconColor;

  ThemeColors({
    required this.backgroundColor,
    required this.otherItemColor,
    required this.textFieldBackgroundColor,
    required this.mainButtonBackgroundColor,
    required this.otherTextOnBackgroundColor,
    required this.startGradientOnCardProductColor,
    required this.backgroundInfoTextOnCardProductColor,
    required this.buttonIconColor,
  });

  @override
  ThemeExtension<ThemeColors> copyWith({
    Color? backgroundColor,
    Color? otherItemColor,
    Color? textFieldBackgroundColor,
    Color? mainButtonBackgroundColor,
    Color? otherTextOnBackgroundColor,
    Color? startGradientOnCardProductColor,
    Color? backgroundInfoTextOnCardProductColor,
    Color? buttonIconColor,
  }) {
    return ThemeColors(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      otherItemColor: otherItemColor ?? this.otherItemColor,
      textFieldBackgroundColor: textFieldBackgroundColor ?? this.textFieldBackgroundColor,
      mainButtonBackgroundColor: mainButtonBackgroundColor ?? this.mainButtonBackgroundColor,
      otherTextOnBackgroundColor: otherTextOnBackgroundColor ?? this.otherTextOnBackgroundColor,
      startGradientOnCardProductColor: startGradientOnCardProductColor ?? this.startGradientOnCardProductColor,
      backgroundInfoTextOnCardProductColor: backgroundInfoTextOnCardProductColor ?? this.backgroundInfoTextOnCardProductColor,
      buttonIconColor: buttonIconColor ?? this.buttonIconColor,
    );
  }

  @override
  ThemeExtension<ThemeColors> lerp(
      ThemeExtension<ThemeColors>? other,
      double t) {

    if (other is! ThemeColors) {
      return this;
    }

    return ThemeColors(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      otherItemColor: Color.lerp(otherItemColor, other.otherItemColor, t)!,
      textFieldBackgroundColor: Color.lerp(textFieldBackgroundColor, other.textFieldBackgroundColor, t)!,
      mainButtonBackgroundColor: Color.lerp(mainButtonBackgroundColor, other.mainButtonBackgroundColor, t)!,
      otherTextOnBackgroundColor: Color.lerp(otherTextOnBackgroundColor, other.otherTextOnBackgroundColor, t)!,
      startGradientOnCardProductColor: Color.lerp(startGradientOnCardProductColor, other.startGradientOnCardProductColor, t)!,
      backgroundInfoTextOnCardProductColor: Color.lerp(backgroundInfoTextOnCardProductColor, other.backgroundInfoTextOnCardProductColor, t)!,
      buttonIconColor: Color.lerp(buttonIconColor, other.buttonIconColor, t)!,
    );
  }

  static get light => ThemeColors(
    backgroundColor: AppColors.white,
    otherItemColor: AppColors.black,
    textFieldBackgroundColor: AppColors.lightGrey,
    mainButtonBackgroundColor: AppColors.violet,
    otherTextOnBackgroundColor: AppColors.grey,
    startGradientOnCardProductColor: AppColors.blackTransparent,
    backgroundInfoTextOnCardProductColor: AppColors.lightGrey08,
    buttonIconColor: AppColors.lightGrey,
  );

}
