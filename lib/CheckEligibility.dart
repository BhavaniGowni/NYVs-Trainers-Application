import 'package:flutter/material.dart';
import 'package:flutter_app/Register.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CheckEligibility extends StatefulWidget {
  @override
  _CheckEligibilityState createState() => _CheckEligibilityState();
}

class _CheckEligibilityState extends State<CheckEligibility> {
  final ageController = TextEditingController();
  final memberController = TextEditingController();
  final thereController = TextEditingController();
  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        body: SingleChildScrollView(
          child: Container(
            //padding: EdgeInsets.all(16),
            child: Form(
              key: _key,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.cyanAccent,

                    ),

                    child: Row(

                      children: [
                        Icon(Icons.auto_awesome),
                        Text("Things you need to know",textAlign: TextAlign.center,),
                      ],
                    ),
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(15,5,5,5),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.cyanAccent,

                    ),

                    child: Row(

                      children: [
                        Icon(Icons.assignment_turned_in_outlined),
                        Text(" Minimum 18 years and maximum 25 years\n as on 1st April of the\n year of registration.",textAlign: TextAlign.center,),
                      ],
                    ),
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(15,5,5,5),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.cyanAccent,

                    ),

                    child: Row(

                      children: [
                        Icon(Icons.assignment_turned_in_outlined),
                        Text(" Students who have enrolled themselves\n for regular academic\n courses are not eligible",textAlign: TextAlign.center,),
                      ],
                    ),
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(15,5,5,5),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.cyanAccent,

                    ),

                    child: Row(

                      children: [
                        Icon(Icons.assignment_turned_in_outlined),
                        Text("   Need To be Member in NYKS\n YOUTH CLUB",textAlign: TextAlign.center,),
                      ],
                    ),
                    height: 80,
                    width: MediaQuery.of(context).size.width,
                  ),
                  SizedBox(height: 18,),

                  Container(
                    padding: EdgeInsets.fromLTRB(18, 0, 18, 0),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: ageController,
                          // ignore: missing_return
                          validator: (value){
                            int age = int.tryParse(value);
                            if (value.isEmpty) {
                              return ( 'Age Cant be empty');
                            }
                            else if ( age <= 18 ) {
                              return ('Age must be greater than 18');
                            }
                            else if (age>=50) {
                              return ('Age must be less than 50');
                            }
                            else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            hintText: "Give your age",
                            labelText: 'Age',
                            labelStyle: TextStyle(color: Colors.black54),),
                          style: TextStyle(
                            color: Colors.black,

                          ),
                        ),

                        SizedBox(height: 5,),

                        TextFormField(
                          controller: memberController,
                          validator: (value){
                            if (value.isEmpty) {
                              return ( 'Please Enter Yes Or No');
                            }
                            if (value == 'no') {
                              return ( 'you are not eligible');
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: 'Are You Member of CLub?',
                            hintText: 'Yes/No',
                            labelStyle: TextStyle(color: Colors.black54),),
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),

                       TextFormField(
                          controller: thereController,
                          validator: ( value){
                            if (value.isEmpty) {return ( 'Please Enter Yes Or No');
                            }

                            if (value == 'yes') {
                             return ( 'you are not eligible');
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: 'Are You enrolled for other  courses?',
                            hintText: 'Yes/No',
                            labelStyle: TextStyle(color: Colors.black54),),
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ],

                    ),
                  ),


                  SizedBox(height: 5,),



                  SizedBox(height: 5,),
                  RaisedButton(

                    onPressed: () {
                      if (_key.currentState.validate()) {
                        Fluttertoast.showToast(
                            msg: "You can Apply!",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.black54,
                            textColor: Colors.white,
                            fontSize: 16.0
                        );
                      }
                       else{
                        Fluttertoast.showToast(
                            msg: "You cannot Apply!",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.black54,
                            textColor: Colors.white,
                            fontSize: 16.0
                        );
                      }
                    },
                    textColor: Colors.white,
                    color: Colors.blue,

                    shape: RoundedRectangleBorder(

                        borderRadius: BorderRadius.circular(30.0),
                        side: BorderSide(color: Colors.black)

                    ),

                    padding: const EdgeInsets.all(10.0),
                    child:
                    const Text('Check', style: TextStyle(fontSize: 20)),

                  ),
                  RaisedButton(

                    onPressed: () {
                      if (_key.currentState.validate()) {
                        Navigator.push(context,
                          MaterialPageRoute(
                              builder: (context) => Register()),

                        );
                      }
                    },
                    textColor: Colors.white,
                    color: Colors.blue,

                    shape: RoundedRectangleBorder(

                      borderRadius: BorderRadius.circular(30.0),
                      side: BorderSide(color: Colors.black87),

                    ),

                    padding: const EdgeInsets.all(10.0),
                    child:
                    const Text('Go to Register page...', style: TextStyle(fontSize: 20)),

                  ),


                ],
              ),
            ),
          ),
        ),

      );
  }
}