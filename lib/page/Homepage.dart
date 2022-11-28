import 'package:flutter/material.dart';
import 'package:moyan/tema.dart';
import 'package:moyan/widget/Menu.dart';
import 'package:moyan/widget/report.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome To Moyan',
              style: TextStyle(
                fontFamily: 'Bold',
                fontSize: 25,
              ),
            ),
            Text(
              'start your day',
              style: TextStyle(
                fontFamily: 'Reguler',
                fontSize: 15,
              ),
            )
          ],
        ),
      );
    }

    Widget dailyreport() {
      return Container(
        margin: EdgeInsets.only(top: 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Daily News',
              style: TextStyle(
                fontFamily: 'Bold',
                fontSize: 25,
              ),
            ),
          ],
        ),
      );
    }

    Widget Menudalyreport() {
      return Container(
        margin: EdgeInsets.only(top: 14),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Report(),
              Report(),
              Report(),
            ],
          ),
        ),
      );
    }

    Widget Menumoyan() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Menu',
              style: TextStyle(
                fontFamily: 'Bold',
                fontSize: 25,
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: whitecolor,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: defautMargin),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              header(),
              dailyreport(),
              Menudalyreport(),
              Menumoyan(),
              Menu()
            ],
          ),
        ),
      ),
    );
  }
}
