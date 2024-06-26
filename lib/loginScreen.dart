import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradutionfinally/Home.dart';
import 'package:gradutionfinally/Register.dart';

import 'main.dart';

class loginScreen extends StatelessWidget {
  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
  var formkey = GlobalKey<FormState>();

  loginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  'https://raw.githubusercontent.com/Fadysamy55/ppro/main/meme.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: SingleChildScrollView(
                  child: Form(
                    key: formkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 100.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0, 5.0),
                          child: Container(
                            width: 380.0,
                            height: 60.0,

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.white,
                            ),

                            // Add padding around the search bar
                            // Use a Material design search bar
                            child: TextFormField(
                              controller: emailcontroller,
                              keyboardType: TextInputType.emailAddress,
                              onFieldSubmitted: (value) {
                                print(value);
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Email must not to be Empty';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                labelText: 'Email Address',
                                prefixIcon: const Icon(
                                  Icons.email,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0, 5.0),
                          child: Container(
                            width: 380.0,
                            height: 60.0,

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.white,
                            ),

                            // Add padding around the search bar
                            // Use a Material design search bar
                            child: TextFormField(
                              controller: passwordcontroller,
                              obscureText: true,
                              keyboardType: TextInputType.visiblePassword,
                              onFieldSubmitted: (value) {
                                print(value);
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'password must not to be Empty';
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                labelText: ' Password',
                                prefixIcon: Icon(
                                  Icons.lock,
                                ),
                                suffixIcon: Icon(
                                  Icons.remove_red_eye,
                                ),
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 35.0,
                        ),
                        Container(
                          width: double.infinity,
                          color: Colors.black87,
                          child: MaterialButton(
                            onPressed: () async {
                              if (formkey.currentState!.validate()) {
                                print(emailcontroller.text);
                                print(passwordcontroller.text);

                                try {
                              var auth=    await FirebaseAuth.instance
                                      .signInWithEmailAndPassword(
                                          email: emailcontroller.text,
                                          password: passwordcontroller.text);
                                  sharedpref!.setString('uid',auth.user!.uid.toString() );

                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Home()),
                                  );
                                } on FirebaseAuthException catch (e) {
                                  if (e.code == 'invalid-credential') {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content: Text(
                                                'Incorrect login data.')));
                                  }
                                  print(e.code.toString() + 'error app');
                                }
                              }
                            },
                            child: Text(
                              'LOGIN',
                              style: GoogleFonts.oxanium(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Don\'t have an account? ',
                              style: GoogleFonts.oxanium(
                                color: Colors.white,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Register()),
                                );
                              },
                              child: Text(
                                'SIGN UP',
                                style: GoogleFonts.oxanium(
                                  color: Colors.black87,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
