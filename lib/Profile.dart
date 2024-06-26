import 'package:flutter/material.dart';
import 'package:gradutionfinally/Favourite.dart';
import 'package:gradutionfinally/History.dart';
import 'package:gradutionfinally/Home.dart';
import 'package:gradutionfinally/Satrted.dart';
import 'package:gradutionfinally/Scaning.dart';
import 'package:gradutionfinally/search.dart';
import 'package:profile/profile.dart';
import 'package:google_fonts/google_fonts.dart';
class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _AdminPageState();
}
class _AdminPageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
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
    child:
    SafeArea(
      child: Expanded(
        child:
        SingleChildScrollView(
          scrollDirection: Axis.vertical,

          child: Column(
        children: [
        Profile(
          imageUrl: "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png",
          name: "Fady Samy ",
          website: " Bio ('.......')",
          designation: "New visitor  | Egyption & cairo",
          email: "FadySamy505@gmail.com",
          phone_number: "01276459615",

        ),
    SizedBox(height: 320.0,),
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


]
    ),


    ),

    ),
    ),
    ),
    );
  }
}
