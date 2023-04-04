import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';
// import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:tuple/tuple.dart';
// import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_database/firebase_database.dart';
// import 'package:paymigo/aes.dart';
// import 'package:flutter_js/flutter_js.dart';
import 'package:flutter_nfc_reader/flutter_nfc_reader.dart';

int priv_key = 9999;
int pub_key = gen_key(priv_key);

String currentUnm="default unm";
String currentName="default name";
String currentPass="default pass";

String uName="default user";
String uPhone="default phone";
String uBal="default balance";
String uKey="default card key";

// Color mrkColDrk = Color(0xff7466c1);
// Color mrkColDrkT = Color(0xff7466c1);
// Color mrkColLit = Color(0xffebebf4);
// Color mrkColWht = Color(0xffffffff);
// Color mrkColWhtT = Color(0xffffffff);

Color mrkColDrk = Color(0xff42032C);
Color mrkColDrkT = Color(0xff42032C);
Color mrkColLit = Color(0xffE6D2AA);
Color mrkColWht = Color(0xffE6D2AA);
Color mrkColWhtT = Color(0xffD36B00);


//generating a public key
int gen_key(a) {
  int n = 23456; //prime = fixed for the app
  int g = 10; //generator = fixed for the app
  int x = (g^a)%n;
  return x;
}

//generating a secret key
int secret_key(x,a) {
  int n = 23456; //prime = fixed for the app
  int k = (x^a)%n;
  return k;
}


// final JavascriptRuntime jsRuntime = getJavascriptRuntime();
//
// Future<String> encryptAESCryptoJS(JavascriptRuntime jsr, String plainText, String password) async {
//   String aesJs = await rootBundle.loadString("assets/aes.js");
//   int len = plainText.length*8;
//   final jsRes = jsr.evaluate(aesJs+"""AesCtr.encrypt($plainText, $password, $len);""");
//   String jsResStr = jsRes.stringResult;
//   return jsResStr;
// }
//
// Future<String> decryptAESCryptoJS(JavascriptRuntime jsr, String ciphertext, String password) async {
//
//   String aesJs = await rootBundle.loadString("assets/aes.js");
//   int len = ciphertext.length*8;
//   final jsRes = jsr.evaluate(aesJs+"""AesCtr.decrypt($ciphertext, $password, $len);""");
//   String jsResStr = jsRes.stringResult;
//   return jsResStr;
// }


// local save

Future<void> loadSaved(BuildContext context) async {
  final mrkSaved = await SharedPreferences.getInstance();
  priv_key = await int.parse((mrkSaved.getString('priv')??priv_key).toString());
  pub_key = gen_key(priv_key);
  print("loaded saved");
}

Future<void> updateSaved() async {
  final mrkSaved = await SharedPreferences.getInstance();
  await mrkSaved.setString('priv',priv_key.toString());
  print("updated saved");
}

Future<void> clearSavedLocal() async {
  priv_key = 9999;
  pub_key = gen_key(priv_key);
  print("cleared locally saved");
}


// database

class dbclass {

  static bool readData(String phn) {
// database reference string
    final DBRef = FirebaseDatabase.instance.reference();
    bool fl = false;
    print("Phone: " + phn);
    DBRef.child("regn").once().then((DataSnapshot dataSnapShot) {
      var newdata = dataSnapShot.value;
// var key = newdata.keys.elementAt("1234");
      newdata.forEach((key, values) {
        print(values['phone']);
        if ((values['phone']) == phn) {
          fl = true;
        }
      });
      return fl;
    });
    return fl;
  }

  // static void writeRegData(String name, String priv, String phone, String password) { //todo
  static Future<void> writeRegData(String username, String name, String priv, String password) async {
// database reference string
    final DBRef = await FirebaseDatabase.instance.reference();
    await DBRef.child("str").child(username).set({
      'unm' : username,
      'stnm': name,
      'priv': priv,
      'pass': password,
      'cnt' : 0,
    });
    await DBRef.child("str").child(username).child("cards")..push().set({
      'cdnm': 'dummy card',
      'name': 'default user',
      'phone': '9999999999',
      'bal': 0,
    });
    print("store added");
  }

  static Future<int> newCard(String username, String name, String phone, int bal) async {
// database reference string
    final DBRef = await FirebaseDatabase.instance.reference();
    int count = 69;
    String cdnm = "def card name";

    await DBRef.child("str").child(username).once().then((DataSnapshot dataSnapShot){
      var newdata = dataSnapShot.value;
      count = newdata["cnt"];
      });

    cdnm = "Paymigo|"+username+"#"+(count+1).toString();

    await DBRef.child("str").child(username).child("cards").push().set({
      'cdnm': cdnm,
      'name': name,
      'phone': phone,
      'bal': bal,
    });

    DBRef.child("str").child(username).update({
      'cnt': count+1,
    });

    print("card "+cdnm+" added");

    return count+1;
  }

  static Future<String> getCardDet(String cdnm) async {
// database reference string
    final DBRef = FirebaseDatabase.instance.reference();
    // bool fl = false;
    // print("Phone: " + phn);
    print("Fetching card details for "+cdnm);
    await DBRef.child("str").child(currentUnm).child("cards").once().then((DataSnapshot dataSnapShot) {
      var newdata = dataSnapShot.value;
// var key = newdata.keys.elementAt("1234");
      newdata.forEach((key, values) {
        print("Checking "+values['cdnm']);
        if ((values['cdnm']) == cdnm) {
          uKey = key;
          uName = values['name'];
          uPhone = values['phone'];
          uBal = values['bal'].toString();
          // fl = true;
          return(uName+"|"+uPhone+"|"+uBal+"|");
        }
      });
      // return fl;
    });
    // return fl;
    return(uName+"|"+uPhone+"|"+uBal+"|");
  }

  static Future<void> procTr(int debit) async {
    uBal = (int.parse(uBal) - debit).toString();
    final DBRef = FirebaseDatabase.instance.reference();
    DBRef.child("str").child(currentUnm).child("cards").child(uKey).update({
      'bal': int.parse(uBal),
    });
    print("data updated");
  }

  static Future<void> procRfl(int credit) async {
    uBal = (int.parse(uBal) + credit).toString();
    final DBRef = FirebaseDatabase.instance.reference();
    DBRef.child("str").child(currentUnm).child("cards").child(uKey).update({
      'bal': int.parse(uBal),
    });
    print("data updated");
  }

  static void updateRegData(String name, String priv, String phone, String password) {
    final DBRef = FirebaseDatabase.instance.reference();
    DBRef.child("regn").child(phone).update({
      'name': name,
      'priv': priv,
      'pass': password
    });
    print("data updated");
  }

  static void deleteAccData(String phone){
    final DBRef = FirebaseDatabase.instance.reference();
    DBRef.child("regn").child(phone).remove();
    print("data deleted");
  }
}

Future<void> clearCardData() async {
  uName="default user";
  uPhone="default phone";
  uBal="default balance";
  uKey="default card key";
}

//nfc

Future<String> nfc_read() async{
  String str = "def text";
  await FlutterNfcReader.read().then((response) {
    str = response.content;
    print("Response content =\n"+str.substring(3, str.length));
  });
  return(str.substring(3, str.length));
}

Future<void> nfc_write(String s1, String s2) async {
  await FlutterNfcReader.write(s1,"#"+s2).then((response) {
    print(response.content);
  });
}