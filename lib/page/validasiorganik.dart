import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:moyan/page/inputabsenupdate.dart';

class Validasiorganik extends StatefulWidget {
  final String empid;
  final String ipadress;
  Validasiorganik({super.key, required this.empid, required this.ipadress});

  @override
  State<Validasiorganik> createState() => _ValidasiorganikState();
}

class _ValidasiorganikState extends State<Validasiorganik> {
  Widget header() {
    return Container(
      height: 200,
      child: Stack(
        children: <Widget>[
          Positioned(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/headinput.png'),
                    fit: BoxFit.fill),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget keterangan() {
    return Container(
      margin: EdgeInsets.only(top: 100),
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            child: Image.asset(
              "assets/images/warning.png",
              height: 40,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            "Peringatan",
            style: TextStyle(
              color: Color.fromARGB(255, 20, 2, 2),
              fontFamily: 'Bold',
              fontSize: 40,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Hai Rekan, sepertinya anda sudah mengisi moyan? jika ingin update data silahkan lanjut",
            style: TextStyle(
              fontFamily: 'Reguler',
              color: Color.fromARGB(255, 20, 2, 2),
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }

  Widget Tombol() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            style: kembalistyle,
            onPressed: () {
              Navigator.pushNamed(context, "/organik");
            },
            child: Text('Kembali'),
          ),
          SizedBox(
            width: 50,
          ),
          ElevatedButton(
            style: lanjutstytle,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Inputabsenupdate(
                    empid: widget.empid,
                    ipadress: widget.ipadress,
                  ),
                ),
              );
            },
            child: Text('lanjut'),
          ),
        ],
      ),
    );
  }

  final ButtonStyle kembalistyle = ElevatedButton.styleFrom(
    onPrimary: Colors.black87,
    primary: Colors.grey[300],
    minimumSize: Size(88, 36),
    padding: EdgeInsets.symmetric(horizontal: 20),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2)),
    ),
  );

  final ButtonStyle lanjutstytle = ElevatedButton.styleFrom(
    onPrimary: Color.fromARGB(221, 255, 252, 252),
    primary: Color.fromARGB(255, 11, 162, 77),
    minimumSize: Size(88, 36),
    padding: EdgeInsets.symmetric(horizontal: 20),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2)),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            header(),
            keterangan(),
            Tombol(),
          ],
        ),
      ),
    );
  }
}
