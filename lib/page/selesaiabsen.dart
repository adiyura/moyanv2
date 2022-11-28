import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class selesaiabsen extends StatefulWidget {
  @override
  State<selesaiabsen> createState() => _selesaiabsenState();
}

class _selesaiabsenState extends State<selesaiabsen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 80),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 300,
              ),
              Container(
                width: 60,
                height: 60,
                child: Image.asset(
                  "assets/images/check.png",
                  height: 40,
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                "Sukses",
                style: TextStyle(
                  color: Color.fromARGB(255, 20, 2, 2),
                  fontFamily: 'Bebas Neue',
                  fontSize: 40,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Hai Rekan, terimakasih sudah mengisi moyan",
                style: TextStyle(
                  color: Color.fromARGB(255, 20, 2, 2),
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 199, 5, 5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Center(
                    child: const Text(
                      "Kembali",
                      style: TextStyle(
                        color: Color.fromARGB(255, 254, 254, 254),
                        fontFamily: 'Bold',
                        fontSize: 20,
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, "/Homepage");
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
