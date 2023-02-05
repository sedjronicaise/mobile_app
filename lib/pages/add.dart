/*
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:master/model/databaseObject.dart';
import 'package:master/pages/Articles.dart';

import '../model/article.dart';
import '../util/firebase_handler.dart';


class Add extends StatefulWidget {
  const Add({Key? key}) : super(key: key);

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {

  final formKey = new GlobalKey<FormState>();
  final _scaffoldKey = new GlobalKey<ScaffoldState>();
  String _titre = "";
  String _contenu = "";
  XFile? _imageFile;
  Icon cameraIcon = Icon(Icons.camera_alt_rounded);
  Icon libraryIcon = Icon(Icons.photo_library_outlined);

  DatabaseObject _databaseObject = DatabaseObject();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _databaseObject = new DatabaseObject();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Enregistrement d'un article"),
        actions: [],
        leading: Icon(Icons.home),
      ),
      body: SingleChildScrollView(
        child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(onPressed: () => takePicture(ImageSource.camera), icon: cameraIcon, iconSize: 100.0,),
                    IconButton(onPressed: () => takePicture(ImageSource.gallery), icon: libraryIcon, iconSize: 100.0),
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: (_imageFile == null) ? Text("Aucune image") : Image.file(File(_imageFile!.path)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 8.0),
                  child: TextFormField(
                    decoration:  InputDecoration(labelText: "Entrer le titre de l'article",
                      //   hintText: "Entrer l'identifiant",
                      border: OutlineInputBorder(
                          borderSide: BorderSide(),
                          borderRadius: BorderRadius.circular(32.0)
                      ),
                    ),
                    autocorrect: false,
                    autofocus: false,
                    validator: (str) => str == null ? "Ce champ est obligatoire" : null,
                    onSaved: (str) => _titre =  str!,
                  ),

                ),

                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 8.0),
                  child: TextFormField(
                    decoration:  InputDecoration(labelText: "Entrer le contenu de l'article",
                      //   hintText: "Entrer l'identifiant",
                      border: OutlineInputBorder(
                          borderSide: BorderSide(),
                          borderRadius: BorderRadius.circular(32.0)
                      ),
                    ),
                    autocorrect: false,
                    autofocus: false,
                    maxLines: 5,
                    validator: (str) => str == null ? "Ce champ est obligatoire" : null,
                    onSaved: (str) => _contenu =  str!,
                  ),

                ),

                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                     Expanded(
                      child: GestureDetector(
                        child:  Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 8.0),
                          child:  Container(
                              alignment: Alignment.center,
                              height: 60.0,
                              decoration:  BoxDecoration(
                                  color: Colors.blue[900],
                                  borderRadius:
                                   BorderRadius.circular(25.0)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  //59473
                                   Padding(padding: EdgeInsets.only(left: 0.0, right: 10.0),
                                    child:  Icon(Icons.save, color: Colors.white, size: 20.0),),

                                  new Text(
                                    "Enregistrer",
                                    style: new TextStyle(
                                        color: Colors.white, fontSize: 20.0),
                                  ),
                                ],
                              )
                          ),
                        ),
                        onTap: () {

                          var form = formKey.currentState;
                          if (form!.validate()) {
                            form.save();
                            addRegister();
                          }
                        },
                      ),
                    ),
                  ],
                ),

              ],
            )
        )
      ),
    );
  }

  takePicture(ImageSource source) async {
    final XFile? imagePath = await ImagePicker().pickImage(source: source, maxHeight: 500, maxWidth: 500);
    setState(() {
      _imageFile = imagePath;
    });
  }

  addRegister()  {

    Map<String, dynamic> map = {
      "titre": _titre,
      "contenu": _contenu,
      "url": _imageFile!.path,

    };

        Article article = new Article();
        article.fromMap(map);
       DatabaseObject().addArticle(article).then((onValue) {

          _titre = "";
          _contenu = "";
          _imageFile = null;

            print("Enregistrement effectué avec succès $onValue");
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return new Articles(title: "Liste des articles",);
          }));
        });


  }

  // sendToFirebase() {
  //
  //   if ((_imageFile != null) || (_titre != null && _contenu != "")) {
  //     FirebaseHandler().addPostToFirebase("GluWw0PTuOUDW1rqsxB4RHAk4IB3", _titre,_contenu, File(_imageFile!.path));
  //
  //     Navigator.push(context, MaterialPageRoute(builder: (context) {
  //       //return new ChampForm();
  //       return new Article(title: "Nos articles",);
  //     }));
  //   }
  // }

}
*/
