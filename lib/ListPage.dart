import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  TextEditingController _searchController = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List of Candidates', style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold,fontFamily: "Open Sans", color: Colors.white),),
        backgroundColor: Colors.deepPurple,
      ),

     body:
     Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/pic9.png"),
                fit: BoxFit.fill,
              ),
        ),
             child: new StreamBuilder(
              stream: FirebaseFirestore.instance.collection("test").snapshots(),
              builder: (context, snapshot) {
                return !snapshot.hasData?Center(
                  child: CircularProgressIndicator(),
             )
                : ListView.builder(
                 itemCount: snapshot.data.docs.length,
                 // ignore: missing_return
                 itemBuilder: (context, index) {

                    return ListTile(
                      title: Row(
                        children:[
                       new Text(snapshot.data.docs[index].data()['field1'], style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.normal, color: Colors.black),),
                          new Text(":"),
                          new Text(snapshot.data.docs[index].data()['field5'], style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.normal, color: Colors.black),),
                      ]) );
              },

            );

          },
        ),
      ),
    );
  }


}
