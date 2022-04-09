import 'package:app/features/login/authorization_manager.dart';
import 'package:app/helpers/consts.dart';
import 'package:app/features/login/auths_screen.dart';
import 'package:app/main_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
<<<<<<< HEAD
=======
import 'package:google_fonts/google_fonts.dart';
>>>>>>> 27fe72958701c08a555ae80cb3cccbcc0ec5d6c2

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: C.appTitle,
      theme: ThemeData(
<<<<<<< HEAD
=======
        textTheme: GoogleFonts.openSansTextTheme(),
>>>>>>> 27fe72958701c08a555ae80cb3cccbcc0ec5d6c2
        primarySwatch: MaterialColor(
          C.primary.value,
          {
            50: C.primary,
            100: C.primary,
            200: C.primary,
            300: C.primary,
            400: C.primary,
            500: C.primary,
            600: C.primary,
            700: C.primary,
            800: C.primary,
            900: C.primary,
          },
        ),
      ),
      home: BlocProvider(
        create: (_) => AuthorizationManager()..tryAutologin(),
        child: const MainView(),
      ),
    );
  }
}
