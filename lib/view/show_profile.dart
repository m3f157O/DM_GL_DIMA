import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../controller/controller.dart';

class ShowProfile extends StatefulWidget {
  const ShowProfile({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return DebugAuthCode();
  }




}



class DebugAuthCode extends State<ShowProfile> {

  //late Future<String> msg;
  @override
  void initState() {
    super.initState();

    //msg=Controller().firstMessage();


  }



  @override
  Widget build(BuildContext context) {

    return MaterialApp(

        home: Scaffold(

            body: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () => {
                      },
                      child: const Text("THIS IS TEST"),
                    )


                  ],
                )
              ],
            )
        )

    );
  }
}