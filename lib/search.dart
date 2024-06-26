import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradutionfinally/Favourite.dart';
import 'package:gradutionfinally/History.dart';
import 'package:gradutionfinally/Home.dart';
import 'package:gradutionfinally/Profile.dart';
import 'package:gradutionfinally/Satrted.dart';
import 'package:gradutionfinally/Scaning.dart';
import 'package:image_card/image_card.dart';

import 'Models/PostsModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'main.dart';
class Search extends StatefulWidget {
  Search({super.key});

@override
  State<Search> createState() {
   return SearchState();
  }



}
class SearchState extends State<Search>{

  var _firestore = FirebaseFirestore.instance;
  final TextEditingController _searchController = TextEditingController();
  List<PostsModel> postsModel = [];
  List<PostsModel> allModel = [];

  @override
  void initState() {
    super.initState();
    getPlaces();

  }

  getPlaces() async {
    try {
      QuerySnapshot querySnapshot = await _firestore.collection('places').get();

      if (querySnapshot.docs.isNotEmpty) {
        for (int i = 0; i < querySnapshot.docs.length; i++) {
          QuerySnapshot querySnapshotFav = await FirebaseFirestore.instance
              .collection('fav')
              .where('user_id', isEqualTo: sharedpref!.getString('uid'))
              .where('post_id', isEqualTo: querySnapshot.docs[i].id!)
              .get();
          if(querySnapshotFav.size > 0) {

            allModel.add(PostsModel(
                id: querySnapshot.docs[i].id,
                name: querySnapshot.docs[i]['country'],
                imgPath: querySnapshot.docs[i]['image'],
                title: querySnapshot.docs[i]['title'],
                isFav: true,
                description: querySnapshot.docs[i]['description'],
                isPlaces: true));

          }else{   allModel.add(PostsModel(
              id: querySnapshot.docs[i].id,
              name: querySnapshot.docs[i]['country'],
              imgPath: querySnapshot.docs[i]['image'],
              title: querySnapshot.docs[i]['title'],
              isFav: false,
              description: querySnapshot.docs[i]['description'],isPlaces: true));
          }
          print('dataa' + querySnapshot.docs[i]['country']);
        }
        setState(() {});
        QuerySnapshot querySnapshotStatues = await _firestore.collection('statues').get();

        if (querySnapshotStatues.docs.isNotEmpty) {
          for (int x = 0; x < querySnapshotStatues.docs.length; x++) {

            allModel.add(PostsModel(
                id: querySnapshotStatues.docs[x].id,
                name: '',
                imgPath: querySnapshotStatues.docs[x]['image'],
                title: querySnapshotStatues.docs[x]['title'],
                isFav: false,
                description: querySnapshotStatues.docs[x]['description'],isPlaces: false));}
        }
      }
    } catch (e) {
      print('error_' + e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(resizeToAvoidBottomInset: false,
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
                        Icons.search_outlined,
                        size: 30.0,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 10.0),
                      // Add some spacing between icon and text
                      Text(
                        "search",
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
                  height: 20.0,
                ),
                Container(
                  width: 400.0,
                  height: 90.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.white,
                  ),
                  padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0, 5.0),
                  child: Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.white,
                      ),

                      // Add padding around the search bar
                      // Use a Material design search bar
                      child: TextField(
                        controller: _searchController,
                        onChanged: (val){
                          postsModel.clear();

                          if(val == ''){
                           // getPlaces();
                          }else{
                            allModel.forEach((searchItem) {
                              if (searchItem.title!.toLowerCase().contains(val.toLowerCase()) || searchItem.title!.toUpperCase().contains(val.toUpperCase()) )
                                postsModel.add(searchItem);
                            });
                          }

                          setState(() {

                          });
                        },
                        decoration: InputDecoration(
                          hintText: 'Search result...',
                          // Add a clear button to the search bar

                          // Add a search icon or button to the search bar
                          prefixIcon: IconButton(
                            color: Colors.black,
                            icon: const Icon(Icons.search),
                            onPressed: () {
                              // Perform the search here
                            },
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15,),
                Expanded(
                  child: GridView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      itemCount: postsModel.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10),
                      itemBuilder: (context, index) {
                        return
                          FillImageCard(
                            width: 200,
                            heightImage: 100,
                            color: Colors.white70,
                            imageProvider:  NetworkImage(
                                postsModel[index].imgPath!),
                            description: Container(
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          postsModel[index].name!,
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
                                        child: SizedBox(width: MediaQuery.sizeOf(context).width * .22,
                                          child: Text(
                                            overflow: TextOverflow.ellipsis,

                                            postsModel[index].title!,
                                            textDirection: TextDirection.ltr,
                                            style: TextStyle(
                                              fontSize: 10.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  postsModel[index].isPlaces! ?
                                  IconButton(
                                    color: Colors.black,
                                    icon:  postsModel[index].isFav! ? Icon(Icons.favorite,color: Colors.red,): Icon(Icons.favorite_outline_outlined),
                                    onPressed: () async {
                                      if(!postsModel[index].isFav!){
                                        postsModel[index].isFav = true;
                                        await FirebaseFirestore.instance
                                            .collection('fav')
                                            .doc()
                                            .set({
                                          'post_id': postsModel[index].id!,
                                          'user_id': sharedpref!.getString('uid'),

                                        });
                                      }else{
                                        postsModel[index].isFav = false;
                                        QuerySnapshot querySnapshot = await FirebaseFirestore.instance
                                            .collection('fav')
                                            .where('user_id', isEqualTo: sharedpref!.getString('uid')).
                                        where('post_id',isEqualTo: postsModel[index].id!)
                                            .get();

                                        for (QueryDocumentSnapshot doc in querySnapshot.docs) {
                                          await doc.reference.delete();
                                          postsModel.clear();

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
                                  ):Container(),
                                ],
                              ),
                            ),
                          );
                      }),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
