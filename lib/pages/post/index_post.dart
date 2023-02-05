import 'package:flutter/material.dart';
import 'package:master/pages/post/add_post.dart';
//import 'add_post.dart';

class IndexPost extends StatefulWidget {
  static const route = "/index_post";
  const IndexPost({Key? key}) : super(key: key);

  @override
  State<IndexPost> createState() => _IndexPostState();
}
class _IndexPostState extends State<IndexPost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:  const Text("Liste des articles", textAlign: TextAlign.left,),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: 'Nouvel enregistrement',
            onPressed: () {
              Navigator.pushNamed(context, AddPost.route);
              //Navigator.push(context, MaterialPageRoute(builder: (context) => const AddPost()));
            }
            // Navigator.push(context, MaterialPageRoute(builder: (context) => const Add()))
            ,)
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,

              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Card(margin: EdgeInsets.only(top: 2.0),
                    child: Image.asset("images/duck.jpg",
                      fit: BoxFit.contain,
                      width: 400.0,),
                  ),
                  SizedBox(height: 50.0,),
                  Text("Mon premier article", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold),),
                  SizedBox(height: 20.0,),
                  Padding(padding: EdgeInsets.only(left: 10.0,right: 10.0),
                    child:  Text("Maecenas ut sodales elit, eu luctus leo. Donec justo nisi, convallis at arcu non, porta fringilla leo. Sed hendrerit nisl ante, ac posuere urna sodales at. Morbi nec orci sapien. In sed urna ut ex dignissim vehicula. Nulla ut justo auctor, fermentum neque vitae, aliquam leo. Phasellus et eros lorem. Sed vel orci massa. Curabitur tellus arcu, sagittis non tempus sit amet, ultricies eget ipsum. Pellentesque hendrerit vel metus sed varius. Praesent in blandit augue.", textAlign: TextAlign.justify, style: TextStyle(fontWeight: FontWeight.normal),),
                  ),

                  Padding(padding: EdgeInsets.only(left: MediaQuery.of(context).size.width - MediaQuery.of(context).size.width/3, top: 20.0),
                      child: Text("Publié par Maurice",
                        textAlign: TextAlign.end,
                        style: TextStyle(fontStyle: FontStyle.italic, color: Colors.cyan),
                      )),

                  Divider(height: 20.0, color: Colors.black,)
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,

              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Card(margin: EdgeInsets.only(top: 2.0),
                    child: Image.asset("images/playa.jpg",
                      fit: BoxFit.contain,
                      width: 400.0,),
                  ),
                  SizedBox(height: 10.0,),
                  Text("Mon deuxième article", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold),),
                  SizedBox(height: 20.0,),
                  Padding(padding: EdgeInsets.only(left: 10.0,right: 10.0),
                    child:  Text("Maecenas ut sodales elit, eu luctus leo. Donec justo nisi, convallis at arcu non, porta fringilla leo. Sed hendrerit nisl ante, ac posuere urna sodales at. Morbi nec orci sapien. In sed urna ut ex dignissim vehicula. Nulla ut justo auctor, fermentum neque vitae, aliquam leo. Phasellus et eros lorem. Sed vel orci massa. Curabitur tellus arcu, sagittis non tempus sit amet, ultricies eget ipsum. Pellentesque hendrerit vel metus sed varius. Praesent in blandit augue.", textAlign: TextAlign.justify, style: TextStyle(fontWeight: FontWeight.normal),),
                  ),

                  Padding(padding: EdgeInsets.only(left: MediaQuery.of(context).size.width - MediaQuery.of(context).size.width/3, top: 20.0),
                      child: Text("Publié par Maurice",
                        textAlign: TextAlign.end,
                        style: TextStyle(fontStyle: FontStyle.italic, color: Colors.cyan),
                      )),

                  Divider(height: 20.0, color: Colors.black,)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
