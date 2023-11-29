import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return  AppBar(
        title: Text('Matissa', style: TextStyle(
          fontSize: 35, 
          fontWeight: FontWeight.bold, 
          color: Colors.white,
          fontFamily: 
              GoogleFonts.merienda().fontFamily
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(60, 195, 189, 1)
      );
  }
}