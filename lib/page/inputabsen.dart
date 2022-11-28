import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:moyan/page/datakeluarga.dart';
import 'package:moyan/page/selesaiabsen.dart';
import 'package:moyan/page/validasiabsen.dart';
import 'package:moyan/tema.dart';

class Inputabsen extends StatefulWidget {
  final String empid;
  final String ipadress;
  const Inputabsen({super.key, required this.empid, required this.ipadress});

  @override
  State<Inputabsen> createState() => _InputabsenState();
}

class _InputabsenState extends State<Inputabsen> {
  var _formKey = GlobalKey<FormState>();
  var _formKey1 = GlobalKey<FormState>();
  var _formKey2 = GlobalKey<FormState>();

  List<DropdownMenuItem<String>> get dropdownItems1 {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("Kantor Asal"), value: "1"),
      DropdownMenuItem(child: Text("kantor Satelit"), value: "2"),
      DropdownMenuItem(child: Text("WFH"), value: "3"),
      DropdownMenuItem(child: Text("Cuti/libur"), value: "4"),
    ];
    return menuItems;
  }

  List<DropdownMenuItem<String>> get dropdownItems2 {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("Sehat"), value: "1"),
      DropdownMenuItem(child: Text("Kurang sehat"), value: "2"),
      DropdownMenuItem(child: Text("Sedang Sakit"), value: "3"),
    ];
    return menuItems;
  }

  List<DropdownMenuItem<String>> get dropdownItems3 {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("Belum Pernah Vaksin"), value: "5"),
      DropdownMenuItem(child: Text("Negatif"), value: "4"),
      DropdownMenuItem(child: Text("ODP"), value: "3"),
      DropdownMenuItem(child: Text("PDP"), value: "2"),
      DropdownMenuItem(child: Text("Positif Covid"), value: "1"),
    ];
    return menuItems;
  }

  String? _selected1;
  String? _selected2;
  String? _selected3;
  TextEditingController rencana = TextEditingController();
  TextEditingController lokasi = TextEditingController();
  TextEditingController penyakit = TextEditingController();

  get() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Datakeluarga(
          empid: widget.empid,
          ipadress: widget.ipadress,
          alamat: lokasi.text,
          keadaan: penyakit.text,
          lokasi: _selected1.toString(),
          renacana: rencana.text,
          statuscovid: _selected3.toString(),
          statuskesehatan: _selected2.toString(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
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
      );
    }

    Widget tempatkerja() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Pilih Lokasi Kerja",
                style: TextStyle(
                  color: Color.fromARGB(255, 4, 4, 4),
                  fontFamily: 'Bold',
                  fontSize: 20,
                ),
              ),
              DropdownButtonFormField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                    borderSide: BorderSide(color: Colors.black, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                    borderSide: BorderSide(
                        color: Color.fromARGB(255, 13, 233, 50), width: 1),
                  ),
                ),
                hint: Text('Pilih data'),
                items: dropdownItems1,
                value: _selected1,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Data Harus di Pilih';
                  }
                  return null;
                },
                onChanged: (String? newValue) {
                  print(newValue);

                  setState(() {
                    _selected1 = newValue!;
                  });
                },
              ),
              SizedBox(
                height: 20,
              ),
              if (_selected1 == '1' ||
                  _selected1 == '2' ||
                  _selected1 == '3') ...[
                SingleChildScrollView(
                  child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Data Tidak Boleh Kosong';
                        }
                        return null;
                      },
                      controller: lokasi,
                      decoration: InputDecoration(
                        labelText: 'Alamat Bekerja',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 166, 166, 165),
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      )),
                ),
                SizedBox(
                  height: 20,
                ),
                SingleChildScrollView(
                  child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Data Tidak Boleh Kosong';
                        }
                        return null;
                      },
                      controller: rencana,
                      decoration: InputDecoration(
                        labelText: 'Rencana hari ini',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 166, 166, 165),
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      )),
                ),
              ] else if (_selected1 == '4') ...[
                SingleChildScrollView(
                  child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Data Tidak Boleh Kosong';
                        }
                        return null;
                      },
                      controller: lokasi,
                      decoration: InputDecoration(
                        labelText: 'Rencana Tempat Cuti/libur',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 166, 166, 165),
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      )),
                ),
              ],
            ],
          ),
        ),
      );
    }

    Widget statuskesehatan() {
      return Container(
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Form(
          key: _formKey1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Pilih Status Kesehatan",
                style: TextStyle(
                  color: Color.fromARGB(255, 4, 4, 4),
                  fontFamily: 'Bold',
                  fontSize: 20,
                ),
              ),
              DropdownButtonFormField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                    borderSide: BorderSide(color: Colors.black, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                    borderSide: BorderSide(
                        color: Color.fromARGB(255, 13, 233, 50), width: 1),
                  ),
                ),
                hint: Text('Pilih data'),
                items: dropdownItems2,
                value: _selected2,
                validator: (value) =>
                    value == null ? 'data Tidak Boleh Kosong' : null,
                onChanged: (String? newValue) {
                  print(newValue);

                  setState(() {
                    _selected2 = newValue!;
                  });
                },
              ),
              SizedBox(
                height: 20,
              ),
              if (_selected2 == '2' || _selected2 == '3') ...[
                SingleChildScrollView(
                  child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Data Tidak Boleh Kosong';
                        }
                        return null;
                      },
                      controller: penyakit,
                      decoration: InputDecoration(
                        labelText: 'Keadaan saat ini',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 166, 166, 165),
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      )),
                ),
              ] else
                ...[],
            ],
          ),
        ),
      );
    }

    Widget statuscovid() {
      return Container(
        margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Form(
          key: _formKey2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Pilih Status Covid",
                style: TextStyle(
                  color: Color.fromARGB(255, 4, 4, 4),
                  fontFamily: 'Bold',
                  fontSize: 20,
                ),
              ),
              DropdownButtonFormField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                    borderSide: BorderSide(color: Colors.black, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                    borderSide: BorderSide(
                        color: Color.fromARGB(255, 13, 233, 50), width: 1),
                  ),
                ),
                hint: Text('Pilih data'),
                items: dropdownItems3,
                value: _selected3,
                validator: (value) =>
                    value == null ? 'data Tidak Boleh Kosong' : null,
                onChanged: (String? newValue) {
                  print(newValue);

                  setState(() {
                    _selected3 = newValue!;
                  });
                },
              ),
            ],
          ),
        ),
      );
    }

    Widget Tombolnext() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        padding: EdgeInsets.symmetric(horizontal: 30),
        height: 50,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: primarycolor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Center(
              child: const Text(
                "Lanjut",
                style: TextStyle(
                  color: Color.fromARGB(255, 254, 254, 254),
                  fontFamily: 'Bold',
                  fontSize: 20,
                ),
              ),
            ),
            onPressed: () {
              if (_formKey.currentState!.validate() &&
                  _formKey1.currentState!.validate() &&
                  _formKey2.currentState!.validate()) {
                get();
                return;
              }
            }),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Moyan'),
        backgroundColor: Color.fromARGB(255, 253, 7, 7),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            header(),
            tempatkerja(),
            statuskesehatan(),
            statuscovid(),
            Tombolnext(),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
