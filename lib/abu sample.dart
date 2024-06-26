import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradutionfinally/Favourite.dart';
import 'package:gradutionfinally/search.dart';

import 'History.dart';
import 'Home.dart';
import 'Profile.dart';
import 'Satrted.dart';
import 'Scaning.dart';


class abusample extends StatelessWidget {
   abusample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "Pharaonic Scaning",
            style: GoogleFonts.oxanium(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,

            ),
          ),
          centerTitle: true,
          actions: [
            PopupMenuButton(
              // add icon, by default "3 dot" icon
              // icon: Icon(Icons.book)
                itemBuilder: (context) {
                  return [
                    const PopupMenuItem<int>(
                      value: 0,
                      child: Text("Favourite page"),
                    ),
                    const PopupMenuItem<int>(
                      value: 1,
                      child: Text("History page"),
                    ),
                    const PopupMenuItem<int>(
                      value: 2,
                      child: Text("Logout"),
                    ),
                  ];
                }, onSelected: (value) {
              if (value == 0) {
                {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => favourite()),
                  );
                }
              } else if (value == 1) {
                {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => History()),
                  );
                }
              } else if (value == 2) {
                {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  Started()),
                  );
                }
              }
            }),
          ],
          backgroundColor: Colors.transparent,
          elevation: 0.0),
      extendBodyBehindAppBar: true,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                'https://raw.githubusercontent.com/ardenahany/graduation/main/images/img2.PNG'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Expanded(
            child: Column(children: [
              const SizedBox(
                height: 150.0,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Pyramids",
                  style: GoogleFonts.oxanium(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 50.0,
              ),
              Text(
                "The Egyptian pyramids are ancient masonry structures located in Egypt. Sources cite at least 118 identified 'Egyptian' pyramids. Approximately 80 pyramids were built within the Kingdom of Kush, now located in the modern country of Sudan. Of those located in modern Egypt, most were built as tombs for the country's pharaohs and their consorts during the Old and Middle Kingdom periods.",
                style: GoogleFonts.oxanium(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 230.0,
              ),
              Container(
                width: 380.0,
                height: 75.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white,
                ),
                padding: EdgeInsets.fromLTRB(0.0, 5.0, 0, 5.0),
                child: AppBar(
                  backgroundColor: Colors.white,
                  elevation: 0.0,
                  title: Row(
                    children: [],
                  ),
                  actions: [
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      children: [
                        IconButton(
                          icon: CircleAvatar(
                            radius: 16.0,
                            backgroundImage: NetworkImage(
                                'https://raw.githubusercontent.com/Fadysamy55/ppro/main/Screenshot%202023-12-15%20174646.png'),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Home()),
                            );
                          },
                        ),
                        Text(
                          'Home',
                          style: TextStyle(
                            fontSize: 5.0,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 218, 165, 32),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 35,
                    ),
                    Column(
                      children: [
                        IconButton(
                          icon: CircleAvatar(
                            radius: 16.0,
                            backgroundImage: NetworkImage(
                                'https://raw.githubusercontent.com/Fadysamy55/ppro/main/Screenshot%202023-12-19%20215829.png'),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Search()),
                            );
                          },
                        ),
                        Text(
                          'Search',
                          style: TextStyle(
                            fontSize: 5.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 35,
                    ),
                    Column(
                      children: [
                        IconButton(
                          icon: CircleAvatar(
                            radius: 16.0,
                            backgroundImage: NetworkImage(
                                'https://raw.githubusercontent.com/Fadysamy55/ppro/main/Screenshot%202023-12-19%20215802.png'),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Scaning()),
                            );
                          },
                        ),
                        Text(
                          'Scan Here',
                          style: TextStyle(
                            fontSize: 5.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 35,
                    ),
                    Column(
                      children: [
                        IconButton(
                          icon: CircleAvatar(
                            radius: 16.0,
                            backgroundImage: NetworkImage(
                                'https://raw.githubusercontent.com/Fadysamy55/ppro/main/Screenshot%202023-12-19%20203448.png'),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProfilePage()),
                            );
                          },
                        ),
                        Text(
                          'Profile',
                          style: TextStyle(
                            fontSize: 5.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ),

            ]),
          ),
        ),
      ),
    );
  }
}
