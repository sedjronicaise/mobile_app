import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:master/constantes/styles.dart';
import 'package:master/data/repository.dart';
import 'package:master/pages/auth/login.dart';

import '../../model/user.dart';

class RegisterPage extends StatefulWidget {
  static const route = "/register";
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterState();
}

class _RegisterState extends State<RegisterPage> {
  final fullNameController = TextEditingController();
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  final phoneController = TextEditingController();
  final passWordController = TextEditingController();
  final styles = AppStyles();
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  final repository = Repository();
  final _logger = Logger();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("INSCRIPTION AU FORUM"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15,),
                const Text("Nom et prénom",style: TextStyle(
                  fontSize: 17
                ),),
                const SizedBox(height: 10),
                TextFormField(
                  controller: fullNameController,
                  decoration: InputDecoration(
                    isDense: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(styles.radius))
                    ),
                    hintText: "Entrer votre nom et prénom",
                  ),
                  validator: (val){
                    if(val!.isEmpty){
                      return "Veuillez entrer votre nom et prénom";
                    }else {
                      return null;
                    }
                  },
                ),
                const SizedBox(height: 15,),
                TextFormField(
                  controller: userNameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Nom d'utilisateur",
                    hintText: "Nom d'utilisateur ou Pseudo",
                  ),
                ),
                const SizedBox(height: 15,),
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Email",
                    hintText: "Email",
                  ),
                ),
                const SizedBox(height: 15,),
                TextFormField(
                  controller: addressController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Adresse",
                    hintText: "Votre Adresse",
                  ),
                ),
                const SizedBox(height: 15,),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Télephone",
                    hintText: "Votre Télephone",
                  ),
                ),
                const SizedBox(height: 15,),
                TextFormField(
                  controller: passWordController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Mot de passe",
                    hintText: "votre Mot de passe",
                  ),
                ),
                const SizedBox(height: 15,),
                InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, LoginPage.route);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Text("Vous avez un compte ? Connectez-vous ici",
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 16
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15,),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: isLoading ? null : () async{
                      if(_formKey.currentState!.validate()){
                        setState(() {
                          isLoading = true;
                        });
                        final user = User(id: 0, fullName: fullNameController.text, username: userNameController.text, email: emailController.text,
                            phone: phoneController.text, address: addressController.text, password: passWordController.text);
                        await repository.createUser(user).then((value) {
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
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.pink,
                    ),
                    child: isLoading ? const CupertinoActivityIndicator() :
                    const Text("S'inscrire",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
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
