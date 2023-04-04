import 'package:paymigo/allGlobal.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:typed_data';
import 'package:flutter_nfc_reader/flutter_nfc_reader.dart';

class TestP extends StatefulWidget {
  @override
  _TestPState createState() => _TestPState();
}

class _TestPState extends State<TestP> {

  String maintxt = "Paymigo";
  TextEditingController wr = TextEditingController();
  TextEditingController rd = TextEditingController();

  Future<void> read1() async{
    FlutterNfcReader.read().then((response) {
      String str = response.content;
      print("Response content =\n"+str.substring(3, str.length));
      rd.text = str.substring(3, str.length);
    });
    setState(() {
      //
    });
  }

  Future<void> read2() async{
    FlutterNfcReader.onTagDiscovered().listen((onData) {
      print("ID = "+onData.id);
      print("Content = "+onData.content);
    });
  }

  Future<void> write1(String s1, String s2) async {
    FlutterNfcReader.write(s1,"#"+s2).then((response) {
      print(response.content);
    });
  }

  Future<void> write2(String s1, String s2) async {
    FlutterNfcReader.read().then((readResponse) {
      FlutterNfcReader.write("Paymigo user card",s2).then((writeResponse) {
        print('writed: ${readResponse.content}');
        print('writed: ${writeResponse.content}');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              mrkColLit,
              mrkColLit,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 120,),
              Column(
                children: [
                  Text(
                    maintxt,
                    // style: GoogleFonts.pressStart2p(
                    //   fontSize: 36,
                    //   // fontFamily: 'Samarkan',
                    //   color: mrkColDrk,
                    // ),
                    style: TextStyle(
                      fontFamily: 'Samarkan',
                      color: mrkColDrk,
                      fontSize: 64,
                    ),
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.start,
                  //   children: [
                  //     Text(
                  //       "Crypto",
                  //       style: GoogleFonts.pressStart2p(
                  //         fontSize: 36,
                  //         // fontFamily: 'Samarkan',
                  //         color: mrkColDrk,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.end,
                  //   children: [
                  //     Text(
                  //       "Share",
                  //       style: GoogleFonts.pressStart2p(
                  //         fontSize: 36,
                  //         // fontFamily: 'Samarkan',
                  //         color: mrkColDrk,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
              SizedBox(height: 60,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20,),
                  TextField(
                    controller: rd,
                    // maxLength: 10,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      fillColor: mrkColWhtT,
                      filled: true,
                      hintText: 'Detected text',
                      hintStyle: TextStyle(
                        fontSize: 24,
                        fontFamily: 'Signika',
                        color: Color(0x988000000),
                      ),
                    ),
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.go,
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'Signika',
                      color: mrkColDrk,
                    ),
                    cursorColor: mrkColDrk,
                  ),
                  SizedBox(height: 20,),
                  SizedBox(height: 5,),
                  TextField(
                    controller: wr,
                    // maxLength: 20,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      fillColor: mrkColWhtT,
                      filled: true,
                      hintText: 'Writer text',
                      hintStyle: TextStyle(
                        fontSize: 24,
                        fontFamily: 'Signika',
                        color: Color(0x988000000),
                      ),
                    ),
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.go,
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'Signika',
                      color: mrkColDrk,
                    ),
                    obscureText: true,
                    cursorColor: mrkColDrk,
                  ),
                  SizedBox(height: 20,),
                  // SizedBox(height: 8,),
                  SizedBox(height: 48,),
                  RaisedButton(
                    onPressed: () async {

                      print("attempting write...");

                      await write1("Paymigo|"+currentUnm, wr.text);

                      maintxt = wr.text;
                      setState(() {});
                    },
                    child: Text(
                      "Write",
                      style: TextStyle(
                        fontSize: 28,
                        fontFamily: 'Signika',
                        color: mrkColWht,
                      ),
                    ),
                    elevation: 24,
                    padding: EdgeInsets.fromLTRB(32, 12, 32, 12),
                    color: mrkColDrk,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ],
              ),
              // SizedBox(height: 0,),
              SizedBox(height: 60,),
              FlatButton(
                  onPressed: () async {
                    await read1();
                    },
                  child: Text(
                      "Read",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Signika',
                        color: mrkColDrk,
                      )
                  )
              ),
            ],
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     // dbclass.writeRegData('firststore', 'First Store', '1231', "pass");
      //   },
      // ),
    );
  }
}
