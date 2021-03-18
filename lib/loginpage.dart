import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app/Help.dart';
import 'package:flutter_app/Homepage.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final _keyform = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text('      Login Page',
            style: TextStyle(
                fontFamily: 'Open Sans',fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20),),
          backgroundColor: Colors.lightBlue[200],
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/pic7.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
              padding: EdgeInsets.all(10),
              child: ListView(
                  children: [
                    Form(
                      key: _keyform,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:     <Widget>[



                          Container(

                              alignment: Alignment.center,

                              padding: EdgeInsets.all(10),

                              child: Text(

                                'Sign in',

                                style: TextStyle(fontSize: 20),

                              )),

                          Container(



                            padding: EdgeInsets.all(10),

                            child: TextFormField(

                              controller: _emailController,

                              decoration: InputDecoration(
                                  labelText: 'UserName',
                                  labelStyle: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black87))),

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

                          ),

                          Container(



                            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),

                            child: TextFormField(

                              obscureText: true,

                              controller: _passwordController,

                              decoration: InputDecoration(
                                  labelText: 'Password',
                                  labelStyle: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black87))),

                              validator: (value) {

                                if(value.isEmpty){

                                  return 'Password is required';

                                }

                                return null;

                              },

                            ),

                          ),

                          Container(

                              height: 60,

                              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),

                              child: RaisedButton(
                                onPressed: () {
                                    signIn(_emailController.text,_passwordController.text);
                                  },
                                 textColor: Colors.white,
                                 color: Colors.blue,

                                shape: RoundedRectangleBorder(

                                  borderRadius: BorderRadius.circular(30.0),
                                  side: BorderSide(color: Colors.black87),

                                ),

                                padding: const EdgeInsets.all(10.0),
                                child:
                                const Text('Login', style: TextStyle(fontSize: 20)),

                              ),

                          ),
                          Container(

                              child: Row(

                                children: <Widget>[

                                  Text('Not Registerd ?'),

                                  FlatButton(

                                    textColor: Colors.black87,

                                    child: Text(

                                      'Sign up',

                                      style: TextStyle(fontSize: 20),

                                    ),

                                    onPressed: () {



                                      Navigator.push(context,

                                        MaterialPageRoute(builder: (context) => Help()),

                                      );

                                    },

                                  )

                                ],

                                mainAxisAlignment: MainAxisAlignment.center,

                              ))

                        ],
                      ),
                    ),
                  ])
          ),
        )
    );
  }  void signIn(email,password) async {
    if(email=="admin@gmail.com"&&password=="password"){
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomepageAdmin()));
    }
    if(_keyform.currentState.validate()) {
      _keyform.currentState.save();
      try {
        UserCredential user = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
            email: _emailController.text, password: _passwordController.text);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomepageLogin()));

      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {

          print('No user found for that email.');
          Fluttertoast.showToast(
              msg: "Incorrect username!",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.black54,
              textColor: Colors.white,
              fontSize: 16.0
          );
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
          Fluttertoast.showToast(
              msg: "Incorrect password!",
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
              msg: "You are not registered!",
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
    }


