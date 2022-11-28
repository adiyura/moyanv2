import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Repository {
  Future postData(
      String ipaddress,
      String empid,
      String rencanakerja,
      String locaddr,
      String conid,
      String locid,
      String covid,
      String ksehat,
      String kkfit,
      String ksakit,
      String ksakitdesc) async {
    final Uri baseUrl = Uri.parse(
        'http://cobasite.my.id/restapimoyan/apikaryawan/Karyawan_inputdata/index_post/');

    try {
      final hasilrespon = await http.post(baseUrl, body: {
        "empid": empid,
        "ipaddress": ipaddress,
        "rencanakerja": rencanakerja,
        "locaddr": locaddr,
        "conid": conid,
        "locid": locid,
        "covid": covid,
        "ksehat": ksehat,
        "kkfit": kkfit,
        "ksakit": ksakit,
        "ksakitdesc": ksakitdesc,
      });

      if (hasilrespon.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future updateData(String empid) async {
    final Uri baseUrl = Uri.parse(
        'http://cobasite.my.id/restapimoyan/apikaryawan/Karyawan_update/index_put?empid=$empid');

    try {
      final hasilrespon = await http.put(baseUrl, body: {"empid": empid});

      if (hasilrespon.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
