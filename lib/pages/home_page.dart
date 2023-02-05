import 'package:flutter/material.dart';
import 'package:master/pages/Articles.dart';
import 'package:master/pages/post/index_post.dart';

class HomePage extends StatefulWidget {
  static const route = "/home_page";
const HomePage({super.key, required this.title});

final String title;

@override
State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: const BoxDecoration(
                color: Colors.white,
              ),
                child: Image.asset("images/work.jpg",
                  fit: BoxFit.contain,
                  width: 50.0,),
              ),

              ListTile(
                title: const Text("Accueil",style: TextStyle(color: Colors.black),),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(title: "Biographie") ));
                },
                leading: const Icon(Icons.home,color: Colors.teal,),

              ),
              ListTile(
                title:const Text("Articles",style: TextStyle(color: Colors.black),),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Articles(title: "Articles") ));
                },
                leading: const Icon(Icons.directions_walk, color: Colors.teal,),

              )


            ],
          )
      ),
      body: SingleChildScrollView(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child:
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width /2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 10.0, top: 10.0),
                        child:  CircleAvatar(
                          radius: 60,
                          backgroundColor: Colors.cyan,
                          foregroundImage: AssetImage("images/mountain.jpg"),
                        ),

                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 10.0, top: 10.0),
                        child:  Text("AHOUMENOU Maurice")
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Padding(
                            padding:  EdgeInsets.only(left: 10, top: 5),
                            child:  Icon(Icons.mail, color: Colors.black, size: 20.0),),
                          Padding(padding: EdgeInsets.only(top: 5.0, left: 5.0),
                            child: Text(
                              "slash-max@hotmail.com",
                              style:  TextStyle(
                                  color: Colors.black, fontSize: 10.0),
                            ),
                          ),

                        ],
                      )
                      ,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Padding(
                            padding:  EdgeInsets.only(left: 10, top: 5),
                            child:  Icon(Icons.phone, color: Colors.black, size: 20.0),),
                          Padding(padding: EdgeInsets.only(top: 5.0, left: 5.0),
                            child: Text(
                              "97 58 69 68",
                              style:  TextStyle(
                                  color: Colors.black, fontSize: 10.0),
                            ),
                          ),

                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Padding(
                            padding:  EdgeInsets.only(left: 10, top: 5),
                            child:  Icon(Icons.location_city, color: Colors.black, size: 20.0),),
                          Padding(padding: EdgeInsets.only(top: 5.0, left: 5.0),
                            child: Text(
                              "C 235 Agblangandan sèmè podji",
                              style:  TextStyle(
                                  color: Colors.black, fontSize: 10.0),
                            ),
                          ),

                        ],
                      )
                    ],
                  ),
                ),

                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Padding(padding: EdgeInsets.only(top: 10.0, right: 10.0)
                      , child: Text(
                            "2010-2012 Maecenas ut sodales elit, eu luctus leo. Donec justo nisi, convallis at arcu non, porta fringilla leo. Sed hendrerit nisl ante, ac posuere urna sodales at. Morbi nec orci sapien. In sed urna ut ex dignissim vehicula. Nulla ut justo auctor, fermentum neque vitae, aliquam leo. Phasellus et eros lorem. Sed vel orci",
                            style:  TextStyle(
                                color: Colors.black, fontSize: 16.0),
                            textAlign: TextAlign.justify,
                          ) ,),
                      Divider(height: 20.0, color: Colors.blue,),
                      Padding(padding: EdgeInsets.only(top: 10.0, right: 10.0)
                        , child: Text(
                          "2012-2014 Maecenas ut sodales elit, eu luctus leo. Donec justo nisi, convallis at arcu non, porta fringilla leo. Sed hendrerit nisl ante, ac posuere urna sodales at. Morbi nec orci sapien. In sed urna ut ex dignissim vehicula. Nulla ut justo auctor, fermentum neque vitae, aliquam leo. Phasellus et eros lorem. Sed vel orci",
                          style:  TextStyle(
                              color: Colors.black, fontSize: 16.0),
                          textAlign: TextAlign.justify,
                        ) ,),

                    ],
                  ),
                )

              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                  TextButton(
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const IndexPost() )),
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.teal,
                    ),
                    child: const Text("Liste des articles", textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),),
                )
              ],
            )
          ],
        )
      ),

    );
  }
}