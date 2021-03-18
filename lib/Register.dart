import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Add.dart';
import 'package:flutter_app/Homepage.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => new _RegisterState();
}

class _RegisterState extends State<Register> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body:SingleChildScrollView(
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                  Text(" You are eligible to be registered\n as a teacher in NYKS",textAlign: TextAlign.center,),
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
                  Text(" Here You Need To Provide\n Your MAIL for Authentication",textAlign: TextAlign.center,),
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
                  Text(" The Details should be entered properly",textAlign: TextAlign.center,),
                ],
              ),
              height: 80,
              width: MediaQuery.of(context).size.width,
            ),
            Container(
                padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                child: Form(
                  key: _key,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                            labelText: 'EMAIL',
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.cyanAccent))),
                        validator: (value) {
                          if(value.isEmpty){
                            return 'Email is required';
                          }

                          if(!RegExp("^[a-zA-Z0-9.!#%&'+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)").hasMatch(value)){
                            return 'Enter a valid email address';
                          }

                          return null;

                        },
                      ),
                      SizedBox(height: 20.0),
                      TextFormField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                            labelText: 'PASSWORD',
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.cyanAccent))),
                        obscureText: true,
                        validator: (value) {
                           if(value.isEmpty){
                            return 'Password is required';
                          }
                             return null;
                        },
                      ),


                      SizedBox(height: 40.0),
                      Container(
                        height: 40.0,
                        child: InkWell(

                          child: Material(
                            borderRadius: BorderRadius.circular(20.0),
                            shadowColor: Colors.blueAccent,
                            color: Colors.blue,
                            elevation: 7.0,
                            child: GestureDetector(
                              onTap: () {

                                if (_key.currentState.validate()) {
                                signUpWithEmail(_emailController.text,_passwordController.text);
                                }
                              },
                              child: Center(
                                child: Text(
                                  'Register',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Montserrat'),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 40.0),
                      Container(
                        height: 40.0,
                        child: InkWell(

                          child: Material(
                            borderRadius: BorderRadius.circular(20.0),
                            shadowColor: Colors.transparent,
                            color: Colors.blueAccent,
                            elevation: 7.0,
                            child: GestureDetector(
                              onTap: () {
                                  Navigator.push(context,
                                    MaterialPageRoute(
                                        builder: (context) => Homepage()),

                                  );
                                },

                              child: Center(
                                child: Text(
                                  'Back to HomePage',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Montserrat'),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                )),
             SizedBox(height: 15.0),
          ],
        )
    )
    );
  }
  // ignore: missing_return
  Future <bool>signUpWithEmail(email,password) async {
    try {
      UserCredential user =  await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _emailController.text, password:_passwordController.text);
      Navigator.push(context,
        MaterialPageRoute(
            builder: (context) => Add()),
      );
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        Fluttertoast.showToast(
            msg: "weak Password!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black54,
            textColor: Colors.white,
            fontSize: 16.0
        );
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        Fluttertoast.showToast(
            msg: "You have already Registered.\n"
                      "Please login!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black54,
            textColor: Colors.white,
            fontSize: 16.0
        );
      }
    }
  }
  }
