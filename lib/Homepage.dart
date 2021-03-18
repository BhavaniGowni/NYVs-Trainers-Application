//import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/CheckEligibility.dart';
import 'package:flutter_app/Files.dart';
import 'package:flutter_app/Help.dart';
import 'package:flutter_app/loginpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app/ListPage.dart';
import 'Details.dart';
// ignore: must_be_immutable
class Homepage extends StatelessWidget {
  BuildContext context;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('NATIONAL YOUTH CORPS', textAlign: TextAlign.center,
          style: TextStyle(
              fontFamily: 'Open Sans', fontWeight: FontWeight.bold),),

        backgroundColor: Colors.deepPurple,
      ),
      drawer: Container(
        child: new Drawer(

          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
               child:Text("Welcome!", textAlign: TextAlign.center,
                 style: TextStyle(
                     fontFamily: 'Open Sans',fontSize: 20, fontWeight: FontWeight.bold,color: Colors.white),),
                  decoration: BoxDecoration(
                    color: Colors.black,
                      image: DecorationImage(
                        image: AssetImage("assets/pic6.jpg"),
                        fit: BoxFit.fill
                    )
              ),
              ),
              ListTile(
                dense: true,
                title: Text("Login", style: TextStyle(color: Colors.black),),
                leading: Icon(Icons.login),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));},
              ),
              ListTile(
                title: Text("Help", style: TextStyle(color: Colors.black),),
                leading: Icon(Icons.text_format_sharp),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Help()));
                },
              ),
              ListTile(
                title: Text("Register", style: TextStyle(color: Colors.black),),
                leading: Icon(Icons.text_format_sharp),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CheckEligibility()));
                },
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Container(
              alignment: Alignment(0, -0.5),
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              height: MediaQuery
                  .of(context)
                  .size
                  .height,
              decoration: BoxDecoration(
                color: const Color(0xffffff),
              )
          ),

          Positioned(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              top: MediaQuery
                  .of(context)
                  .size
                  .width * 0.20,
              //TRY TO CHANGE THIS *0.30* value to achieve your goal
              child: Container(
                margin: EdgeInsets.all(16.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset('assets/gov.gif', scale: 1.5),
                      SizedBox(height: 20,),
                      Text("   GOVERNMENT OF INDIA  \n "
                          "  Ministry Of Youth Affairs\n "
                          " Department Of Youth Affairs\n "
                          "Nehru Yuva Kendra Sangathan\n",
                          style: TextStyle(fontSize: 20,
                              color: Colors.black,
                              fontFamily: 'Open Sans',
                              fontWeight: FontWeight.bold)
                      ),
                    ]
                ),
              ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
            MaterialPageRoute(builder: (context) =>Help()),
          );
        },
        child: Text('NEXT'),
        backgroundColor: Colors.deepPurple,
      ),
    );
  }
}
// ignore: must_be_immutable
class HomepageLogin extends StatelessWidget {
  final auth = FirebaseAuth.instance;
  BuildContext context;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text('NATIONAL YOUTH CORPS',textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: 'Open Sans', fontWeight: FontWeight.bold),),
          backgroundColor: Colors.deepPurple,
        ),
        drawer: new Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child:Text("Welcome!", textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Open Sans', fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20),),
                decoration: BoxDecoration(
                    color: Colors.black,
                    image: DecorationImage(
                        image: AssetImage("assets/pic6.jpg"),
                        fit: BoxFit.fill
                    )
                ),
              ),
              ListTile(
                dense: true,
                title: Text("Logout", style: TextStyle(color: Colors.black),),
                leading: Icon(Icons.login),
                onTap: (){
                  auth.signOut();
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Homepage()));},
              ),
              ListTile(
                title: Text("Details", style: TextStyle(color: Colors.black),),
                leading: Icon(Icons.text_format_sharp),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Details()));
                },
              ),

            ],
          ),
        ),
        body: Stack(
          children: <Widget>[
            Container(
                alignment: Alignment(0, -0.5),
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                height: MediaQuery
                    .of(context)
                    .size
                    .height,
                decoration: BoxDecoration(
                  color: const Color(0xffffff),
                )
            ),

            Positioned(
                width: MediaQuery.of(context).size.width,
                top: MediaQuery.of(context).size.width * 0.20,//TRY TO CHANGE THIS 0.30 value to achieve your goal
                child: Container(
                  margin: EdgeInsets.all(16.0),
                  child:Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset('assets/gov.gif', scale: 1.5),
                        SizedBox(height: 20,),
                        Text("   GOVERNMENT OF INDIA  \n "
                            "  Ministry Of Youth Affairs\n "
                            " Department Of Youth Affairs\n "
                            "Nehru Yuva Kendra Sangathan\n",
                            style: TextStyle(fontSize: 20, color: Colors.black,fontFamily: 'Open Sans',
                                fontWeight: FontWeight.bold)
                        ),
                      ]
                  ),
                ))
          ],
        )
    );
  }
}



// ignore: must_be_immutable
class HomepageAdmin extends StatelessWidget {
  final auth = FirebaseAuth.instance;
  BuildContext context;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text('NATIONAL YOUTH CORPS',textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: 'Open Sans', fontWeight: FontWeight.bold,),),
          backgroundColor: Colors.deepPurple,
        ),
        drawer: new Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child:Text("Welcome!", textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Open Sans', fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20),),
                decoration: BoxDecoration(
                    color: Colors.black,
                    image: DecorationImage(
                        image: AssetImage("assets/pic6.jpg"),
                        fit: BoxFit.fill
                    )
                ),
              ),
              ListTile(
                dense: true,
                title: Text("Logout", style: TextStyle(color: Colors.black),),
                leading: Icon(Icons.login),
                onTap: (){
                  auth.signOut();
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Homepage()));},
              ),
              ListTile(
                title: Text("List", style: TextStyle(color: Colors.black),),
                leading: Icon(Icons.text_format_sharp),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ListPage()));
                },
              ),

            ],
          ),
        ),
        body: Stack(
          children: <Widget>[
            Container(
                alignment: Alignment(0, -0.5),
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                height: MediaQuery
                    .of(context)
                    .size
                    .height,
                decoration: BoxDecoration(
                  color: const Color(0xffffff),
                )
            ),

            Positioned(
                width: MediaQuery.of(context).size.width,
                top: MediaQuery.of(context).size.width * 0.20,//TRY TO CHANGE THIS 0.30 value to achieve your goal
                child: Container(
                  margin: EdgeInsets.all(16.0),
                  child:Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset('assets/gov.gif', scale: 1.5),
                        SizedBox(height: 20,),
                        Text("   GOVERNMENT OF INDIA  \n "
                            "  Ministry Of Youth Affairs\n "
                            " Department Of Youth Affairs\n "
                            "Nehru Yuva Kendra Sangathan\n",
                            style: TextStyle(fontSize: 20, color: Colors.black,fontFamily: 'Open Sans',
                                fontWeight: FontWeight.bold)
                        ),
                      ]
                  ),
                ))
          ],
        )
    );
  }
}


