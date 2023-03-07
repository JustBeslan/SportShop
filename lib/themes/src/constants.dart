
part of "../theme.dart";

const displayLarge = TextStyle(fontWeight:  FontWeight.w400, fontFamily: "Montserrat-Bold", fontSize: 26);
const displayMedium = TextStyle(fontWeight:  FontWeight.w400, fontFamily: "Montserrat-Bold", fontSize: 18);
const displaySmall = TextStyle(fontWeight:  FontWeight.w400, fontFamily: "Montserrat-Bold", fontSize: 15);

abstract class AppColors {
  static const white = Colors.white;
  static const black = Colors.black;
  static const grey = Colors.grey;
  static const lightGrey = Color.fromARGB(255, 232, 232, 232);
  static const lightGrey08 = Color.fromRGBO(232, 232, 232, 0.8);

  static const violet = Color.fromARGB(255, 78, 85, 215);

  static const blackTransparent = Color(0x42000000);
}
