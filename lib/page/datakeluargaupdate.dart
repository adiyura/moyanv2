import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:moyan/models/repository.dart';
import 'package:moyan/page/selesaiabsen.dart';
import 'package:moyan/page/updateabsen.dart';
import 'package:moyan/page/validasiabsen.dart';
import 'package:moyan/tema.dart';

class Datakeluargaupdate extends StatefulWidget {
  final String empid;
  final String ipadress;
  final String lokasi;
  final String alamat;
  final String renacana;
  final String statuskesehatan;
  final String keadaan;
  final String statuscovid;
  const Datakeluargaupdate({
    super.key,
    required this.empid,
    required this.ipadress,
    required this.lokasi,
    required this.alamat,
    required this.renacana,
    required this.statuskesehatan,
    required this.keadaan,
    required this.statuscovid,
  });
  @override
  State<Datakeluargaupdate> createState() => _DatakeluargaupdateState();
}

class _DatakeluargaupdateState extends State<Datakeluargaupdate> {
  Repository request = Repository();
  var _formKeykel = GlobalKey<FormState>();
  var _formKeykel1 = GlobalKey<FormState>();
  var _formKeykel2 = GlobalKey<FormState>();

  TextEditingController input1 = TextEditingController();
  TextEditingController input2 = TextEditingController();
  TextEditingController input3 = TextEditingController();

  _kirim() async {
    bool resspon = await request.updateData(widget.empid);
    bool respon = await request.postData(
        widget.ipadress,
        widget.empid,
        widget.renacana,
        widget.lokasi,
        widget.lokasi,
        widget.statuskesehatan,
        widget.statuscovid,
        input1.text,
        input2.text,
        input3.text,
        widget.keadaan);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => selesaiabsen()),
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

    Widget Jumlahsehat() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Form(
          key: _formKeykel,
          child: SingleChildScrollView(
            child: TextFormField(
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Data Tidak Boleh Kosong';
                  }
                  return null;
                },
                controller: input1,
                decoration: InputDecoration(
                  labelText: 'JUMLAH SEHAT (ORANG) ',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 166, 166, 165),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                )),
          ),
        ),
      );
    }

    Widget Jumlahkurangfit() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Form(
          key: _formKeykel1,
          child: SingleChildScrollView(
            child: TextFormField(
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Data Tidak Boleh Kosong';
                  }
                  return null;
                },
                controller: input2,
                decoration: InputDecoration(
                  labelText: 'JUMLAH KURANG FIT (ORANG)',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 166, 166, 165),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                )),
          ),
        ),
      );
    }

    Widget Jumlahdsakit() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Form(
          key: _formKeykel2,
          child: SingleChildScrollView(
            child: TextFormField(
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Data Tidak Boleh Kosong';
                  }
                  return null;
                },
                controller: input3,
                decoration: InputDecoration(
                  labelText: 'JUMLAH SAKIT (ORANG) ',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 166, 166, 165),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                )),
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
                "Simpan",
                style: TextStyle(
                  color: Color.fromARGB(255, 254, 254, 254),
                  fontFamily: 'Bold',
                  fontSize: 20,
                ),
              ),
            ),
            onPressed: () {
              if (_formKeykel.currentState!.validate() ||
                  _formKeykel1.currentState!.validate() ||
                  _formKeykel2.currentState!.validate()) {
                _kirim();
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
            Jumlahsehat(),
            Jumlahkurangfit(),
            Jumlahdsakit(),
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
