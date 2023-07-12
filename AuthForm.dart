import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:house_of_services/Pages/Users/UserHomePage.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({Key? key}) : super(key: key);

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final formkey = GlobalKey<FormState>();
  var _email = '';
  var _password = '';
  var _name = '';
  var _phoneNumber = '';
  var _address = '';
  bool isLoginPage = true;

  startAuththentication() {
    final validitiy = formkey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (validitiy) {
      formkey.currentState!.save();
      summitForm(_email, _password, _name, _address, _phoneNumber);
    }
  }

  summitForm(String email, String password, String username, String address,
      String phoneNumber) async {
    final auth = FirebaseAuth.instance;
    UserCredential userCredential;
    try {
      if (isLoginPage) {
        userCredential = await auth.signInWithEmailAndPassword(
            email: email, password: password);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => UserHomePage()));
      } else {
        userCredential = await auth.createUserWithEmailAndPassword(
            email: email, password: password);
        String uid = userCredential.user!.uid;
        await FirebaseFirestore.instance.collection('Users').doc(uid).set({
          'username': username,
          'email': email,
          'address': address,
          'phoneNumber': phoneNumber
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[200],
      appBar: AppBar(
        title: isLoginPage ? Text('Login Page') : Text('Register page'),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 100),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30), topLeft: Radius.circular(30))),
        child: Container(
          padding: EdgeInsets.only(left: 10, right: 10, top: 50),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ListView(
            children: [
              Container(
                child: Form(
                    key: formkey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        if (!isLoginPage)
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            key: ValueKey('username'),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Incorrect username';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _name = value!;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(8.0),
                                  borderSide: new BorderSide()),
                              labelText: "Enter User name",
                            ),
                          ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          key: ValueKey('email'),
                          validator: (value) {
                            if (value!.isEmpty || !value.contains('@')) {
                              return 'Incorrect Email';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _email = value!;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(8.0),
                                borderSide: new BorderSide()),
                            labelText: "Enter Email",
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          obscureText: true,
                          keyboardType: TextInputType.visiblePassword,
                          key: ValueKey('password'),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Incorrect Password';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _password = value!;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(8.0),
                                borderSide: new BorderSide()),
                            labelText: "Enter Password",
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        if (!isLoginPage)
                          TextFormField(
                            keyboardType: TextInputType.phone,
                            key: ValueKey('phone'),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Incorrect phone number';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _phoneNumber = value!;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(8.0),
                                  borderSide: new BorderSide()),
                              labelText: "Enter Phone Number",
                            ),
                          ),
                        SizedBox(
                          height: 20,
                        ),
                        if (!isLoginPage)
                          TextFormField(
                            keyboardType: TextInputType.streetAddress,
                            key: ValueKey('address'),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Incorrect address';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _address = value!;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(8.0),
                                  borderSide: new BorderSide()),
                              labelText: "Enter Address",
                            ),
                          ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 50,
                          width: 500,
                          child: ElevatedButton(
                            onPressed: () {
                              startAuththentication();
                            },
                            child:
                                isLoginPage ? Text('Login') : Text('Register'),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                isLoginPage = !isLoginPage;
                              });
                            },
                            child: isLoginPage
                                ? Text('Not Have an Account')
                                : Text('Already Have An Account'),
                          ),
                        )
                      ],
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
