import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'login.dart';

class Signup extends StatefulWidget {
  static const String id = 'Signup';
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Expanded(
            child: Form(
              key: _formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Title(
                      color: Colors.black,
                      child: const Text(
                        'Sign up',
                        style: TextStyle(
                          fontSize: 50,
                          fontFamily: 'eb',
                        ),
                      )),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 60),
                    child: SizedBox(
                      height: 80,
                      child: TextFormField(
                        textAlign: TextAlign.start,
                        style: const TextStyle(fontFamily: 'rs'),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter Name';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            hintText: 'Username',
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.black),
                                borderRadius: BorderRadius.circular(20)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 60),
                    child: SizedBox(
                      height: 80,
                      child: TextFormField(
                        textAlign: TextAlign.start,
                        style: const TextStyle(fontFamily: 'rs'),
                        keyboardType: TextInputType.emailAddress,
                        controller: email,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter Email Address';
                          }
                          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                              .hasMatch(value)) {
                            return 'Please a valid Email';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            hintText: 'Email Address',
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.black),
                                borderRadius: BorderRadius.circular(20)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 60),
                    child: SizedBox(
                      height: 80,
                      child: TextFormField(
                        textAlign: TextAlign.start,
                        keyboardType: TextInputType.visiblePassword,
                        style: const TextStyle(fontFamily: 'rs'),
                        controller: password,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please a Enter Password';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.black),
                                borderRadius: BorderRadius.circular(20)),
                            hintText: 'Password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            )),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 60),
                    child: SizedBox(
                      height: 80,
                      child: TextFormField(
                        textAlign: TextAlign.start,
                        style: const TextStyle(fontFamily: 'rs'),
                        keyboardType: TextInputType.visiblePassword,
                        controller: confirmpassword,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please re-enter password';
                          }
                          if (password.text != confirmpassword.text) {
                            return "Password does not match";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.black),
                                borderRadius: BorderRadius.circular(20)),
                            hintText: 'Confirm Password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            )),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 60),
                      child: Material(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        child: MaterialButton(
                          onPressed: () {
                            {
                              if (_formkey.currentState!.validate()) {
                                FirebaseAuth.instance
                                    .createUserWithEmailAndPassword(
                                        email: email.text,
                                        password: password.text)
                                    .then((value) {
                                  Navigator.pushNamed(context, Login.id);
                                });
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content: Text(
                                    'Registered Successfully.',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  duration: Duration(seconds: 5),
                                  backgroundColor: Colors.black,
                                ));
                              } else {}
                            }
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: const BorderSide(color: Colors.black)),
                          height: 60,
                          minWidth: double.infinity,
                          child: const Text('Sign up',
                              style: TextStyle(fontFamily: 'rs', fontSize: 17)),
                        ),
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text('------------- OR -------------',
                      style: TextStyle(fontFamily: 'rs')),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text("Have an account?",
                          style: TextStyle(fontFamily: 'rs', fontSize: 15)),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Login.id);
                        },
                        child: const Text(
                          'Log in.',
                          style: TextStyle(
                              fontFamily: 'rs',
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
