import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:master/constantes/db_constants.dart';
import 'package:master/pages/auth/login.dart';
import 'package:master/pages/auth/register.dart';
import 'package:master/pages/home_page.dart';
import 'package:master/pages/post/add_post.dart';
import 'package:master/pages/post/index_post.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dbConstants =  DbConstants();
  final _logger = Logger();
   openDatabase(
    join(await getDatabasesPath(), dbConstants.db),
    onCreate: (db, version) => _createDataBase(db),
    version: 2,
  ).then((value) {
    _logger.i(value.isOpen);
    _logger.w(value.path);

   });
  runApp(const MyApp());
}

void _createDataBase(Database db){
  db.execute('CREATE TABLE articles ('
      'id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,'
      ' title TEXT, '
      'content TEXT, '
      'comment TEXT'
      'url TEXT'
      ')'
  );

  db.execute(
    'CREATE TABLE users('
        'id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT, '
        'fullName TEXT, '
        'username TEXT, '
        'email TEXT, '
        'phone TEXT, '
        'address TEXT, '
        'password TEXT, '
        ')'
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const LoginPage(),
      routes: {
        LoginPage.route: (context)=> const LoginPage(),
        RegisterPage.route: (context)=> const RegisterPage(),
        IndexPost.route: (context)=> const IndexPost(),
        AddPost.route: (context)=> const AddPost(),
        HomePage.route: (context)=>  const HomePage(title: "Page de profile",),
      },
    );
  }
}



