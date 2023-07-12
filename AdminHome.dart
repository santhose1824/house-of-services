import 'package:flutter/material.dart';
import 'package:house_of_services/Pages/Admin/Designer.dart';
import 'package:house_of_services/Pages/Admin/Electrican.dart';
import 'package:house_of_services/Pages/Admin/Packers.dart';
import 'package:house_of_services/Pages/Admin/Painters.dart';
import 'package:house_of_services/Pages/Admin/Plumber.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AdminPage'),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ElectricanValidate()));
                  },
                  child: Text('Electrican Validate')),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DesignerValidate()));
                  },
                  child: Text('Interior Designer Validate')),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PackersValidate()));
                  },
                  child: Text('Packers Validate')),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PlumberValidate()));
                  },
                  child: Text('Plumber Validate')),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PainterValidate()));
                  },
                  child: Text('Painters Validate')),
            ],
          ),
        ),
      ),
    );
  }
}
