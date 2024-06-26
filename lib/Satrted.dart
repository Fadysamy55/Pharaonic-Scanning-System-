import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradutionfinally/Register.dart';
import 'package:gradutionfinally/loginScreen.dart';
class Started extends StatelessWidget {
  const Started({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://raw.githubusercontent.com/Fadysamy55/project/main/1.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
                child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Center(
                      child: SingleChildScrollView(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 300.0,
                                    ),
                                    Text(
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      'Pharonic  Scanning',
                                      style: GoogleFonts.oxanium(
                                        fontSize: 34.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      'Discover the land of the Pharaohs and explore ancent wonders.',
                                      style: GoogleFonts.oxanium(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10.0,
                                    ),
                                    const SizedBox(
                                      height: 15.0,
                                    ),
                                    Container(
                                      width: double.infinity,
                                      color: const Color.fromARGB(255, 218, 165, 32),
                                      child: MaterialButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Register()),
                                          );
                                        },
                                        child: Text(
                                          'Get Started',
                                          style: GoogleFonts.oxanium(
                                            fontSize: 25.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10.0,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Already have an account? ',
                                          style: GoogleFonts.oxanium(
                                            color: Colors.white,
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      loginScreen()),
                                            );
                                          },
                                          child: Text(
                                            'Login',
                                            style: GoogleFonts.oxanium(
                                              color: const Color.fromARGB(
                                                  255, 218, 165, 32),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ])
                            ]),
                      ),
                    )))));
  }
}
