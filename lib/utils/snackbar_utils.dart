import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SnackbarUtils {
  static void showSnackbar(BuildContext context, String message) {
    final snackBar = SnackBar(
      backgroundColor: Colors.grey.shade800,
      content: Text(
        message,
        style: GoogleFonts.nunito(
          textStyle: const TextStyle(
            color: Colors.white,
            letterSpacing: .3,
          ),
          fontSize: 14,
        ),
      ),
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(16.0), // Set margin as needed
      behavior: SnackBarBehavior.floating, // Set behavior as needed
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
