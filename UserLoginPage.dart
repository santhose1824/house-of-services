import 'package:flutter/material.dart';
import 'package:house_of_services/Pages/Users/auth/AuthForm.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: AuthForm(),
    ));
  }
}
