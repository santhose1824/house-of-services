import 'package:flutter/material.dart';

class ElectricanBookingDetials extends StatefulWidget {
  const ElectricanBookingDetials({Key? key}) : super(key: key);

  @override
  State<ElectricanBookingDetials> createState() =>
      _ElectricanBookingDetialsState();
}

class _ElectricanBookingDetialsState extends State<ElectricanBookingDetials> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Booking Detials"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.only(top: 30),
                height: 400,
                width: 500,
                decoration: BoxDecoration(
                  color: Colors.blueGrey[600],
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                      bottomLeft: Radius.circular(30)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      height: 100,
                      width: 100,
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/profile.jpg'),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Name:Santhose',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Email:santhose@gmail.com',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Phone:6382158828',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Address:285,Jawaharlal Nehru Road Sivakasi',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
