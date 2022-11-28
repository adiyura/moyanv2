import 'package:flutter/material.dart';
import 'package:moyan/page/Homepage.dart';
import 'package:moyan/page/Splahscreen.dart';
import 'package:moyan/page/datakeluarga.dart';
import 'package:moyan/page/inputabsen.dart';
import 'package:moyan/page/mitra.dart';
import 'package:moyan/page/organik.dart';
import 'package:moyan/page/pilihdata.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => SplahScreen(),
        '/Homepage': (context) => Homepage(),
        '/pilihdata': (context) => Pilihdata(),
        '/mitra': (context) => Mitra(),
        '/organik': (context) => Organik(),
      },
    );
  }
}
