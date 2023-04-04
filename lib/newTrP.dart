import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:paymigo/allGlobal.dart';
import 'package:google_fonts/google_fonts.dart';

class NewTrP extends StatelessWidget {

  TextEditingController am = TextEditingController();

  bool flag=true;

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
                "Debit",
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          "Name",
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Signika',
                            color: mrkColLit,
                          )
                      ),
                      Text(
                          uName,
                          style: TextStyle(
                            fontSize: 32,
                            fontFamily: 'Signika',
                            color: mrkColLit,
                          )
                      ),
                      SizedBox(height: 10,),
                      Text(
                          "Phone",
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Signika',
                            color: mrkColLit,
                          )
                      ),
                      Text(
                          uPhone,
                          style: TextStyle(
                            fontSize: 32,
                            fontFamily: 'Signika',
                            color: mrkColLit,
                          )
                      ),
                      SizedBox(height: 10,),
                      Text(
                          "Available balance",
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Signika',
                            color: mrkColLit,
                          )
                      ),
                      Text(
                          uBal,
                          style: TextStyle(
                            fontSize: 32,
                            fontFamily: 'Signika',
                            color: mrkColLit,
                          )
                      ),
                      // SizedBox(height: 10,),
                      // Text(
                      //     "Card code",
                      //     style: TextStyle(
                      //       fontSize: 16,
                      //       fontFamily: 'Signika',
                      //       color: mrkColLit,
                      //     )
                      // ),
                      // Text(
                      //     uKey,
                      //     style: TextStyle(
                      //       fontSize: 32,
                      //       fontFamily: 'Signika',
                      //       color: mrkColLit,
                      //     )
                      // ),
                      SizedBox(height: 20,),
                      TextField(
                        cursorColor: mrkColDrkT,
                        controller: am,
                        // maxLength: 10,
                        decoration: InputDecoration(
                          // border: InputBorder.none,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          fillColor: mrkColLit,
                          filled: true,
                          hintText: '₹0',
                          hintStyle: TextStyle(
                            fontSize: 56,
                            fontFamily: 'Signika',
                            color: mrkColDrkT,
                          ),
                        ),
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.go,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 56,
                          fontFamily: 'Signika',
                          color: mrkColDrk,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
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
                      if(int.parse(am.text)<=0){
                        await showDialog(context: context, barrierDismissible: false, builder: (context){
                          return AlertDialog(
                            title: Column(
                              children: [
                                Icon(
                                  Icons.error_outline_rounded,
                                  size: 64,
                                  color: mrkColDrk,
                                ),
                                Text(
                                  "Invalid request!",
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
                      }
                      else if(int.parse(am.text)>int.parse(uBal)){
                        await showDialog(context: context, barrierDismissible: false, builder: (context){
                          return AlertDialog(
                            title: Column(
                              children: [
                                Icon(
                                  Icons.error_outline_rounded,
                                  size: 64,
                                  color: mrkColDrk,
                                ),
                                Text(
                                  "Insufficient balance!",
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
                      }
                      else{
                        showDialog(context: context, barrierDismissible: false, builder: (context){
                          return AlertDialog(
                            title: Column(
                              children: [
                                Icon(
                                  Icons.monetization_on_outlined,
                                  size: 64,
                                  color: mrkColDrk,
                                ),
                                Text(
                                  "Processing...",
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
                        // await nfc_write("Paymigo|"+currentUnm, srl.toString());
                        await dbclass.procTr(int.parse(am.text));
                        Navigator.pop(context);
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
                                  "Transaction successful",
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
                      }

                    },
                    child: Text(
                      "Confirm",
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
