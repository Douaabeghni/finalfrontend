import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_ap/screen/home_screen.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
            backgroundColor: Colors.blue[200]),
        scaffoldBackgroundColor: Colors.white,
        primaryColor: Colors.green ,
        hintColor : Colors.yellow,
        iconTheme: IconThemeData(color: Colors.black),
        fontFamily: GoogleFonts.montserrat().fontFamily ,
        textTheme: GoogleFonts.montserratTextTheme(),
      ),
      home: HomeScreen(

      ),
    );
  }
}

