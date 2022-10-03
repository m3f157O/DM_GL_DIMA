import 'package:flutter/material.dart';

import '../controller/controller.dart';


//Widget for input

class SignUpWidget extends StatefulWidget {

  const SignUpWidget({Key? key}) : super(key: key);


  @override
  SignUpState createState() => SignUpState();
}

class SignUpState extends State<SignUpWidget> {
  final FocusNode focusEmail = FocusNode();
  final FocusNode focusPassword = FocusNode();
  final FocusNode focusName = FocusNode();
  final FocusNode focusConfirmPassword = FocusNode();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
  TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
          padding: EdgeInsets.only(top: 30.0),
          child: Column(
            children: <Widget>[
              Stack(
                alignment: Alignment.topCenter,
                  children: <Widget>[
                  Card(
                    elevation: 2.0,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                    child: Container(
                      width: 360.00,
                      height: 480.00,
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(
                                top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
                            child: TextField(
                              focusNode: focusName,
                              controller: nameController,
                              keyboardType: TextInputType.emailAddress,
                              style: TextStyle(
                                  fontFamily: "SignikaSemiBold",
                                  fontSize: 16.0,
                                  color: Colors.black),
                              decoration: InputDecoration(
                                  border: InputBorder.none,

                                  hintText: "Enter name",
                                  hintStyle: TextStyle(
                                      fontFamily: "SignikaSemiBold",
                                      fontSize: 18.0)),
                            ),
                          ),
                          Container(
                            width: 250.0,
                            height: 1.0,
                            color: Colors.grey,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
                            child: TextField(
                              focusNode: focusEmail,
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              style: TextStyle(
                                  fontFamily: "SignikaSemiBold",
                                  fontSize: 16.0,
                                  color: Colors.black),
                              decoration: InputDecoration(
                                  border: InputBorder.none,

                                  hintText: "Enter email",
                                  hintStyle: TextStyle(
                                      fontFamily: "SignikaSemiBold",
                                      fontSize: 18.0)),
                            ),
                          ),
                          Container(
                            width: 250.0,
                            height: 1.0,
                            color: Colors.grey,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
                            child: TextField(
                              focusNode: focusPassword,
                              controller: passwordController,
                              style: TextStyle(
                                  fontFamily: "SignikaSemiBold",
                                  fontSize: 16.0,
                                  color: Colors.black),
                              decoration: InputDecoration(
                                  border: InputBorder.none,

                                  hintText: "Enter password",
                                  hintStyle: TextStyle(
                                      fontFamily: "SignikaSemiBold",
                                      fontSize: 18.0)),
                            ),
                          ),
                          Container(
                            width: 250.0,
                            height: 1.0,
                            color: Colors.grey,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
                            child: TextField(
                              focusNode: focusPassword,
                              controller: passwordController,
                              style: TextStyle(
                                  fontFamily: "SignikaSemiBold",
                                  fontSize: 16.0,
                                  color: Colors.black),
                              decoration: InputDecoration(
                                  border: InputBorder.none,

                                  hintText: "Confirm password",
                                  hintStyle: TextStyle(
                                      fontFamily: "SignikaSemiBold",
                                      fontSize: 18.0)),
                            ),
                          ),
                          Container(
                            width: 250.0,
                            height: 1.0,
                            color: Colors.grey,
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 40.0),

                            child: MaterialButton(
                              highlightColor: Colors.transparent,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 42.0),
                                child: Text(
                                  "Sign Up",
                                  style: TextStyle(
                                      fontFamily: "SignikaSemiBold",
                                      color: Colors.black,
                                      fontSize: 22.0),
                                ),
                              ),
                              onPressed: () {
                                Controller().registerUser(passwordController.text,nameController.text, context);
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        gradient: new LinearGradient(
                            colors: [
                              Colors.white10,
                              Colors.white,
                            ],
                            begin: const FractionalOffset(0.0, 0.0),
                            end: const FractionalOffset(1.0, 1.0),
                            stops: [0.0, 1.0],
                            tileMode: TileMode.clamp),
                      ),
                      width: 100.0,
                      height: 1.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15.0, right: 15.0),
                      child: Text(
                        "OR",
                        style: TextStyle(
                            color: Colors.white,
                            decoration: TextDecoration.none,
                            fontSize: 16.0,
                            fontFamily: "WorkSansMedium"),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: new LinearGradient(
                            colors: [
                              Colors.white,
                              Colors.white10,
                            ],
                            begin: const FractionalOffset(0.0, 0.0),
                            end: const FractionalOffset(1.0, 1.0),
                            stops: [0.0, 1.0],
                            tileMode: TileMode.clamp),
                      ),
                      width: 100.0,
                      height: 1.0,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: TextButton(
                  child: Text(
                    "Sign up with",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontFamily: "SignikaRegular"),
                  ),
                  onPressed: () {},
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 10.0, right: 40.0),
                    child: GestureDetector(
                      onTap: () => {},
                      child: Container(
                        padding: const EdgeInsets.all(15.0),
                        decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),

                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0, right: 40.0),
                    child: GestureDetector(
                      onTap: () => {},
                      child: Container(
                        padding: const EdgeInsets.all(15.0),
                        decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),

                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0, right: 40.0),
                    child: GestureDetector(
                      onTap: () => {},
                      child: Container(
                        padding: const EdgeInsets.all(15.0),
                        decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),

                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: GestureDetector(
                      onTap: () => {},
                      child: Container(
                        padding: const EdgeInsets.all(15.0),
                        decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),

                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}