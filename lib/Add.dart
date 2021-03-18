import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app/Files.dart';
import 'package:fluttertoast/fluttertoast.dart';
class Add extends StatefulWidget {
  @override
  _AddState createState() => _AddState();

}
class _AddState extends State<Add> {
  TextEditingController data1=TextEditingController();
  TextEditingController data2=TextEditingController();
  TextEditingController data3=TextEditingController();
  TextEditingController data4=TextEditingController();
  TextEditingController data5=TextEditingController();
  TextEditingController data6=TextEditingController();
  TextEditingController data7=TextEditingController();
  TextEditingController data8=TextEditingController();
  TextEditingController data9=TextEditingController();
  TextEditingController data10=TextEditingController();
  TextEditingController data11=TextEditingController();
  TextEditingController data12=TextEditingController();
  TextEditingController data13=TextEditingController();
  final _formKey = GlobalKey<FormState>();
  void submit(){
    final isValid = _formKey.currentState.validate();
    if(isValid) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Files()));
    }
    else{
      Fluttertoast.showToast(
          msg: "You Registration is Not Successful!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black54,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
    _formKey.currentState.save();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Application Form'),
        backgroundColor: Colors.deepPurple,
      ),

      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/pic9.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: Form(
            key:_formKey,
            child:ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Column(
                        children: [
                          SizedBox(height: 30),
                          TextFormField(
                            controller: data1,
                            decoration: const InputDecoration(
                              icon: const Icon(Icons.person),
                              hintText: 'Enter your FirstName',
                              labelText: 'FirstName',
                            ),
                            validator: (value){
                              if(value.isEmpty) {
                                return "Please enter some text";
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            controller: data2,
                            decoration: const InputDecoration(
                              icon: const Icon(Icons.person),
                              hintText: 'Enter your LastName',
                              labelText: 'Surname',
                            ),
                            validator: (value){
                              if(value.isEmpty) {
                                return "Please enter some text";
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            controller: data3,
                            decoration: const InputDecoration(
                              icon: const Icon(Icons.phone),
                              hintText: 'Enter a phone number',
                              labelText: 'Mobile',
                            ),
                            validator: (value){
                              if(value.isEmpty) {
                                return "Please enter valid phone number";
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            controller: data4,
                            decoration: const InputDecoration(
                              icon: const Icon(Icons.calendar_today),
                              hintText: 'Enter your date of birth',
                              labelText: 'Dob',
                            ),
                            validator: (value){
                              if(value.isEmpty) {
                                return "Please enter valid dob";
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            controller: data5,
                            decoration: const InputDecoration(
                              icon: const Icon(Icons.place),
                              hintText: 'enter your state',
                              labelText: 'State',
                            ),
                            validator: (value){
                              if(value.isEmpty) {
                                return "Please enter valid dob";
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            controller: data6,
                            decoration: const InputDecoration(
                              icon: const Icon(Icons.place),
                              hintText: 'Enter your permanent address',
                              labelText: 'Address',
                            ),
                            validator: (value){
                              if(value.isEmpty) {
                                return "Please enter your address";
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            controller: data7,
                            decoration: const InputDecoration(
                              icon: const Icon(Icons.cast_for_education),
                              hintText: 'Enter your highest degree',
                              labelText: 'Qualification',
                            ),
                            validator: (value){
                              if(value.isEmpty) {
                                return "Please enter Qualification";
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            controller: data8,
                            decoration: const InputDecoration(
                              icon: const Icon(Icons.drive_file_rename_outline),
                              hintText: 'Enter your college/university name',
                              labelText: 'Name of the Institution',
                            ),
                            validator: (value){
                              if(value.isEmpty) {
                                return "Please enter your college name";
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            controller: data9,
                            decoration: const InputDecoration(
                              icon: const Icon(Icons.language_sharp),
                              hintText: 'Enter the languages you know',
                              labelText: 'Languages known',
                            ),
                            validator: (value){
                              if(value.isEmpty) {
                                return "Please enter some languages";
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            controller: data10,
                            decoration: const InputDecoration(
                              icon: const Icon(Icons.category_outlined),
                              hintText: 'Enter your caste',
                              labelText: 'Category',
                            ),
                            validator: (value){
                              if(value.isEmpty) {
                                return "Please enter your category";
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            controller: data11,
                            decoration: const InputDecoration(
                              icon: const Icon(Icons.person_pin_circle_outlined),
                              hintText: 'Enter your Gender',
                              labelText: 'Gender',
                            ),
                            validator: (value){
                              if(value.isEmpty) {
                                return "Please enter your gender";
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            controller: data12,
                            decoration: const InputDecoration(
                              icon: const Icon(Icons.event_note_outlined),
                              hintText: 'Programmes of NYKS,NSS,NCC, you have participated',
                              labelText: 'Name of the event',
                            ),
                            validator: (value){
                              if(value.isEmpty) {
                                return "Please enter name of event";
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 30),
                          Text(
                            'I Declare that particulars furnised in this application are true,complete and correct to the best of my knowledge and belief',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextFormField(
                            controller: data13,
                            decoration: const InputDecoration(
                              icon: const Icon(Icons.assignment_ind_outlined),
                              hintText: 'Declaration',
                              labelText: 'I Agree/Disagree',
                            ),
                            validator: (value){
                              if(value.isEmpty) {
                                return "Please enter yes/no";
                              }
                              return null;
                            },
                          ),
                          FlatButton(
                            child: Text('Continue',style:TextStyle(fontSize:20.0)),
                            color:Colors.deepPurple,
                            onPressed: () {

                                Map <String, dynamic> data = {
                                  "field1": data1.text,
                                  "field2": data2.text,
                                  "field3": data3.text,
                                  "field4": data4.text,
                                  "field5": data5.text,
                                  "field6": data6.text,
                                  "field7": data7.text,
                                  "field8": data8.text,
                                  "field9": data9.text,
                                  "field10": data10.text,
                                  "field11": data11.text,
                                  "field12": data12.text,
                                  "field13": data13.text
                                };
                                String uid=FirebaseAuth.instance.currentUser.uid.toString();
                                FirebaseFirestore.instance.collection("test").doc(uid).set(data);
                             return submit();
                            },
                            textColor: Colors.white,
                          ),
                        ]
                    ),
                  ),
                ]
            ),),
        ),
      ),
    );
  }
}