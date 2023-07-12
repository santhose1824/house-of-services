import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DesignerValidate extends StatefulWidget {
  const DesignerValidate({Key? key}) : super(key: key);

  @override
  State<DesignerValidate> createState() => _DesignerValidateState();
}

class _DesignerValidateState extends State<DesignerValidate> {
  final CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('DesignerValidate');
  final CollectionReference collection =
      FirebaseFirestore.instance.collection('Designer');
  void addData(
      String username, String email, String phone, String address) async {
    collection.doc().set({
      'username': username,
      'email': email,
      'phone': phone,
      'address': address
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Designers Register'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: collectionReference.snapshots(),
        builder: (BuildContext, AsyncSnapshot<QuerySnapshot> snapshot) {
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, int index) {
              final document = snapshot.data!.docs[index];
              final username = document['username'];
              final email = document['email'];
              final phone = document['phone'];
              final address = document['address'];
              return Container(
                margin: EdgeInsets.all(20),
                color: Colors.blue[100],
                child: ListTile(
                  title: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Name                 : ' + document['username']),
                      SizedBox(
                        height: 10,
                      ),
                      Text('Email id             : ' + document['email']),
                      SizedBox(
                        height: 10,
                      ),
                      Text('Phone Number : ' + document['phone']),
                      SizedBox(
                        height: 10,
                      ),
                      Text('Address             : ' + document['address']),
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: ElevatedButton(
                            onPressed: () async {
                              addData(username, email, phone, address);
                            },
                            child: Text('Confrim')),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
