import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/controller.dart';
import '../model/model.dart';
import '../model/phases.dart';

class StartingScreen extends StatefulWidget {
  const StartingScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return DebugAuthCode();
  }




}



class DebugAuthCode extends State<StartingScreen> {

  //late Future<String> msg;
  @override
  void initState() {
    super.initState();

    //msg=Controller().firstMessage();


  }



  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return MaterialApp(

        home: Scaffold(

            body: ListView(
        children: <Widget>[
        Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            child: const Text(
              'LOGIN MY FRIEND',
              style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w500,
                  fontSize: 30),
            )),
      Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(10),
          child: const Text(
            'Sign in',
            style: TextStyle(fontSize: 20),
          )),
      Container(
        padding: const EdgeInsets.all(10),
        child: TextField(
          controller: nameController,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'User Name',
          ),
        ),
      ),
      Container(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: TextField(
          obscureText: true,
          controller: passwordController,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Password',
          ),
        ),
      ),
      TextButton(
        onPressed: () {
          Flushbar(
            title:  "Congratualtions",
            message:  "You are stupid",
            duration:  Duration(seconds: 3),
          ).show(context);
        },
        child: const Text('Forgot Password',),
      ),
      Container(
          height: 50,
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: ElevatedButton(
            child: const Text('Login'),
            onPressed: () {
              Controller().validateCredentials(passwordController.text,nameController.text,context);

              print(passwordController.text);
              print(nameController.text);
            },
          )
      ),
      Row(
        children: <Widget>[
          const Text('Does not have account?'),
          TextButton(
            child: const Text(
              'Sign UP',
              style: TextStyle(fontSize: 20),
            ),
            onPressed: () {
              Controller().toRegister(context);
            },
          )
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
      ],
    ))


    );
  }
}