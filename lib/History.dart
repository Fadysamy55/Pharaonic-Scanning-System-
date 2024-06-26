import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradutionfinally/Favourite.dart';
import 'package:gradutionfinally/Home.dart';
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


class History extends StatefulWidget {

  History({super.key});

  @override
  State<History> createState() {
    return HistoryState();
  }}
class HistoryState extends State<History>{
  final TextEditingController _searchController = TextEditingController();
  List<PostsModel> HistoryModel = [];
  var _firestore = FirebaseFirestore.instance;
  getHistory() async {
    try {
      QuerySnapshot querySnapshot = await _firestore.collection('places').get();

      if (querySnapshot.docs.isNotEmpty) {
        for (int i = 0; i < querySnapshot.docs.length; i++) {
          QuerySnapshot querySnapshotHistory = await FirebaseFirestore.instance
              .collection('history')
              .where('user_id', isEqualTo: sharedpref!.getString('uid'))
              .where('post_id', isEqualTo: querySnapshot.docs[i].id!)
              .get();
          if (querySnapshotHistory.size > 0) {
            QuerySnapshot querySnapshotFav = await FirebaseFirestore.instance
                .collection('fav')
                .where('user_id', isEqualTo: sharedpref!.getString('uid'))
                .where('post_id', isEqualTo: querySnapshot.docs[i].id!)
                .get();
            querySnapshotFav.size > 0 ?
            HistoryModel.add(PostsModel(
                id: querySnapshot.docs[i].id,
                name: querySnapshot.docs[i]['country'],
                imgPath: querySnapshot.docs[i]['image'],
                title: querySnapshot.docs[i]['title'],
                isFav: true,description:  querySnapshot.docs[i]['description'])):    HistoryModel.add(PostsModel(
                id: querySnapshot.docs[i].id,
                name: querySnapshot.docs[i]['country'],
                imgPath: querySnapshot.docs[i]['image'],
                title: querySnapshot.docs[i]['title'],
                isFav: false,description:  querySnapshot.docs[i]['description']));

            print('dataa' + querySnapshot.docs[i]['country']);
          }
        }
        setState(() {});
      }
    } catch (e) {
      print('error_' + e.toString());
    }
  }
  void initState() {
    // TODO: implement initState
    super.initState();
    getHistory();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title:
          Text("Pharaonic Scanning",
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
                'https://raw.githubusercontent.com/Fadysamy55/ppro/main/Screenshot%202024-02-05%20152208.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 20.0,
                      ),
                      Center(
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 130.0,
                            ),
                            // Add some spacing between icon and text
                            Text(
                              "History",
                              style: GoogleFonts.oxanium(
                                fontSize: 40.0,
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
                      const SizedBox(
                        height: 15.0,
                      ),
                    for(int i=0;i<HistoryModel.length;i++)
                      Column(
                        children: [
                          FillImageCard(
                            width: 320,
                            heightImage: 120,
                            color: Colors.white70,
                            imageProvider:  NetworkImage(
                                HistoryModel[i].imgPath!),
                            description: Container(
                              child: Row(
                                children: [
                                   Column(
                                    children: [
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          HistoryModel[i].name!,
                                          textDirection: TextDirection.ltr,
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black54,
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          HistoryModel[i].title!,
                                          textDirection: TextDirection.ltr,
                                          style: TextStyle(
                                            fontSize: 13.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 100,
                                  ),
                                  IconButton(
                                    color: Colors.black,
                                    icon: HistoryModel[i].isFav!
                                        ? Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                    )
                                        : Icon(Icons.favorite_outline_outlined),
                                    onPressed: () async {
                                      if (!HistoryModel[i].isFav!) {
                                        HistoryModel[i].isFav = true;
                                        await FirebaseFirestore.instance
                                            .collection('fav')
                                            .doc()
                                            .set({
                                          'post_id': HistoryModel[i].id!,
                                          'user_id':
                                          sharedpref!.getString('uid'),
                                        });
                                      } else {
                                        HistoryModel[i].isFav = false;
                                        QuerySnapshot querySnapshot =
                                        await FirebaseFirestore.instance
                                            .collection('fav')
                                            .where('user_id',
                                            isEqualTo: sharedpref!
                                                .getString('uid'))
                                            .where('post_id',
                                            isEqualTo:
                                            HistoryModel[i].id!)
                                            .get();

                                        for (QueryDocumentSnapshot doc
                                        in querySnapshot.docs) {
                                          await doc.reference.delete();
                                        }
                                      }
                                      setState(() {});

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
                          ),const SizedBox(
                            height: 15.0,
                          ),
                        ],
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
        ),
      ),
    );
  }
}
