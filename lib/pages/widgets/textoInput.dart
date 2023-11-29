import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Label extends StatelessWidget {
  final String texto;
  const Label({super.key, required this.texto});

  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: const EdgeInsets.symmetric(vertical: 7),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  texto,
                  style: TextStyle(color: Colors.white, fontFamily: GoogleFonts.quicksand().fontFamily),
                  textAlign: TextAlign.center,
                  
                )
              ],
            ),
          );
  }
}