import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:master/model/article.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../data/repository.dart';
class AddPost extends StatefulWidget {
  static const route = "/add_post";
  const AddPost({Key? key}) : super(key: key);

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  final formKey =  GlobalKey<FormState>();
  final _scaffoldKey =  GlobalKey<ScaffoldState>();
  File? image;

  final title = TextEditingController();
  final content = TextEditingController();
  final _logger = Logger();

  bool isLoading = false;
  final repository = Repository();

  Icon cameraIcon = const Icon(Icons.camera_alt_rounded);
  Icon libraryIcon = const Icon(Icons.photo_library_outlined);

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if(image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } on PlatformException catch(e) {
      _logger.i(e.message);
    }
  }
  Future cameraImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if(image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } on PlatformException catch(e) {
      _logger.i(e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text("Créer un article"),

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
                      IconButton(onPressed: () => cameraImage(), icon: cameraIcon, iconSize: 100.0,),
                      IconButton(onPressed: () => pickImage(), icon: libraryIcon, iconSize: 100.0),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width ,
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: (image == null) ? const Text("Aucune image") : Image.file(File(image!.path),fit: BoxFit.cover,),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10.0),
                    child: TextFormField(
                      controller: title,
                      decoration:  InputDecoration(labelText: "Entrer le titre de l'article",
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(),
                            borderRadius: BorderRadius.circular(32.0)
                        ),
                      ),
                      autocorrect: false,
                      autofocus: false,
                      validator: (str) => str == null ? "Ce champ est obligatoire" : null,
                    ),

                  ),
                  const SizedBox(height: 25.0,),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 8.0),
                    child: TextFormField(
                      controller: content,
                      decoration:  InputDecoration(labelText: "Entrer le contenu de l'article",
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(),
                            borderRadius: BorderRadius.circular(16.0)
                        ),
                      ),
                      autocorrect: false,
                      autofocus: false,
                      maxLines: 5,
                      validator: (str) => str == null ? "Ce champ est obligatoire" : null,
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
                                    color: Colors.pink,
                                    borderRadius:
                                    BorderRadius.circular(25.0)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    //59473
                                    const Padding(
                                      padding: EdgeInsets.only(left: 0.0, right: 10.0),
                                      child:  Icon(Icons.save, color: Colors.white, size: 20.0),
                                    ),
                                    TextButton(
                                      onPressed: isLoading ? null : () async{
                                        if(formKey.currentState!.validate()){
                                          setState(() {
                                            isLoading = true;
                                          });
                                          final article = Article(id: 0, url: image!.path, title: title.text,
                                              content: content.text);
                                          await repository.addPost(article).then((value) {
                                            setState(() {
                                              isLoading = false;
                                            });
                                            _logger.i(value);
                                            if(value == 0){
                                              final snackBar = showMessage("Utilisateur créé avec succès!");
                                              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                            }else{
                                              final snackBar = showMessage("Echec et mat");
                                              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                            }
                                          }).catchError((onError){
                                            setState(() {
                                              isLoading = false;
                                            });
                                            _logger.e(onError.toString());
                                          });
                                        }
                                      },
                                      child: const Text("Enregistrer",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 17,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                            ),
                          ),
                          onTap: () {

                            /*var form = formKey.currentState;
                            if (form!.validate()) {
                              form.save();
                              addRegister();
                            }*/
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

  takePicture(ImageSource camera) {}

  Future<void> insertArticle(Article article) async {
    final database = openDatabase(
      join(await getDatabasesPath(), 'article_database.db'),
    );
    final db = await database;

    await db.insert(
      'article',
      article.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }


  SnackBar showMessage(String msg){
    return SnackBar(
      content: Text(msg),
      action: SnackBarAction(
        label: '',
        onPressed: () {
          // Some code to undo the change.
        },
      ),
    );
  }
}

