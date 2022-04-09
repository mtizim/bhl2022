import 'package:app/helpers/consts.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 189,
      width: 320,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              C.appNameF,
              style: GoogleFonts.monoton().copyWith(
                fontSize: 80,
                fontWeight: FontWeight.w500,
                color: C.tertiary,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 2),
              child: Text(
                "L",
                style: GoogleFonts.monoton().copyWith(
                  fontSize: 80,
                  fontWeight: FontWeight.w500,
                  color: C.tertiary,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 58.75),
              child: Text(
                "U",
                style: GoogleFonts.monoton().copyWith(
                  fontSize: 80,
                  fontWeight: FontWeight.w500,
                  color: C.tertiary,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 133.25),
              child: Text(
                "F",
                style: GoogleFonts.monoton().copyWith(
                  fontSize: 80,
                  fontWeight: FontWeight.w500,
                  color: C.tertiary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AppLogoSidebar extends StatelessWidget {
  const AppLogoSidebar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      width: 220,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              C.appNameF,
              style: GoogleFonts.monoton().copyWith(
                fontSize: 55,
                fontWeight: FontWeight.w500,
                color: C.tertiary,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 1.5),
              child: Text(
                "L",
                style: GoogleFonts.monoton().copyWith(
                  fontSize: 55,
                  fontWeight: FontWeight.w500,
                  color: C.tertiary,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 40.5),
              child: Text(
                "U",
                style: GoogleFonts.monoton().copyWith(
                  fontSize: 55,
                  fontWeight: FontWeight.w500,
                  color: C.tertiary,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 91.5),
              child: Text(
                "F",
                style: GoogleFonts.monoton().copyWith(
                  fontSize: 55,
                  fontWeight: FontWeight.w500,
                  color: C.tertiary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
