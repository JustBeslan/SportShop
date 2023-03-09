import 'package:flutter/material.dart';

import 'pages/log_in.dart';
import 'pages/page1/page1.dart';
import 'pages/sign_in.dart';
import 'themes/theme.dart';

void main() => runApp(MaterialApp(
  theme: createLightTheme(),
  initialRoute: '/sign_in',
  routes: {
    '/sign_in': (context) => const SignInPage(),
    '/log_in': (context) => const LogInPage(),
    '/page1': (context) => const Page1(),
  },
));
