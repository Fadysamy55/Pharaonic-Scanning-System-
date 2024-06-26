import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradutionfinally/Home.dart';
import 'package:gradutionfinally/loginScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gradutionfinally/main.dart';

class Register extends StatefulWidget {
  Register({super.key});

  @override
  State<Register> createState() {
    return RegisterState();
  }

}
class RegisterState extends State<Register>{

  var firstname = TextEditingController();
  var lastname = TextEditingController();
  var emailAddress = TextEditingController();
  var passwordcontroller = TextEditingController();
  var confirmpassword = TextEditingController();
  var formkey = GlobalKey<FormState>();
  bool showPassword =true;


  Future<void> saveUserInfo(String uid) async {

    await FirebaseFirestore.instance.collection('users').doc(uid).set({
      'email': emailAddress.text,
      'f_name': firstname.text,
      'l_name': lastname.text,
      'password':passwordcontroller.text
    });
    sharedpref!.setString('uid', uid);
  }

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
                          height: 180.0,
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
                            child: TextFormField(
                              controller: firstname,
                              keyboardType: TextInputType.text,
                              onFieldSubmitted: (value) {
                                print(value);
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return ' please! Enter your First name ';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                labelText: 'First Name',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5.0,
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
                            child: TextFormField(
                              controller: lastname,
                              keyboardType: TextInputType.text,
                              onFieldSubmitted: (value) {
                                print(value);
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please! Enter your Last name';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                labelText: 'Last Name',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5.0,
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
                            child: TextFormField(
                              controller: emailAddress,
                              keyboardType: TextInputType.emailAddress,
                              onFieldSubmitted: (value) {
                                print(value);
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Email must not be Empty';
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
                          height: 5.0,
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
                            child: TextFormField(
                              controller: passwordcontroller,
                              obscureText: showPassword,
                              keyboardType: TextInputType.visiblePassword,
                              onFieldSubmitted: (value) {
                                print(value);
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'password must not be Empty';
                                }
                                return null;
                              },
                              decoration:  InputDecoration(
                                labelText: 'Password',
                                prefixIcon: Icon(
                                  Icons.lock,
                                ),
                                suffixIcon: IconButton(
                                   onPressed: () {

                                    showPassword ? showPassword =false: showPassword =true;
                                     setState(() {

                                     });

                                   }, icon:Icon(Icons.remove_red_eye),
                                ),
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5.0,
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
                              controller: confirmpassword,
                              obscureText: true,
                              keyboardType: TextInputType.visiblePassword,
                              onFieldSubmitted: (value) {
                                print(value);
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'password must be matched';
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                labelText: ' Confirm password',
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
                          height: 10.0,
                        ),
                        Container(
                          width: double.infinity,
                          color: Colors.black87,
                          child: MaterialButton(
                            onPressed: () async {
                              if (formkey.currentState!.validate()) {
                                try {

                                  final credential = await FirebaseAuth
                                      .instance
                                      .createUserWithEmailAndPassword(
                                    email: emailAddress.text,
                                    password: passwordcontroller.text,
                                  );
                                  await saveUserInfo(credential.user!.uid);
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) => Home()),
                                  );
                                } on FirebaseAuthException catch (e) {
                                  print(e.code.toString()+'error app');

                                  if (e.code == 'weak-password') {
                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('The password provided is too weak.')));

                                    print(
                                        'The password provided is too weak.');
                                  } else if (e.code ==
                                      'email-already-in-use') {
                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('The account already exists for that email.')));
                                    print(
                                        'The account already exists for that email.');
                                  }
                                } catch (e) {
                                  print(e.toString());
                                }
                              }
                            },
                            child: Text(
                              'SIGN UP',
                              style: GoogleFonts.oxanium(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Already have an account?',
                              style: GoogleFonts.oxanium(
                                color: Colors.white,
                              ),
                            ),
                            TextButton(

                              onPressed:() {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => loginScreen()),
                                );
                              },
                              child: Text(
                                'LOGIN',
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
