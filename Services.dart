import 'package:flutter/material.dart';

class ServicesPages extends StatefulWidget {
  const ServicesPages({Key? key}) : super(key: key);

  @override
  State<ServicesPages> createState() => _ServicesPagesState();
}

class _ServicesPagesState extends State<ServicesPages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upcomming Services'),
      ),
      body: Center(
        child: Container(
          height: 900,
          width: 600,
          child: ListView(children: [
            Center(
              child: Text(
                'These are others services We are going to added Stay Tuned...',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Card(
              child: Column(
                children: [
                  Container(
                      child: Image(image: AssetImage('assets/taxi.jpeg'))),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      child: Image(image: AssetImage('assets/civil.jpeg'))),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      child: Image(image: AssetImage('assets/carpenter.jpeg'))),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      child: Image(image: AssetImage('assets/housemaid.jpeg')))
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
