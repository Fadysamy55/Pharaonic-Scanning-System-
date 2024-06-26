import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradutionfinally/History.dart.';
import 'package:gradutionfinally/Home.dart';
import 'package:gradutionfinally/Models/PostsModel.dart';
import 'package:gradutionfinally/Profile.dart';
import 'package:gradutionfinally/Pyramids.dart';
import 'package:gradutionfinally/Satrted.dart';
import 'package:gradutionfinally/Scaning.dart';
import 'package:gradutionfinally/Temple.dart';
import 'package:gradutionfinally/abu%20sample.dart';
import 'package:gradutionfinally/search.dart';
import 'package:image_card/image_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'Models/PostsModel.dart';
import 'main.dart';

class favourite extends StatefulWidget {
  favourite({super.key});

  @override
  State<favourite> createState() {
    return favouriteState();
  }
}

class favouriteState extends State<favourite> {
  final TextEditingController _searchController = TextEditingController();
  List<PostsModel> favouritesModel = [];
  var _firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    getFavourites();
  }

  getFavourites() async {
    try {
      QuerySnapshot querySnapshot = await _firestore.collection('places').get();

      if (querySnapshot.docs.isNotEmpty) {
        for (int i = 0; i < querySnapshot.docs.length; i++) {
          QuerySnapshot querySnapshotFav = await FirebaseFirestore.instance
              .collection('fav')
              .where('user_id', isEqualTo: sharedpref!.getString('uid'))
              .where('post_id', isEqualTo: querySnapshot.docs[i].id!)
              .get();
          if (querySnapshotFav.size > 0) {
            favouritesModel.add(PostsModel(
                id: querySnapshot.docs[i].id,
                name: querySnapshot.docs[i]['country'],
                imgPath: querySnapshot.docs[i]['image'],
                title: querySnapshot.docs[i]['title'],
                isFav: true,description:  querySnapshot.docs[i]['description']));

            print('dataa' + querySnapshot.docs[i]['country']);
          }
        }
        setState(() {});
      }
    } catch (e) {
      print('error_' + e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Pharaonic Scanning",
              style: GoogleFonts.oxanium(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              )),
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
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 20.0,
                ),
                Center(
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 100.0,
                      ),
                      const Icon(
                        Icons.favorite_outline,
                        size: 30.0,
                        color: Colors.white,
                      ),
                      const SizedBox(
                          width:
                              10.0), // Add some spacing between icon and text
                      Text(
                        "favorites",
                        style: GoogleFonts.oxanium(
                          fontSize: 35.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                Expanded(
                  child: GridView.builder(
                    scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      itemCount: favouritesModel.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 10),
                      itemBuilder: (context, index) {
                        return
                          FillImageCard(
                            width: 270,
                            heightImage: 100,
                            color: Colors.white70,
                            imageProvider:  NetworkImage(
                                favouritesModel[index].imgPath!),
                            description: Container(
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          favouritesModel[index].name!,
                                          textDirection: TextDirection.ltr,
                                          style: TextStyle(
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black54,
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          favouritesModel[index].title!,
                                          textDirection: TextDirection.ltr,
                                          style: TextStyle(
                                            fontSize: 10.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  IconButton(
                                    color: Colors.black,
                                    icon:  favouritesModel[index].isFav! ? Icon(Icons.favorite,color: Colors.red,): Icon(Icons.favorite_outline_outlined),
                                    onPressed: () async {
                                      if(!favouritesModel[index].isFav!){
                                        favouritesModel[index].isFav = true;
                                        await FirebaseFirestore.instance
                                            .collection('fav')
                                            .doc()
                                            .set({
                                          'post_id': favouritesModel[index].id!,
                                          'user_id': sharedpref!.getString('uid'),

                                        });
                                      }else{
                                        favouritesModel[index].isFav = false;
                                        QuerySnapshot querySnapshot = await FirebaseFirestore.instance
                                            .collection('fav')
                                            .where('user_id', isEqualTo: sharedpref!.getString('uid')).
                                        where('post_id',isEqualTo: favouritesModel[index].id!)
                                            .get();

                                        for (QueryDocumentSnapshot doc in querySnapshot.docs) {
                                          await doc.reference.delete();
                                          favouritesModel.clear();
                                          getFavourites();
                                        }

                                      }
                                      setState(() {

                                      });

                                      // Navigator.push(
                                      //   context,
                                      //   MaterialPageRoute(
                                      //       builder: (context) =>  favourite()),
                                      // );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          );
                      }),
                ),
                const SizedBox(
                  height: 140.0,
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
                                    MaterialPageRoute(
                                        builder: (context) => Home()),
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
                                    MaterialPageRoute(
                                        builder: (context) => Search()),
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
                          )
                        ])),
                SizedBox(
                  width: 20,
                ),

                /* SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Row(children: [
                      const SizedBox(
                        width: 15.0,
                      ),
                      FillImageCard(
                        width: 250,
                        heightImage: 100,
                        color: Colors.white70,
                        imageProvider: const NetworkImage(
                            'https://raw.githubusercontent.com/Fadysamy55/ppro/main/Screenshot%202023-12-16%20161231.png'),
                        description: Container(
                          child: Row(
                            children: [
                              const Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Luxor',
                                      textDirection: TextDirection.ltr,
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Valley of the Kings ',
                                      textDirection: TextDirection.ltr,
                                      style: TextStyle(
                                        fontSize: 10.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 70,
                              ),
                              IconButton(
                                color: Colors.black,
                                icon: const Icon(Icons.favorite_outline_outlined),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Templet()),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15.0,
                      ),
                      FillImageCard(
                        width: 250,
                        heightImage: 100,
                        color: Colors.white70,
                        imageProvider: const NetworkImage(
                            'https://raw.githubusercontent.com/Fadysamy55/ppro/main/Screenshot%202023-12-16%20161241.png'),
                        description: Container(
                          child: Row(
                            children: [
                              const Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Aswan',
                                      textDirection: TextDirection.ltr,
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Abu Simble',
                                      textDirection: TextDirection.ltr,
                                      style: TextStyle(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 110,
                              ),
                              IconButton(
                                color: Colors.black,
                                icon: const Icon(Icons.favorite_outline_outlined),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => abusimbel()),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15.0,
                      ),
                    ]),
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Row(children: [
                      const SizedBox(
                        width: 15.0,
                      ),
                      FillImageCard(
                        width: 250,
                        heightImage: 100,
                        color: Colors.white70,
                        imageProvider: const NetworkImage(
                            'https://raw.githubusercontent.com/Fadysamy55/ppro/main/WhatsApp%20Image%202023-12-19%20at%2016.53.16_b243dcc8.jpg'),
                        description: Container(
                          child: Row(
                            children: [
                              const Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Giza',
                                      textDirection: TextDirection.ltr,
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Pyramids',
                                      textDirection: TextDirection.ltr,
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 90,
                              ),
                              IconButton(
                                color: Colors.black,
                                icon: const Icon(Icons.favorite_outline_outlined),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Pyramids()),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15.0,
                      ),
                      FillImageCard(
                        width: 250,
                        heightImage: 100,
                        color: Colors.white70,
                        imageProvider: const NetworkImage(
                            'https://raw.githubusercontent.com/Fadysamy55/ppro/main/Giza.jpg'),
                        description: Container(
                          child: Row(
                            children: [
                              const Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Giza',
                                      textDirection: TextDirection.ltr,
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'grand egyptian museum',
                                      textDirection: TextDirection.ltr,
                                      style: TextStyle(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 50.0,
                              ),
                              IconButton(
                                color: Colors.black,
                                icon: const Icon(Icons.favorite_outline_outlined),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                        grandegyptianmuseum()),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15.0,
                      ),
                    ]),
                  ),
                ),




                    ],
                  ),
                ),*/
              ],
            ),
          ),
        ),
      ),
    );
  }
}
