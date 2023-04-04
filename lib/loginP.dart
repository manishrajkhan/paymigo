import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:paymigo/allGlobal.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginP extends StatelessWidget {

  TextEditingController id = TextEditingController();
  TextEditingController pw = TextEditingController();

  bool loginFlag=false;
  Future<void> credValid(String ids, String pws) async
  {
    final DBRef = await FirebaseDatabase.instance.reference();
    await DBRef.child("str").once().then((DataSnapshot dataSnapShot){
      var newdata = dataSnapShot.value;
      newdata.forEach((key,values){
        print(values['unm']);
        if((values['unm'])==ids && (values['pass'])==pws){
          currentUnm = values['unm'];
          currentName = values['stnm'];
          currentPass = values['pass'];
          priv_key = int.parse(values['priv']);
          // pub_key = gen_key(priv_key);

          loginFlag=true;
        }
      });
      id.clear();pw.clear();
    });
    await updateSaved();
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
                    "Paymigo",
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
                    controller: id,
                    // maxLength: 10,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      fillColor: mrkColWhtT,
                      filled: true,
                      hintText: 'Username',
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
                    controller: pw,
                    // maxLength: 20,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      fillColor: mrkColWhtT,
                      filled: true,
                      hintText: 'Password',
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

                      showDialog(context: context, barrierDismissible: false, builder: (context){
                        return AlertDialog(
                          title: Column(
                            children: [
                              Icon(
                                Icons.lock_clock,
                                size: 64,
                                color: mrkColDrk,
                              ),
                              Text(
                                "Verifying credentials...",
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
                      await credValid(id.text, pw.text);
                      Navigator.pop(context);
                      if(loginFlag)
                        Navigator.pushReplacementNamed(context, '/dash');
                      else
                        return showDialog(context: context, barrierDismissible: false, builder: (context){
                          return AlertDialog(
                            title: Text(
                              "Invalid Credentials!",
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
                        });
                    },
                    child: Text(
                      "Login",
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
                  onPressed: (){Navigator.pushNamed(context, '/reg');},
                  child: Text(
                      "Register",
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
      //     // dbclass.writeRegData("Sayam", "2222", "7894561230", "pass");
      //     dbclass.writeRegData('firststore', 'First Store', '1231', "pass");
      //   },
      // ),
    );
  }
}
