/*
import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:master/model/article.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseObject {

  Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      //Créer cette database
      _database = await create();
     // print('Base est ouverte ${_database!.isOpen}');
      return _database!;
    }
  }


  Future create() async {
    //Directory directory = await getApplicationDocumentsDirectory();
    var databasePath = await getDatabasesPath();
    String path = join(databasePath, 'database.db');
      // print("le chemin du repertoire $directory");
      // print("le chemin de la base $databasePath");
   // await deleteDatabase(path);

    _database = await openDatabase(path, version: 3,
        onCreate: (Database db, int version) async {
          await db.execute(
              '''
              CREATE TABLE article (id INTEGER PRIMARY KEY, titre TEXT NOT NULL, contenu TEXT NOT NULL,  url TEXT NULL)
              '''
          );



        });

    return _database;
  }


  Future<Article> addArticle(Article article) async {
    Database maDatabase = await database;
    article.id = await _database!.insert('article', article.toMap());
    //print('inserted2: $user.id');
    return article;
  }

  Future<int> updateArticle(Article article) async {
    Database maDatabase = await database;
    return await _database!.update('article', article.toMap(),
        where: 'id = ?', whereArgs: [article.id]);
  }

  Future<List<Article>> getArticle() async {
    Database maDatabase = await database;
    List<Map<String, dynamic>> resultat = await _database!.rawQuery("SELECT * FROM article");
    List<Article> articleList =[];
    resultat.forEach((map) {
      Article article = new Article();
      article.fromMap(map);
      articleList.add(article);
    });
    return articleList;
  }


  Future close() async => _database!.close();

}*/
