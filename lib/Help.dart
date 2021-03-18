import 'package:flutter/material.dart';
import 'package:flutter_app/CheckEligibility.dart';
class Help extends StatefulWidget {
  @override
  _HelpState createState() => _HelpState();
}


class _HelpState extends State<Help> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body:SingleChildScrollView(
          child: Center(

            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(

                children: [
                  Column(
                    children: [
                      new Container(

                        width: MediaQuery.of(context).size.width,
                        height: 310.0,
                        child: Text("NYKS HELPLINE"),
                        decoration: new BoxDecoration(
                          shape: BoxShape.rectangle,
                          image: new DecorationImage(
                            image: new ExactAssetImage(
                                "assets/pic4.jpg"),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30,),
                  Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.fromLTRB(10, 40, 10,10),
                            child: Column(
                              children: [
                                Text("Hello!\n",style: TextStyle(color: Colors.black,fontSize: 30.0,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                                Text("I am HelpLine\n",style: TextStyle(color: Colors.black,fontSize: 20.0,fontWeight: FontWeight.bold),),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(

                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 200,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.greenAccent,
                                width: 5,
                              ),
                            ),
                            child: Center(
                                child: Text("I will assist you\n and explain each step\n during the process of new NYC registration", style: TextStyle(fontSize: 20),textAlign: TextAlign.center,)
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                      RaisedButton(

                        onPressed: () {

                          Navigator.push(context,
                            MaterialPageRoute(builder: (context) => CheckEligibility()),
                          );

                        },
                        textColor: Colors.white,
                        color: Colors.black,

                        shape: RoundedRectangleBorder(

                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.deepPurple)

                        ),

                        padding: const EdgeInsets.all(10.0),
                        child:
                        const Text('Lets Start', style: TextStyle(fontSize: 20)),

                      ),
                    ],
                  ),
                ],
              ),


            ),
          ),
        ),
      ),

    );
  }
}