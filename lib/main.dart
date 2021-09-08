import 'package:flutter/material.dart';
import 'pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      home: HomePage(),
      theme: ThemeData(
        primaryColor: Color(0xFFd7a0cf)
      ),
      debugShowCheckedModeBanner: false,
    )
  );
}