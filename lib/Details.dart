import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
// ignore: must_be_immutable
 class Details extends StatefulWidget {
   @override
   _DetailsState createState() => _DetailsState();
 }

 class _DetailsState extends State<Details> {
   String uid=FirebaseAuth.instance.currentUser.uid.toString();
   @override
   Widget build(BuildContext context) {

     CollectionReference users = FirebaseFirestore.instance.collection('test');
     return FutureBuilder<DocumentSnapshot>(
         future: users.doc(uid).get(),
         builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
           if (!snapshot.hasData) return new Text('Loading...');

           if (snapshot.connectionState == ConnectionState.done) {
             Map<String, dynamic> data = snapshot.data.data();
             return  new Scaffold(
               appBar: AppBar(
                     title:  Text("     Application Form",style: TextStyle(color: Colors.white,fontSize: 20.0,fontWeight: FontWeight.bold,fontFamily: 'Open Sans'),),
                 backgroundColor: Colors.deepPurple,
               ),
                 body:SingleChildScrollView(
                   child:Center(
                    child:Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/pic9.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Column(
                         crossAxisAlignment: CrossAxisAlignment.center,
                         children:[
                           SizedBox(height: 30),
                           Container(
                               padding: EdgeInsets.all(20),
                               child: Column(
                                   children:[
                                     new Text("  GOVERNMENT OF INDIA ", style: TextStyle(fontSize: 20, color: Colors.black,fontFamily: 'Open Sans',
                                         fontWeight: FontWeight.bold)),
                                     new Text("   Nehru Yuva Kendra Sangathan ", style: TextStyle(fontSize: 20, color: Colors.black,fontFamily: 'Open Sans',
                                         fontWeight: FontWeight.bold)),
                                   ])
                           ),
                           Container(
                               padding: EdgeInsets.all(10),
                               child: Row(
                                   children:[
                                     new Text("Name:",style: TextStyle(color: Colors.black,fontSize: 20.0,fontWeight: FontWeight.bold),),
                                     new Text(" ${data['field1']}",
                                       style: TextStyle(fontSize: 20,
                                         color: Colors.black,),),

                                   ])
                           ),
                           Container(
                             padding: EdgeInsets.all(10),
                             child:  Row(
                                 children:[
                                   new Text("Surname:",style: TextStyle(color: Colors.black,fontSize: 20.0,fontWeight: FontWeight.bold)),
                                   new Text(" ${data['field2']}",
                                     style: TextStyle(fontSize: 20,
                                       color: Colors.black,),
                                   ),
                                 ] ),
                           ),
                           Container(
                             padding: EdgeInsets.all(10),
                             child:  Row(
                                 children:[
                                   new Text("Mobile:",style: TextStyle(color: Colors.black,fontSize: 20.0,fontWeight: FontWeight.bold)),
                                   new Text(" ${data['field3']}",
                                     style: TextStyle(fontSize: 20,
                                       color: Colors.black,),
                                   ),
                                 ] ),
                           ),
                           Container(
                             padding: EdgeInsets.all(10),
                             child: Row(
                                 children:[
                                   new Text("DOB:",style: TextStyle(color: Colors.black,fontSize: 20.0,fontWeight: FontWeight.bold)),
                                   new Text("${data['field4']}",
                                     style: TextStyle(fontSize: 20,
                                       color: Colors.black,),
                                   ),
                                 ] ),
                           ),
                           Container(
                             padding: EdgeInsets.all(10),
                             child:  Row(
                                 children:[
                                   new Text("State:",style: TextStyle(color: Colors.black,fontSize: 20.0,fontWeight: FontWeight.bold)),
                                   new Text(" ${data['field5']}",
                                     style: TextStyle(fontSize: 20,
                                       color: Colors.black,),
                                   ),
                                 ]),
                           ),
                           Container(
                             padding: EdgeInsets.all(10),
                             child:  Row(
                                 children:[
                                   new Text("Address:",style: TextStyle(color: Colors.black,fontSize: 20.0,fontWeight: FontWeight.bold)),
                                   new Text(" ${data['field6']}",
                                     style: TextStyle(fontSize: 20,
                                       color: Colors.black,),
                                   ),
                                 ]),
                           ),
                           Container(
                             padding: EdgeInsets.all(10),
                             child:  Row(
                                 children:[
                                   new Text("Qualification:",style: TextStyle(color: Colors.black,fontSize: 20.0,fontWeight: FontWeight.bold)),
                                   new Text(" ${data['field7']}",
                                     style: TextStyle(fontSize: 20,
                                       color: Colors.black,),
                                   ),
                                 ] ),
                           ),
                           Container(
                             padding: EdgeInsets.all(10),
                             child:  Row(
                                 children:[
                                   new Text("College:",style: TextStyle(color: Colors.black,fontSize: 20.0,fontWeight: FontWeight.bold)),
                                   new Text(" ${data['field8']}",
                                     style: TextStyle(fontSize: 20,
                                       color: Colors.black,),
                                   ),
                                 ]),
                           ),
                           Container(
                             padding: EdgeInsets.all(10),
                             child: Row(
                                 children:[
                                   new Text("Languages Known:",style: TextStyle(color: Colors.black,fontSize: 20.0,fontWeight: FontWeight.bold)),
                                   new Text(" ${data['field9']}",
                                     style: TextStyle(fontSize: 20,
                                       color: Colors.black,),
                                   maxLines: 2,
                                   overflow: TextOverflow.ellipsis,),
                                 ] ),
                           ),
                           Container(
                             padding: EdgeInsets.all(10),
                             child: Row(
                                 children:[
                                   new Text("Category:",style: TextStyle(color: Colors.black,fontSize: 20.0,fontWeight: FontWeight.bold)),
                                   new Text(" ${data['field10']}",
                                     style: TextStyle(fontSize: 20,
                                       color: Colors.black,),
                                   ),
                                 ]),
                           ),
                           Container(
                             padding: EdgeInsets.all(10),
                             child: Row(
                                 children:[
                                   new Text("Gender:",style: TextStyle(color: Colors.black,fontSize: 20.0,fontWeight: FontWeight.bold)),
                                   new Text(" ${data['field11']}",
                                     style: TextStyle(fontSize: 20,
                                       color: Colors.black,),
                                   ),
                                 ] ),
                           ),
                           Container(
                             padding: EdgeInsets.all(10),
                             child:  Row(
                                 children:[
                                   new Text("Programmes:",style: TextStyle(color: Colors.black,fontSize: 20.0,fontWeight: FontWeight.bold)),
                                   new Text(" ${data['field12']}",
                                     style: TextStyle(fontSize: 20,
                                       color: Colors.black,),
                                   ),
                                 ] ),
                           ),
                           Container(
                             padding: EdgeInsets.all(10),
                             child: Row(
                                 children:[
                                   new Text("Declaration:",style: TextStyle(color: Colors.black,fontSize: 20.0,fontWeight: FontWeight.bold)),
                                   new Text(" ${data['field13']}",
                                     style: TextStyle(fontSize: 20,
                                       color: Colors.black,),
                                   ),
                                 ] ),
                           ),
                            ]),
                    ),
                 )
                 )

             );
           }
           if (snapshot.hasError) {
             return Text("Something went wrong");
           }
           return Text("loading");
         },
     );
   }

 }

