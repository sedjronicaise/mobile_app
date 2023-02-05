
import 'package:flutter/material.dart';
import 'package:master/constantes/styles.dart';
import 'package:master/pages/auth/register.dart';

import '../home_page.dart';
import '../post/index_post.dart';


class LoginPage extends StatefulWidget {
  static const route = "/login";
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final styles = AppStyles();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Bienvenue sur mon blog"),
          centerTitle: true,
        ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Container(
            margin: const EdgeInsets.only(top: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(80.0), //add border radius
                    child: Image.asset(
                      "images/nicaise.jpg",
                      height: 150.0,
                      width: 150.0,
                      fit:BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 35,),
                TextFormField(
                  decoration:  InputDecoration(
                    isDense: true,
                    labelText: "Nom d'utilisateur",
                    hintText: "Votre username",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(styles.radius))
                    ),
                  ),
                ),
                const SizedBox(height: 35,),
                TextFormField(
                  decoration: InputDecoration(
                    isDense: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(styles.radius))
                    ),
                    labelText: "Mot de passe",
                    hintText: "Entrer votre Mot de passe",
                  ),
                ),
                const SizedBox(height: 25,),
                InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, RegisterPage.route);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Text("Pas de compte ? Inscrivez-vous ici",
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 16,
                          fontWeight: FontWeight.bold
                        ),
                      ),

                    ],
                  ),
                ),
                const SizedBox(height: 25,),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: TextButton(
                    onPressed: (){
                      Navigator.pushNamed(context, HomePage.route);
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.pink,
                    ),
                    child:  const Text("Se connecter",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
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
