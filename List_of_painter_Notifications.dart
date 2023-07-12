import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:house_of_services/Pages/ServiceMan/electrician_notifications/Booking_Detials.dart';
import 'package:house_of_services/Pages/ServiceMan/painters_list_notifications/Painters_info.dart';

class List_of_Painters_Notifications extends StatefulWidget {
  const List_of_Painters_Notifications({Key? key}) : super(key: key);

  @override
  State<List_of_Painters_Notifications> createState() =>
      _List_of_Painters_NotificationsState();
}

class _List_of_Painters_NotificationsState
    extends State<List_of_Painters_Notifications> {
  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Notifications'),
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection(user!.email.toString())
              .snapshots(),
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
