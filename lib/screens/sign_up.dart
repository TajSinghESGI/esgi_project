import 'package:esgi_project/controllers/auth_controller.dart';
import 'package:esgi_project/utils/constant.dart';
import 'package:esgi_project/utils/constant_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String email, password, pseudo;
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            child: GestureDetector(
          onTap: () => FocusScope.of(context)
              .unfocus(), // enleve clavier si clique ailleurs
          child: Container(
            padding: EdgeInsets.only(top: 0, left: 30.0, right: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 0),
                    child: Image.asset(Constant.pathLogoImage)),
                TextField(
                    style: TextStyle(fontWeight: FontWeight.w500),
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {
                      email = value; //get the value entered by user.
                    },
                    decoration: InputDecoration(
                        suffixIcon: Icon(Icons.email),
                        hintText: 'Votre Email',
                        labelText: 'Votre Email',
                        labelStyle: TextStyle(fontWeight: FontWeight.w400))),
                SizedBox(height: 10.0),
                TextField(
                    style: TextStyle(fontWeight: FontWeight.w500),
                    onChanged: (value) {
                      pseudo = value; //get the value entered by user.
                    },
                    decoration: InputDecoration(
                        suffixIcon: Icon(Icons.person),
                        hintText: 'Pseudo',
                        labelText: 'Pseudo',
                        labelStyle: TextStyle(fontWeight: FontWeight.w400))),
                SizedBox(height: 10.0),
                TextField(
                    obscureText: true,
                    style: TextStyle(fontWeight: FontWeight.w500),
                    onChanged: (value) {
                      password = value; //get the value entered by user.
                    },
                    decoration: InputDecoration(
                        suffixIcon: Icon(Icons.lock),
                        hintText: 'Mot de passe',
                        labelText: 'Mot de passe',
                        labelStyle: TextStyle(fontWeight: FontWeight.w400))),
                SizedBox(height: 10.0),
                CheckboxListTile(
                  title: Text("Vous êtes un organisateur ?"),
                  value: isChecked,
                  onChanged: (newValue) {
                    setState(() {
                      isChecked = newValue;
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                  activeColor: Colors.purple.shade300, //  <-- leading Checkbox
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: RawMaterialButton(
                    onPressed: () {
                      //TODO: gerer champs dans controller, ensuite pas envoyer en
                    // param email, pwd etc.. car sera deja dans controller
                      AuthController.to.signUp(email, pseudo, password, isChecked);
                     // signUserIn();
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: Text(
                        "S'inscrire",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w400),
                      ),
                    ),
                    elevation: 6.0,
                    fillColor: ConstantColor.primaryColor,
                    shape: StadiumBorder(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 50),
                  child: GestureDetector(
                    onTap: () => Get.back(),
                    child: Container(
                      height: 50,
                      child: Center(
                        child: Text(
                          "Se Connecter",
                          style: TextStyle(
                            color: ConstantColor.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
