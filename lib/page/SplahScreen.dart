import 'dart:async';

import 'package:flutter/material.dart';
import '../tema.dart';

class SplahScreen extends StatefulWidget {
  const SplahScreen({super.key});

  @override
  State<SplahScreen> createState() => _SplahScreenState();
}

class _SplahScreenState extends State<SplahScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Timer(
      Duration(seconds: 3),
      () => Navigator.pushNamed(context, '/Homepage'),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whitecolor,
      body: Column(
        children: [
          SizedBox(
            height: 250,
          ),
          Center(
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/G_awal.png'),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 200,
          ),
          Text(
            'Aplikasi By General Support',
            style: TextStyle(
              fontFamily: 'Bold',
              fontSize: 20,
            ),
          )
        ],
      ),
    );
  }
}
