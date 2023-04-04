import 'package:paymigo/allGlobal.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class DashP extends StatelessWidget {

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
            color: mrkColWht,
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
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Column(
            children: [
              RaisedButton(
                elevation: 24,
                padding: EdgeInsets.fromLTRB(32, 12, 32, 12),
                child: SizedBox(
                  height: 28,
                  width: 260,
                  child: Text(
                    "New transaction",
                    style: TextStyle(
                      fontSize: 28,
                      fontFamily: 'Signika',
                      color: mrkColWht,
                      // fontWeight: FontWeight.bold
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                onPressed: (){Navigator.pushNamed(context, '/addtr');},
                color: mrkColDrk,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              RaisedButton(
                elevation: 24,
                padding: EdgeInsets.fromLTRB(32, 12, 32, 12),
                child: SizedBox(
                  height: 28,
                  width: 260,
                  child: Text(
                    "Refill card",
                    style: TextStyle(
                      fontSize: 28,
                      fontFamily: 'Signika',
                      color: mrkColWht,
                      // fontWeight: FontWeight.bold
                    ),
                    textAlign: TextAlign.center,
                  ),
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
                  else {
                    Navigator.pushNamed(context, '/rflcd');
                  }
                  },
                color: mrkColDrk,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              RaisedButton(
                elevation: 24,
                padding: EdgeInsets.fromLTRB(32, 12, 32, 12),
                child: SizedBox(
                  height: 28,
                  width: 260,
                  child: Text(
                    "Issue new card",
                    style: TextStyle(
                      fontSize: 28,
                      fontFamily: 'Signika',
                      color: mrkColWht,
                      // fontWeight: FontWeight.bold
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/newcd');
                },
                color: mrkColDrk,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              // RaisedButton(
              //   elevation: 24,
              //   padding: EdgeInsets.fromLTRB(32, 12, 32, 12),
              //   child: SizedBox(
              //     height: 28,
              //     width: 260,
              //     child: Text(
              //       "Delete card",
              //       style: TextStyle(
              //         fontSize: 28,
              //         fontFamily: 'Signika',
              //         color: mrkColWht,
              //         // fontWeight: FontWeight.bold
              //       ),
              //       textAlign: TextAlign.center,
              //     ),
              //   ),
              //   onPressed: () {
              //     Navigator.pushNamed(context, '/delcd');
              //   },
              //   color: mrkColDrk,
              //   shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.circular(10),
              //   ),
              // ),
              // SizedBox(
              //   height: 40,
              // ),
              // RaisedButton(
              //   elevation: 24,
              //   padding: EdgeInsets.fromLTRB(32, 12, 32, 12),
              //   child: SizedBox(
              //     height: 28,
              //     width: 260,
              //     child: Text(
              //       "Test",
              //       style: TextStyle(
              //         fontSize: 28,
              //         fontFamily: 'Signika',
              //         color: mrkColWht,
              //         // fontWeight: FontWeight.bold
              //       ),
              //       textAlign: TextAlign.center,
              //     ),
              //   ),
              //   onPressed: () {
              //     Navigator.pushNamed(context, '/tests');
              //   },
              //   color: mrkColDrk,
              //   shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.circular(10),
              //   ),
              // ),
            ],
          ),
        ),
      ),
      drawer: Container(
        width: 200,
        padding: EdgeInsets.fromLTRB(10, 42, 10, 36),
        alignment: Alignment.topCenter,
        color: mrkColDrk,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onLongPress: (){
                    Navigator.pushNamed(context, '/tests');
                  },
                  child: CircleAvatar(
                    child: Icon(
                      Icons.person_pin,
                      size: 108,
                      color: mrkColWht,
                    ),
                    radius: 56,
                    backgroundColor: Color(0x00000000),
                  ),
                ),
                SizedBox(height: 20,),
                SizedBox(
                  width: 170,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hi",
                        style: TextStyle(
                          fontSize: 22,
                          fontFamily: 'Signika',
                          color: mrkColWht,
                          // fontWeight: FontWeight.bold
                        ),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 10,),
                      Text(
                        currentName,
                        style: TextStyle(
                            fontSize: 24,
                            fontFamily: 'Signika',
                            color: mrkColWht,
                            fontWeight: FontWeight.bold
                        ),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 30,),
                      OutlineButton(
                        onPressed: (){Navigator.pushNamed(context, '/info');},
                        child: SizedBox(
                          width: 140,
                          child: Text(
                            "My info",
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Signika',
                              color: mrkColWht,
                              // fontWeight: FontWeight.bold
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        borderSide: BorderSide(
                          color: mrkColWht,
                          width: 1,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Column(
              children: [
                // OutlineButton(
                //   onPressed: (){
                //     linkop('mailto:manishraj.khan2019@vitstudent.ac.in');
                //   },
                //   child: SizedBox(
                //     width: 140,
                //     child: Text(
                //       "Feedback",
                //       style: TextStyle(
                //         fontSize: 18,
                //         fontFamily: 'Signika',
                //         color: mrkColWht,
                //         // fontWeight: FontWeight.bold
                //       ),
                //       textAlign: TextAlign.center,
                //     ),
                //   ),
                //   borderSide: BorderSide(
                //     color: mrkColWht,
                //     width: 1,
                //   ),
                //   shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(8),
                //   ),
                // ),
                FlatButton(
                  onPressed: () async {
                    await clearSavedLocal();
                    await updateSaved();
                    Navigator.pushReplacementNamed(context, '/login');
                  },
                  child: SizedBox(
                    width: 140,
                    child: Text(
                      "Logout",
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Signika',
                          color: mrkColDrk,
                          fontWeight: FontWeight.w600
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  color: mrkColWht,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      // drawerScrimColor: mrkColScrm,
      floatingActionButton: Container(
        width: 80,
        height: 80,
        alignment: Alignment.topLeft,
        // child: FloatingActionButton(
        //   elevation: 24,
        //   onPressed: (){
        //     return showDialog(context: context, barrierDismissible: false, builder: (context){
        //       return AlertDialog(
        //         title: Text(
        //           "About the app",
        //           textAlign: TextAlign.center,
        //         ),
        //         titleTextStyle: TextStyle(
        //           color: mrkColDrk,
        //           fontFamily: 'Signika',
        //           fontSize: 24,
        //           fontWeight: FontWeight.bold,
        //         ),
        //         content: SingleChildScrollView(
        //           child: Text(
        //             "This app aims to present a fully functional comprehensive platform to provide an all-encompassing pandemic protection solution for people.\nUsers can know about the confirmed, recovered, active and deceased cases around the world to help them know the spread of the virus. The care option of the app, which people can use to not only know about potential health risks, symptoms of COVID-19 and measures to be undertaken when facing certain symptoms but also to book appointments and receive the reports directly through the app. Since the system will be keeping a track of daily cases recorded in each country, it also has the option that helps people in deciding for their future travel plans.\nWith the current situation in mind, it becomes immensely important for each and every one of us to follow the proper measures and take every step carefully to help eradicate the virus. So, with Paymigo we try to present an app that can assist the users in keeping safe and healthy in this pandemic and help them to detect contraction of the disease and get proper medical assistance at the earliest, hassle-free.\n\nTeam name: Mark16\n\nTeam:\nManishraj Khan (19BCE0737)",
        //             style: TextStyle(
        //               fontFamily: 'Signika',
        //               fontSize: 16,
        //               color: mrkColDrk,
        //             ),
        //             textAlign: TextAlign.justify,
        //           ),
        //         ),
        //         actions: [
        //           MaterialButton(
        //             onPressed: (){
        //               Navigator.of(context).pop();
        //             },
        //             child: Text(
        //               'Close',
        //               style: TextStyle(
        //                 color: mrkColDrk,
        //                 fontFamily: 'Signika',
        //                 fontSize: 20,
        //                 fontWeight: FontWeight.bold,
        //               ),
        //             ),
        //             splashColor: mrkColDrk,
        //           )
        //         ],
        //         backgroundColor: mrkColMed,
        //         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        //       );
        //     });
        //   },
        //   backgroundColor: Color(0x0045211d),
        //   splashColor: Color(0x0045211d),
        //   // shape: ,
        //   child: Icon(
        //     Icons.info_outline,
        //     size: 60,
        //     color: mrkColDrk,
        //   ),
        // ),
      ),
    );
  }
}
