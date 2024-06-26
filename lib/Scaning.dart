import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradutionfinally/Favourite.dart';
import 'package:gradutionfinally/History.dart';
import 'package:gradutionfinally/Home.dart';
import 'package:gradutionfinally/Profile.dart';
import 'package:gradutionfinally/Satrted.dart';
import 'package:gradutionfinally/Testing.dart';
import 'package:gradutionfinally/search.dart';
class Scaning extends StatelessWidget {
  const Scaning({super.key});
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
                    MaterialPageRoute(builder: (context) =>favourite()),
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
                    MaterialPageRoute(builder: (context) => Started()),
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
                'https://raw.githubusercontent.com/Fadysamy55/ppro/main/Back%20ground.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Expanded(
            child: Column(children: [
              const SizedBox(
                height: 80.0,
              ),
              const CircleAvatar(
                backgroundColor: Colors.white,
                radius: 90.0,
                backgroundImage: NetworkImage(
                  'https://raw.githubusercontent.com/Fadysamy55/ppro/main/Screenshot%202023-12-19%20215802.png',
                ),
              ),
              const SizedBox(
                height: 90,
              ),
              Container(
                width: 370.0,
                height: 50.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.black,
                ),
                child: MaterialButton(
                  onPressed: () {
                  },
                  child: Text(
                    'From Gallery',
                    style: GoogleFonts.oxanium(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
SizedBox(height: 30.0,),
              Container(
                width: 370.0,
                height: 50.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.black,
                ),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Testing()

                    ),
                    );
                  },
                  child: Text(
                    'Scan here',
                    style: GoogleFonts.oxanium(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 160.0,
              ),
              Container(
                width:380.0 ,
                height: 75.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white ,
                ),
                padding: EdgeInsets.fromLTRB(0.0, 5.0, 0, 5.0),

                child:
                AppBar(
                  backgroundColor:  Colors.white ,
                  elevation: 0.0,



                  title: Row(
                    children: [



                    ],
                  ),
                  actions: [
                    SizedBox(width: 20,),


                    Column(

                      children: [
                        IconButton(
                          icon:

                          CircleAvatar(

                            radius: 16.0,
                            backgroundImage: NetworkImage('https://raw.githubusercontent.com/Fadysamy55/ppro/main/Screenshot%202023-12-15%20174646.png'),

                          ),

                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>  Home()),
                            );
                          },
                        ),
                        Text('Home'
                          ,style: TextStyle(
                            fontSize: 5.0,

                            fontWeight: FontWeight.bold,
                            color:  Color.fromARGB(255, 218 , 165, 32),
                          ),
                        ),
                      ],
                    ),



                    SizedBox(width: 35,),
                    Column(

                      children: [
                        IconButton(
                          icon:

                          CircleAvatar(

                            radius: 16.0,
                            backgroundImage: NetworkImage('https://raw.githubusercontent.com/Fadysamy55/ppro/main/Screenshot%202023-12-19%20215829.png'),

                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>  Search()),
                            );
                          },
                        ),
                        Text('Search'
                          ,style: TextStyle(
                            fontSize: 5.0,

                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 35,),

                    Column(

                      children: [
                        IconButton(
                          icon:

                          CircleAvatar(

                            radius: 16.0,
                            backgroundImage: NetworkImage('https://raw.githubusercontent.com/Fadysamy55/ppro/main/Screenshot%202023-12-19%20215802.png'),

                          ),

                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>  Scaning()),
                            );
                          },
                        ),
                        Text('Scan Here'
                          ,style: TextStyle(
                            fontSize: 5.0,

                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 35,),

                    Column(

                      children: [
                        IconButton(
                          icon:

                          CircleAvatar(

                            radius: 16.0,
                            backgroundImage: NetworkImage('https://raw.githubusercontent.com/Fadysamy55/ppro/main/Screenshot%202023-12-19%20203448.png'),

                          ),

                          onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>  ProfilePage()),
                            );


                          },
                        ),
                        Text('Profile'
                          ,style: TextStyle(
                            fontSize: 5.0,

                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 20,),



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
