// ignore_for_file: prefer_const_constructors

import 'dart:ui';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class Pilihdata extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 300,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/background.png'),
                            fit: BoxFit.fill),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Pilih Data Anda",
                    style: TextStyle(
                      fontFamily: 'Bold',
                      color: Color.fromARGB(255, 4, 4, 4),
                      fontSize: 30,
                    ),
                  ),
                  Text(
                    "Silahkan Pilih data sesuai data diri anda",
                    style: TextStyle(
                      color: Color.fromARGB(255, 4, 4, 4),
                      fontFamily: 'Reguler',
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 50,
                    margin: EdgeInsets.symmetric(horizontal: 0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 237, 6, 6),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Center(
                        child: const Text(
                          "Karyawan",
                          style: TextStyle(
                            color: Color.fromARGB(255, 254, 254, 254),
                            fontFamily: 'Bold',
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, "/organik");
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 50,
                    margin: EdgeInsets.symmetric(horizontal: 0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 55, 52, 51),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Center(
                        child: const Text(
                          "Mitra",
                          style: TextStyle(
                            color: Color.fromARGB(255, 254, 254, 254),
                            fontFamily: 'Bold',
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, "/mitra");
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
