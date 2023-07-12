import 'package:flutter/material.dart';
import 'package:house_of_services/Pages/ServiceMan/auth/Service_AuthForm.dart';
import 'package:house_of_services/Pages/Users/auth/AuthForm.dart';

class Service_UserPage extends StatefulWidget {
  const Service_UserPage({Key? key}) : super(key: key);

  @override
  State<Service_UserPage> createState() => _Service_UserPageState();
}

class _Service_UserPageState extends State<Service_UserPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Service_AuthForm(),
    ));
  }
}
