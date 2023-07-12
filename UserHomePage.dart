import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:house_of_services/Pages/HomePage.dart';
import 'package:house_of_services/Pages/Users/Plumbing_Service.dart';
import 'package:house_of_services/Pages/Users/ProfileInfo.dart';
import 'package:house_of_services/Pages/Users/Services.dart';
import 'package:house_of_services/Pages/Users/member_list/Electrican_List.dart';

class UserHomePage extends StatefulWidget {
  const UserHomePage({Key? key}) : super(key: key);

  @override
  State<UserHomePage> createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  List<String> images = [
    'assets/home_designer.jpg',
    'assets/_painter.jpg',
    'assets/home_plumber.png',
    'assets/home-packers.jpg'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      bottomNavigationBar: Container(
        height: 60,
        decoration: BoxDecoration(
          color: Colors.blue[200],
          borderRadius: BorderRadius.only(),
        ),
        child: Row(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => UserHomePage()));
                },
                icon: Icon(
                  Icons.home,
                  color: Colors.white,
                  size: 25,
                )),
            SizedBox(
              width: 110,
            ),
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ServicesPages()));
                },
                icon: Icon(
                  Icons.miscellaneous_services,
                  color: Colors.white,
                  size: 25,
                )),
            SizedBox(
              width: 100,
            ),
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ProfileInfo()));
                },
                icon: Icon(
                  Icons.account_circle,
                  color: Colors.white,
                  size: 25,
                )),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Check Out Electricain',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ElectricanList()));
              },
              child: Container(
                height: 500,
                width: 500,
                decoration: BoxDecoration(
                  color: Colors.blueGrey[600],
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                      bottomLeft: Radius.circular(30)),
                ),
                child: Center(
                  child: Container(
                    height: 300,
                    width: 300,
                    color: Colors.blue[100],
                    child: Column(
                      children: [
                        Container(
                          child: Image(
                              image: AssetImage('assets/home_electrican.jpg')),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UserHomePage()));
                    },
                    child: Text('Previous Page')),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PlumbingHomePage()));
                    },
                    child: Text('Next  Page')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
