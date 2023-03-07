part of "../theme.dart";

class ThemeTextStyles extends ThemeExtension<ThemeTextStyles> {
  final TextStyle authTitle;
  final TextStyle textInput;
  final TextStyle hintTextInput;
  final TextStyle textMainButton;
  final TextStyle labelText1;
  final TextStyle linkText;
  final TextStyle additionalLoginText;
  final TextStyle labelText2;
  final TextStyle appBarTitle1;
  final TextStyle appBarTitle2;
  final TextStyle itemMenuText;
  final TextStyle typeProductText;
  final TextStyle categoryProductText;
  final TextStyle nameProductText;
  final TextStyle priceProductText;

  ThemeTextStyles({
    required this.authTitle,
    required this.textInput,
    required this.hintTextInput,
    required this.textMainButton,
    required this.labelText1,
    required this.linkText,
    required this.additionalLoginText,
    required this.labelText2,
    required this.appBarTitle1,
    required this.appBarTitle2,
    required this.itemMenuText,
    required this.typeProductText,
    required this.categoryProductText,
    required this.nameProductText,
    required this.priceProductText,
  });

  @override
  ThemeExtension<ThemeTextStyles> copyWith({
    TextStyle? authTitle,
    TextStyle? textInput,
    TextStyle? hintTextInput,
    TextStyle? textMainButton,
    TextStyle? labelText,
    TextStyle? linkText,
    TextStyle? additionalLoginText,
    TextStyle? labelSmallText,
    TextStyle? appBarTitle1,
    TextStyle? appBarTitle2,
    TextStyle? itemMenuText,
    TextStyle? typeProductText,
    TextStyle? categoryProductText,
    TextStyle? nameProductText,
    TextStyle? priceProductText,
  }) {
    return ThemeTextStyles(
      authTitle: authTitle ?? this.authTitle,
      textInput: textInput ?? this.textInput,
      hintTextInput: hintTextInput ?? this.hintTextInput,
      textMainButton: textMainButton ?? this.textMainButton,
      labelText1: labelText ?? this.labelText1,
      linkText: linkText ?? this.linkText,
      additionalLoginText: additionalLoginText ?? this.additionalLoginText,
      labelText2: labelSmallText ?? this.labelText2,
      appBarTitle1: appBarTitle1 ?? this.appBarTitle1,
      appBarTitle2: appBarTitle2 ?? this.appBarTitle2,
      itemMenuText: itemMenuText ?? this.itemMenuText,
      typeProductText: typeProductText ?? this.typeProductText,
      categoryProductText: categoryProductText ?? this.categoryProductText,
      nameProductText: nameProductText ?? this.nameProductText,
      priceProductText: priceProductText ?? this.priceProductText,
    );
  }

  @override
  ThemeExtension<ThemeTextStyles> lerp(covariant ThemeExtension<ThemeTextStyles>? other, double t) {
    if (other is! ThemeTextStyles) {
      return this;
    }

    return ThemeTextStyles(
      authTitle: TextStyle.lerp(authTitle, other.authTitle, t)!,
      textInput: TextStyle.lerp(textInput, other.textInput, t)!,
      hintTextInput: TextStyle.lerp(hintTextInput, other.hintTextInput, t)!,
      textMainButton: TextStyle.lerp(textMainButton, other.textMainButton, t)!,
      labelText1: TextStyle.lerp(labelText1, other.labelText1, t)!,
      linkText: TextStyle.lerp(linkText, other.linkText, t)!,
      additionalLoginText: TextStyle.lerp(additionalLoginText, other.additionalLoginText, t)!,
      labelText2: TextStyle.lerp(labelText2, other.labelText2, t)!,
      appBarTitle1: TextStyle.lerp(appBarTitle1, other.appBarTitle1, t)!,
      appBarTitle2: TextStyle.lerp(appBarTitle2, other.appBarTitle2, t)!,
      itemMenuText: TextStyle.lerp(itemMenuText, other.itemMenuText, t)!,
      typeProductText: TextStyle.lerp(typeProductText, other.typeProductText, t)!,
      categoryProductText: TextStyle.lerp(categoryProductText, other.categoryProductText, t)!,
      nameProductText: TextStyle.lerp(nameProductText, other.nameProductText, t)!,
      priceProductText: TextStyle.lerp(priceProductText, other.priceProductText, t)!,
    );
  }

  static get light => ThemeTextStyles(
    authTitle: displayLarge.copyWith(
      color: AppColors.black,
      fontWeight: FontWeight.w700,
    ),
    textInput: displaySmall.copyWith(
      color: AppColors.black,
    ),
    hintTextInput: displaySmall.copyWith(
      fontSize: 12,
    ),
    textMainButton: displayMedium,
    linkText: displaySmall.copyWith(
      fontSize: 12,
      color: AppColors.violet,
    ),
    additionalLoginText: displaySmall.copyWith(
      fontSize: 12,
      color: AppColors.black,
    ),
    labelText1: displaySmall.copyWith(
      fontSize: 10,
      color: AppColors.grey,
    ),
    labelText2: displaySmall.copyWith(
      fontSize: 10,
      color: AppColors.black,
    ),
    appBarTitle1: displayLarge.copyWith(
      fontSize: 20,
      color: AppColors.black,
    ),
    appBarTitle2: displayLarge.copyWith(
      fontSize: 20,
      color: AppColors.violet,
    ),
    itemMenuText: displayMedium.copyWith(
      color: AppColors.black,
    ),
    typeProductText: displayMedium,
    categoryProductText: displaySmall.copyWith(
      fontSize: 11,
      color: AppColors.black,
    ),
    nameProductText: displayMedium.copyWith(
      color: AppColors.white,
    ),
    priceProductText: displaySmall.copyWith(
      color: AppColors.white,
      fontSize: 12,
    ),
  );
}
