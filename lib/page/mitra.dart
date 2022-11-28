import 'dart:convert';
import 'package:dart_ipify/dart_ipify.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'package:moyan/main.dart';
import 'package:moyan/page/inputabsen.dart';
import 'package:moyan/page/validasiabsen.dart';
import 'package:moyan/page/validasimitra.dart';

class Mitra extends StatefulWidget {
  const Mitra({super.key});

  @override
  State<Mitra> createState() => _MitraState();
}

class _MitraState extends State<Mitra> {
  String? nama = '';
  int? id;
  bool visible = false;
  var ipv4;

  getData(int emp) async {
    Uri url = Uri.parse(
        'https://cobasite.my.id/restapimoyan/apikaryawan/Karyawan_cekdataabsen?empid=$emp');

    final reponse = await http.get(url);
    if (reponse.statusCode == 200) {
      var it = jsonDecode(reponse.body)['data'];
      ipv4 = await Ipify.ipv4();
      if (it['valid'] == '1') {
        // ignore: use_build_context_synchronously
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Validasimitra(
              empid: it['empid'],
              ipadress: ipv4,
            ),
          ),
        );
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Inputabsen(
              empid: '$emp',
              ipadress: ipv4,
            ),
          ),
        );
      }
      return (it);
    }
  }

  _showAlertDialog(BuildContext context, String err) {
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () => Navigator.pop(context),
    );
    AlertDialog alert = AlertDialog(
      title: Text("Opss..."),
      content: Text(err),
      actions: [
        okButton,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  void initState() {
    getData;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
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
              height: 60,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Halaman Mitra",
                    style: TextStyle(
                      color: Color.fromARGB(255, 4, 4, 4),
                      fontSize: 30,
                      fontFamily: 'Bold',
                    ),
                  ),
                  Text(
                    "Silahkan Pilih data sesuai data diri anda",
                    style: TextStyle(
                      fontFamily: 'Reguler',
                      color: Color.fromARGB(255, 4, 4, 4),
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  DropdownSearch<dynamic>(
                    mode: Mode.BOTTOM_SHEET,
                    showSearchBox: true,
                    onChanged: (value) {
                      setState(() {
                        id = value['eid'];
                      });
                    },
                    itemAsString: (item) => item['nama'] + " - " + item["unit"],
                    onFind: (text) async {
                      Uri url = Uri.parse(
                          'https://cobasite.my.id/restapimoyan/apikaryawan/Karyawan_readmitra');
                      var response = await http.get(url);
                      if (response.statusCode != 200) {
                        return [];
                      }

                      List allAbsen = jsonDecode(response.body);
                      print(allAbsen);
                      List namakaryawan = [];
                      setState(() {
                        namakaryawan = allAbsen;
                      });
                      return namakaryawan as List<dynamic>;
                    },
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 55, 52, 51),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Center(
                        child: const Text(
                          "Cari",
                          style: TextStyle(
                            color: Color.fromARGB(255, 254, 254, 254),
                            fontFamily: 'Bold',
                            fontSize: 20,
                          ),
                        ),
                      ),
                      onPressed: () {
                        if (id == null) {
                          setState(() {
                            visible = false;
                          });

                          _showAlertDialog(
                              context, 'Anda belum memilih data diri');
                        } else {
                          getData(id!);
                        }
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
