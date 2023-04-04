import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:paymigo/allGlobal.dart';
import 'package:google_fonts/google_fonts.dart';

class NewCardP extends StatelessWidget {

  TextEditingController nm = TextEditingController();
  TextEditingController ph = TextEditingController();
  TextEditingController bl = TextEditingController();

  bool flag=true;
  // Future<void> credValid(String phn) async
  // {
  //   final DBRef = await FirebaseDatabase.instance.reference();
  //   await DBRef.child("regn").once().then((DataSnapshot dataSnapShot) {
  //     var newdata = dataSnapShot.value;
  //     newdata.forEach((key, values) {
  //       // print(values['phone']);
  //       if ((values['phone']) == phn) {
  //         flag = false;
  //       }
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 24,
        title: Text(
          "Paymigo",
          style: TextStyle(
            fontSize: 28,
            fontFamily: 'Samarkan',
            color: mrkColDrk,
          ),
        ),
        centerTitle: true,
        backgroundColor: mrkColLit,
        iconTheme: IconThemeData(color: mrkColDrk),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
        alignment: Alignment.topCenter,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              mrkColDrk,
              mrkColDrk,
              // mrkColMed,
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
              SizedBox(height: 40,),
              Text(
                "New Card",
                style: TextStyle(
                  fontSize: 56,
                  fontFamily: 'Samarkan',
                  color: mrkColLit,
                ),
              ),
              SizedBox(height: 30,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextField(
                    cursorColor: mrkColDrkT,
                    controller: nm,
                    // maxLength: 10,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      fillColor: mrkColLit,
                      filled: true,
                      hintText: 'Name',
                      hintStyle: TextStyle(
                        fontSize: 24,
                        fontFamily: 'Signika',
                        color: mrkColDrkT,
                      ),
                    ),
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.go,
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'Signika',
                      color: mrkColDrk,
                    ),
                  ),
                  SizedBox(height: 20,),
                  TextField(
                    cursorColor: mrkColDrkT,
                    controller: ph,
                    maxLength: 10,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      fillColor: mrkColLit,
                      filled: true,
                      hintText: 'Phone',
                      hintStyle: TextStyle(
                        fontSize: 24,
                        fontFamily: 'Signika',
                        color: mrkColDrkT,
                      ),
                    ),
                    keyboardType: TextInputType.datetime,
                    textInputAction: TextInputAction.go,
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'Signika',
                      color: mrkColDrk,
                    ),
                  ),
                  TextField(
                    cursorColor: mrkColDrkT,
                    controller: bl,
                    maxLength: 10,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      fillColor: mrkColLit,
                      filled: true,
                      hintText: 'Balance',
                      hintStyle: TextStyle(
                        fontSize: 24,
                        fontFamily: 'Signika',
                        color: mrkColDrkT,
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.go,
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'Signika',
                      color: mrkColDrk,
                    ),
                  ),
                  // SizedBox(height: 20,),
                  // TextField(
                  //   cursorColor: mrkColDrkT,
                  //   obscureText: true,
                  //   controller: pw,
                  //   maxLength: 20,
                  //   decoration: InputDecoration(
                  //     border: InputBorder.none,
                  //     fillColor: mrkColLit,
                  //     filled: true,
                  //     hintText: 'Password',
                  //     hintStyle: TextStyle(
                  //       fontSize: 24,
                  //       fontFamily: 'Signika',
                  //       color: mrkColDrkT,
                  //     ),
                  //   ),
                  //   keyboardType: TextInputType.text,
                  //   textInputAction: TextInputAction.go,
                  //   style: TextStyle(
                  //     fontSize: 24,
                  //     fontFamily: 'Signika',
                  //     color: mrkColDrk,
                  //   ),
                  // ),
                  // SizedBox(height: 12,),
                  RaisedButton(
                    onPressed: () async {
                      showDialog(context: context, barrierDismissible: false, builder: (context){
                        return AlertDialog(
                          title: Column(
                            children: [
                              Icon(
                                Icons.article_outlined,
                                size: 64,
                                color: mrkColDrk,
                              ),
                              Text(
                                "Registering new card...",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          titleTextStyle: TextStyle(
                            color: mrkColDrk,
                            fontFamily: 'Nexa',
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                          // actions: [
                          //   MaterialButton(
                          //     onPressed: (){
                          //       Navigator.of(context).pop();
                          //     },
                          //     child: Text(
                          //       'Close',
                          //       style: TextStyle(
                          //         color: mrkColDrk,
                          //         fontFamily: 'Nexa',
                          //         fontSize: 20,
                          //         fontWeight: FontWeight.bold,
                          //       ),
                          //     ),
                          //     splashColor: mrkColDrk,
                          //   )
                          // ],
                          backgroundColor: mrkColLit,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                        );
                      }
                      );
                      int srl = await dbclass.newCard(currentUnm, nm.text,ph.text,int.parse(bl.text));
                      showDialog(context: context, barrierDismissible: false, builder: (context){
                        return AlertDialog(
                          title: Column(
                            children: [
                              Icon(
                                Icons.nfc_rounded,
                                size: 64,
                                color: mrkColDrk,
                              ),
                              Text(
                                "Scanning NFC card...",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          titleTextStyle: TextStyle(
                            color: mrkColDrk,
                            fontFamily: 'Signika',
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                          // actions: [
                          //   MaterialButton(
                          //     onPressed: (){
                          //       Navigator.of(context).pop();
                          //     },
                          //     child: Text(
                          //       'Close',
                          //       style: TextStyle(
                          //         color: mrkColDrk,
                          //         fontFamily: 'Signika',
                          //         fontSize: 20,
                          //         fontWeight: FontWeight.bold,
                          //       ),
                          //     ),
                          //     splashColor: mrkColDrk,
                          //   )
                          // ],
                          backgroundColor: mrkColLit,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                        );
                      }
                      );
                      await nfc_write("Paymigo|"+currentUnm, srl.toString());
                      Navigator.pop(context);
                      Navigator.pop(context);
                      return showDialog(context: context, barrierDismissible: false, builder: (context){
                        return AlertDialog(
                          title: Text(
                            "Card successfully registered!",
                            textAlign: TextAlign.center,
                          ),
                          titleTextStyle: TextStyle(
                            color: mrkColDrk,
                            fontFamily: 'Signika',
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                          actions: [
                            MaterialButton(
                              onPressed: (){
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                'Close',
                                style: TextStyle(
                                  color: mrkColDrk,
                                  fontFamily: 'Signika',
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              splashColor: mrkColDrk,
                            )
                          ],
                          backgroundColor: mrkColLit,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                        );
                      }
                      );

                    },
                    child: Text(
                      "Register",
                      style: TextStyle(
                        fontSize: 28,
                        fontFamily: 'Signika',
                        color: mrkColDrk,
                      ),
                    ),
                    elevation: 24,
                    padding: EdgeInsets.fromLTRB(32, 12, 32, 12),
                    color: mrkColLit,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  )
                ],
              ),
              SizedBox(height: 10,),
            ],
          ),
        ),
      ),

    );
  }
}
