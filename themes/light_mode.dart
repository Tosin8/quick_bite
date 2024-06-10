import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  colorScheme:  ColorScheme.light(
    surface: Colors.grey.shade300, // once being called a background. 
    primary: Colors.grey.shade500, 
    secondary: Colors.grey.shade100, 
    tertiary: Colors.white,  
    //surface: Color.fromARGB(255, 255, 255, 255),
    inversePrimary: Colors.grey.shade700, 
  )
); 