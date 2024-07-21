import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_prefrensh/main.dart';

class Profile extends StatefulWidget{
  const Profile({super.key});

  @override
  State<Profile> createState() => _Profile();

}

class _Profile extends State<Profile>{

  String emailText ='Please set your email address';
  String passwordText ='Please set your password';

  @override
  void initState(){
    super.initState();

    getValue();
  }
  void getValue() async{

    SharedPreferences sp = await SharedPreferences.getInstance();

    setState(() {
      emailText = sp.getString("email").toString();
      passwordText = sp.getString("password").toString();
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Container(
            width: 200,
            height: 200,
            color: Colors.blueGrey,
            child: Card(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(Icons.person, size: 80,),
                    const SizedBox(height: 10,),
                    Text(emailText, style: const TextStyle(overflow: TextOverflow.ellipsis), maxLines: 1,),
                    Text(passwordText, style: const TextStyle(overflow: TextOverflow.ellipsis), maxLines: 1,),
                    const SizedBox(height: 10,),
                    TextButton(onPressed: () async {

                      SharedPreferences sp = await SharedPreferences.getInstance();
                      sp.clear();

                      setState(() {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginForm(),));
                      });
                    }, style: const ButtonStyle(shadowColor: MaterialStatePropertyAll(Colors.blueGrey), shape: MaterialStatePropertyAll(LinearBorder.none), backgroundColor: MaterialStatePropertyAll(Colors.blueGrey)), child: const Text("Remove", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),))
                  ],
                ),
              ),
            ),
          ),
        ),
    );
  }

}