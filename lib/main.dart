import 'package:effective_mobile_flutter_task/pages/page1/profile.dart';
import 'package:flutter/material.dart';

import 'pages/login.dart';
import 'pages/page1/page1.dart';
import 'pages/signin.dart';
import 'themes/theme.dart';

void main() => runApp(MaterialApp(
  theme: createLightTheme(),
  initialRoute: '/page1',
  routes: {
    '/sign_in': (context) => const SignInPage(),
    '/log_in': (context) => const LogInPage(),
    '/page1': (context) => const Page1(),
    '/profile': (context) => const Profile(),
  },
));

// ThemeData _buildTheme() {
//   const primaryColor = Color.fromARGB(255, 250, 249, 255);
//   const backgroundColor = Color.fromARGB(255, 250, 249, 255);
//   final baseTheme = ThemeData(fontFamily: "Montserrat-Bold");
//   return baseTheme.copyWith(
//     primaryColor: primaryColor);
// }
