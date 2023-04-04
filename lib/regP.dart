import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:paymigo/allGlobal.dart';
import 'package:google_fonts/google_fonts.dart';

class RegP extends StatelessWidget {

  TextEditingController nm = TextEditingController();
  TextEditingController unm = TextEditingController();
  TextEditingController priv = TextEditingController();
  TextEditingController pw = TextEditingController();

  bool flag=true;
  Future<void> credValid(String unm) async
  {
    final DBRef = await FirebaseDatabase.instance.reference();
    await DBRef.child("str").once().then((DataSnapshot dataSnapShot) {
      var newdata = dataSnapShot.value;
      newdata.forEach((key, values) {
        // print(values['phone']);
        if ((values['unm']) == unm) {
          flag = false;
        }
      });
    });
  }

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
                "Store registration",
                style: TextStyle(
                  fontSize: 36,
                  fontFamily: 'Samarkan',
                  color: mrkColLit,
                ),
              ),
              SizedBox(height: 30,),
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
                      hintText: 'Store name',
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
                    controller: unm,
                    // maxLength: 10,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      fillColor: mrkColLit,
                      filled: true,
                      hintText: 'Username',
                      hintStyle: TextStyle(
                        fontSize: 24,
                        fontFamily: 'Signika',
                        color: mrkColDrkT,
                      ),
                    ),
                    keyboardType: TextInputType.text,
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
                    controller: priv,
                    maxLength: 10,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      fillColor: mrkColLit,
                      filled: true,
                      hintText: 'Private key',
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
                  // SizedBox(height: 20,),
                  TextField(
                    cursorColor: mrkColDrkT,
                    obscureText: true,
                    controller: pw,
                    // maxLength: 20,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      fillColor: mrkColLit,
                      filled: true,
                      hintText: 'Password',
                      hintStyle: TextStyle(
                        fontSize: 24,
                        fontFamily: 'Signika',
                        color: mrkColDrkT,
                      ),
                    ),
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.go,
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'Signika',
                      color: mrkColDrk,
                    ),
                  ),
                  SizedBox(height: 20,),
                  SizedBox(height: 12,),
                  RaisedButton(
                    onPressed: () async {
                      await credValid(unm.text);
                      if(!(nm.text.length<1 || priv.text.length<1 || unm.text.length<4 || pw.text.length<4 || nm.text==null || priv.text==null || unm.text==null || pw.text==null)){
                        if(flag) {
                          // await dbclass.writeRegData(nm.text,priv.text,ph.text,pw.text);
                          await dbclass.writeRegData(unm.text, nm.text, priv.text, pw.text);
                          Navigator.pop(context);
                          return showDialog(context: context, barrierDismissible: false, builder: (context){
                            return AlertDialog(
                              title: Column(
                                children: [
                                  Icon(
                                    Icons.done_outline_rounded,
                                    size: 64,
                                    color: mrkColDrk,
                                  ),
                                  Text(
                                    "Store successfully registered",
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
                        }
                        else {
                          flag = true;
                          unm.clear();
                          nm.clear();
                          priv.clear();
                          pw.clear();
                          return showDialog(context: context,
                              barrierDismissible: false,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text(
                                    "Username already exists!",
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
                                      onPressed: () {
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
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16)),
                                );
                              }
                          );
                        }
                      }
                      else{
                        return showDialog(context: context,
                            barrierDismissible: false,
                            builder: (context) {
                              return AlertDialog(
                                title: Text(
                                  "Invalid input!",
                                  textAlign: TextAlign.center,
                                ),
                                titleTextStyle: TextStyle(
                                  color: mrkColDrk,
                                  fontFamily: 'Signika',
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                                content: Text(
                                  "Please check if you have:\n\n1.\t\tFilled all the details.\n2.\tEntered a valid mobile number\n3.\tChosen a password that is at least 4 characters long.",
                                  style: TextStyle(
                                    fontFamily: 'Signika',
                                    fontSize: 16,
                                    color: mrkColDrk,
                                  ),
                                  textAlign: TextAlign.justify,
                                ),
                                actions: [
                                  MaterialButton(
                                    onPressed: () {
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
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16)),
                              );
                            }
                        );
                      }

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
