import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:house_of_services/Pages/HomePage.dart';
import 'package:house_of_services/Pages/Users/Designer.dart';
import 'package:house_of_services/Pages/Users/PAcker.dart';
import 'package:house_of_services/Pages/Users/ProfileInfo.dart';
import 'package:house_of_services/Pages/Users/Services.dart';
import 'package:house_of_services/Pages/Users/UserHomePage.dart';
import 'package:house_of_services/Pages/Users/member_list/Painters_List.dart';

class PainterHomePage extends StatefulWidget {
  const PainterHomePage({Key? key}) : super(key: key);

  @override
  State<PainterHomePage> createState() => _PainterHomePageState();
}

class _PainterHomePageState extends State<PainterHomePage> {
  List<String> images = ['assets/home-packers.jpg'];
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PainterHomePage()));
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
              'Check Out Painter',
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
                    MaterialPageRoute(builder: (context) => PainterList()));
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
                              image: AssetImage('assets/home_painter.jpg')),
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
                              builder: (context) => DesignerHomePage()));
                    },
                    child: Text('Previous Page')),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PackerHomePage()));
                    },
                    child: Text('Next  Page')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
