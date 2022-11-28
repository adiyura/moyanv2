import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 150,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(206, 186, 186, 186),
            blurRadius: 8,
          ),
        ],
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
        color: Color.fromARGB(255, 255, 254, 253),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, "/pilihdata");
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 41,
                      height: 41,
                      child: Image.asset(
                        "assets/images/pencil.png",
                        height: 40,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "  Presensi",
                      style: TextStyle(
                        color: Color.fromARGB(255, 20, 2, 2),
                        fontFamily: 'Bebas Neue',
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, "/login");
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      child: Image.asset(
                        "assets/images/dashboard.png",
                        height: 40,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Data Moyan",
                      style: TextStyle(
                        color: Color.fromARGB(255, 20, 2, 2),
                        fontFamily: 'Bebas Neue',
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, "/perbaikan");
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      child: Image.asset(
                        "assets/images/vaccine.png",
                        height: 40,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Update Vaksin",
                      style: TextStyle(
                        color: Color.fromARGB(255, 20, 2, 2),
                        fontFamily: 'Bebas Neue',
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
