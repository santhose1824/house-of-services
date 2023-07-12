import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:house_of_services/Pages/ServiceMan/Packers_notifications/Packers_Profile_info.dart';
import 'package:house_of_services/Pages/ServiceMan/electrician_notifications/Booking_Detials.dart';

class List_of_packers_notifications extends StatefulWidget {
  const List_of_packers_notifications({Key? key}) : super(key: key);

  @override
  State<List_of_packers_notifications> createState() =>
      _List_of_packers_notificationsState();
}

class _List_of_packers_notificationsState
    extends State<List_of_packers_notifications> {
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
