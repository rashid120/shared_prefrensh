import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shared_prefrensh/proifle.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LoginForm(),
  ));
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginForm();
}

class _LoginForm extends State<LoginForm>{

   String? hintEmail;
   String? hintPassword;

  @override
  void initState() {
    super.initState();
    check();
  }

  check() async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    hintEmail = sp.getString("email").toString();
    hintPassword = sp.getString("password");
  }

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Align(alignment: Alignment.center,child: Icon(Icons.electric_meter_rounded, size: 80.0,),),
                const SizedBox(height: 10,),
                TextField(
                  controller: email,
                  decoration: InputDecoration(
                      label: const Text("Email"),
                      hintText: (hintEmail != null)? hintEmail: "Enter your email",
                      enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey))
                  ),
                  keyboardType: TextInputType.text,
                ),
                TextField(
                  controller: password,
                  decoration: InputDecoration(
                      label: const Text("Password"),
                      hintText: (hintPassword == null) ? "Enter your password" : hintPassword,
                      enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey))
                  ),
                  keyboardType: TextInputType.visiblePassword,
                ),
                const SizedBox(height: 10,),
                Align(alignment: Alignment.bottomRight,child: TextButton(onPressed: () {

                },style: const ButtonStyle(shape: MaterialStatePropertyAll(LinearBorder.none), foregroundColor: MaterialStatePropertyAll(Colors.black87)), child: const Text("Forget Password?", style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold),)), ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(onPressed: () async {

                    SharedPreferences sp = await SharedPreferences.getInstance();
                    sp.setString("email", email.text.toString());
                    sp.setString("password", password.text.toString());

                    setState(() {

                    });

                  }, style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.green), maximumSize: MaterialStatePropertyAll(Size.infinite)), child: const Text("Login", style: TextStyle(color: Colors.black38, fontWeight: FontWeight.bold),),
                  ),
                ),
                const SizedBox(height: 5,),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const Profile()));

                  }, style: const ButtonStyle(shape: MaterialStatePropertyAll(LinearBorder.none), shadowColor: MaterialStatePropertyAll(Colors.transparent)), child: const Text("New user? Sign Up", style: TextStyle(color: Colors.green),)),
                ),
              ],
            ),
          ),
        ),
    );
  }
}


