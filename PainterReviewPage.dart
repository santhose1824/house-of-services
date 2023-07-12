import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PainterReiviewPage extends StatefulWidget {
  const PainterReiviewPage({Key? key}) : super(key: key);

  @override
  State<PainterReiviewPage> createState() => _PainterReiviewPageState();
}

class _PainterReiviewPageState extends State<PainterReiviewPage> {
  final user = FirebaseAuth.instance.currentUser;
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('PainterReview');
  final reviewController = TextEditingController();
  void reiview(String eID, String reivew, String? username) async {
    collectionReference
        .doc()
        .set({'eID': eID, 'review': reivew, 'username': username});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Reiview')),
      body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                child: TextField(
                  controller: reviewController,
                  decoration: InputDecoration(
                      labelText: "Enter the your comment",
                      border: OutlineInputBorder()),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () async {
                        final userID = await FirebaseFirestore.instance
                            .collection('Painter')
                            .get();
                        final id = userID.docs.first;
                        final eID = id.id;

                        reiview(eID, reviewController.text, user!.email);
                      },
                      child: Text('Add ')))
            ],
          )),
    );
  }
}
