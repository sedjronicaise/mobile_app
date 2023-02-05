import 'package:master/constantes/db_constants.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../model/user.dart';
import '../model/article.dart';

class Repository{
 final dbConstants = DbConstants();

 Future<int> createUser(User user) async{
   final db = await database();
   final result = await db.insert(dbConstants.usersBox,user.toMap(), conflictAlgorithm: ConflictAlgorithm.replace,);
  return result;
 }

 Future<int> addPost(Article article) async{
   final db = await database();
   final result = await db.insert(dbConstants.articlesBox,article.toMap(), conflictAlgorithm: ConflictAlgorithm.replace,);
   return result;
 }

  Future<Database> database() async {
    final database = openDatabase(
      join(await getDatabasesPath(), dbConstants.db),
      version: 2
    );
    return database;
  }
}