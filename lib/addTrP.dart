import 'package:flutter/material.dart';
import 'package:paymigo/allGlobal.dart';
import 'package:google_fonts/google_fonts.dart';

class AddTrP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
        backgroundColor: mrkColDrk,
        iconTheme: IconThemeData(color: mrkColWht),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(20, 70, 20, 30),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              mrkColLit,
              mrkColWhtT,
              // mrkColMed,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomRight,
          ),
        ),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            children: [
              RaisedButton(
                elevation: 24,
                padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
                // child: SizedBox(
                //   height: 28,
                //   width: 260,
                //   child: Text(
                //     "New transaction",
                //     style: TextStyle(
                //       fontSize: 28,
                //       fontFamily: 'Nexa',
                //       color: mrkColWht,
                //       // fontWeight: FontWeight.bold
                //     ),
                //     textAlign: TextAlign.center,
                //   ),
                // ),
                child: Icon(
                  Icons.nfc_outlined,
                  size: 162,
                  color: mrkColWht,
                ),
                onPressed: () async {
                  await showDialog(context: context, barrierDismissible: false, builder: (context){
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
                  await clearCardData();
                  print("cleared saved card data");
                  String cardnum = await nfc_read();
                  Navigator.pop(context);
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
                            "Fetching user details...",
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
                  await dbclass.getCardDet(cardnum);
                  Navigator.pop(context);
                  if(uKey=="default card key"){
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
                              "Card not recognised!",
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
                  }
                  else {
                    Navigator.pushNamed(context, '/newtr');
                  }
                  },
                color: mrkColDrk,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                ),
              ),
              SizedBox(
                height: 120,
              ),
            ],
            // mainAxisAlignment: MainAxisAlignment.start,
          ),
        ),
      ),
    );
  }
}
