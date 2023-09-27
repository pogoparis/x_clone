import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ConnexionPage extends StatefulWidget {
  const ConnexionPage({
    super.key,
  });

  @override
  State<ConnexionPage> createState() => _ConnexionPageState();
}

class _ConnexionPageState extends State<ConnexionPage> {
  final textControlerEmail = TextEditingController();
  final textControlerPassword = TextEditingController();
  bool rememberMe = false;
  final _formKey = GlobalKey<FormState>();
  final emailValue = "pogoparis@gmail.com";
  final pwd = "1234abcd";
  String message = ""; // Message de validation
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Login",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
     body: Column(
       children: [
         Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              const Text(
                'Connexion à Twitter',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              TextFormField(
                  controller: textControlerEmail,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                      labelText: 'Identifiant', hintText: "tonmail@gmail.om.com"),
                  validator: (valueEmail) {
                    if (valueEmail == null || valueEmail.isEmpty == true) {
                      return "Merci de compléter ce champs";
                    }
                    if (!RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]{2,6}$")
                        .hasMatch(valueEmail)) {
                      return "Vérifier le format de l'EMail";
                    }
                    return null;
                  }),
              TextFormField(
                  controller: textControlerPassword,
                  decoration:  InputDecoration(
                    labelText: 'Mot de passe',
                    // *************** Oeil afficher mot de passe *************
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          isPasswordVisible = !isPasswordVisible;
                        });
                      },
                      child: Icon(
                        isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                      ),
                    ),
                  ),
                  obscureText: !isPasswordVisible, // Pour masquer le mot de passe
                  //************************************************************
                  validator: (valuePassword) {
                    if (valuePassword == null || valuePassword.isEmpty == true) {
                      return "Merci de compléter ce champs";
                    }
                    if (!RegExp(
                        r"^.{4,}$")
                        .hasMatch(valuePassword)) {
                      return "Minimum 4 caractères";
                    }
                    return null;
                  }),

              Row(
                children: [
                  Switch(
                      value: rememberMe,
                      onChanged: (isEnabled) {
                        setState(() {
                          rememberMe = !rememberMe;
                        });
                      }),
                  const Text('Mémoriser mes informations'),
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () {
                    final enteredEmail = textControlerEmail.text;
                    final enteredPassword = textControlerPassword.text;
                    if (_formKey.currentState?.validate() == true &&
                        enteredEmail == emailValue &&
                        enteredPassword == pwd) {
                      context.go("/tweets");
                    } else {
                      setState(() {
                        message = "Email ou mot de passe incorrects";
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          12.0),
                    ),
                    backgroundColor: Colors.blue,
                  ),
                  child: const Text('Se connecter', style: TextStyle(color: Colors.white)),
                ),
              ),
              if (message.isNotEmpty || message != "")
                Text(
                  message,
                  style: TextStyle(
                    color: message == "OK, c'est bon"
                        ? Colors.green
                        : Colors.red,
                  ),
                ),
            ]),
          ),
    ),
       ],
     ),
    );
  }
}
