import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class ReadReview extends StatefulWidget {
  const ReadReview({Key? key}) : super(key: key);

  @override
  State<ReadReview> createState() => _ReadReviewState();
}

class _ReadReviewState extends State<ReadReview> {
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('ElectricanReview');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Comments'),
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
                        Text('Email                : ' + document['username']),
                        SizedBox(
                          height: 10,
                        ),
                        Text('Comment         :  ' + document['review'])
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
