import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:house_of_services/Pages/Users/Reviews/DesignerReviewPage.dart';
import 'package:house_of_services/Pages/Users/Reviews/ElectricanReivewPage.dart';
import 'package:house_of_services/Pages/Users/Reviews/PcakerReviewPage.dart';
import 'package:house_of_services/Pages/Users/Reviews/ReadDesignerReview.dart';
import 'package:house_of_services/Pages/Users/Reviews/ReadElectricanReiview.dart';

import '../Reviews/ReadPainterReview.dart';

class PainterList extends StatefulWidget {
  const PainterList({Key? key}) : super(key: key);

  @override
  State<PainterList> createState() => _PainterListState();
}

class _PainterListState extends State<PainterList> {
  final user = FirebaseAuth.instance.currentUser;
  final CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('Painter');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Painters'),
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: collectionReference.snapshots(),
          builder: (BuildContext, AsyncSnapshot<QuerySnapshot> snapshot) {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, int index) {
                final document = snapshot.data!.docs[index];
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
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.push(
                                      BuildContext,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ReadPainterReview()));
                                },
                                icon: Icon(Icons.comment)),
                            SizedBox(
                              width: 60,
                            ),
                            Center(
                              child: ElevatedButton(
                                  onPressed: () {
                                    book(
                                      String Name,
                                      String Email,
                                      String Address,
                                      String Phone,
                                    ) {
                                      FirebaseFirestore.instance
                                          .collection(document['email'])
                                          .doc()
                                          .set({
                                        'username': Name,
                                        'email': Email,
                                        'address': Address,
                                        'phone': Phone,
                                      });
                                    }

                                    void booking() async {
                                      final userData = await FirebaseFirestore
                                          .instance
                                          .collection('Users')
                                          .doc(user!.uid)
                                          .get();
                                      final data = userData.data();
                                      final name = data!['username'];
                                      final email = data!['email'];
                                      final address = data!['address'];
                                      final phone = data!['phoneNumber'];
                                      book(
                                        name,
                                        email,
                                        address,
                                        phone,
                                      );
                                    }

                                    booking();
                                  },
                                  child: Text('Book Now')),
                            ),
                            SizedBox(
                              width: 65,
                            ),
                            IconButton(
                                onPressed: () {
                                  Navigator.push(
                                      BuildContext,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              PackerReiviewPage()));
                                },
                                icon: Icon(Icons.mode_edit)),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ));
  }
}
