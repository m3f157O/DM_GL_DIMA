import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/controller.dart';
import '../model/model.dart';
import '../model/phases.dart';

class ShowData extends StatefulWidget {
  const ShowData({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return DebugAuthCode();
  }




}



class DebugAuthCode extends State<ShowData> {

  //late Future<String> msg;
  @override
  void initState() {
    super.initState();
    //msg=Controller().firstMessage();


  }



  @override
  Widget build(BuildContext context) {
    Color hello=Provider.of<AppState>(context).main;

    return MaterialApp(

        home: Scaffold(

            body: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue, // Background color
                      ),
                      onPressed: () => { Controller().changeColor(context,Colors.blue)
                      },
                      child: const Text("Blue"),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red, // Background color
                      ),
                      onPressed: () => { Controller().changeColor(context,Colors.red)
                      },
                      child: const Text("Red"),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: hello, // Background color
                      ),
                      onPressed: () => {
                          Flushbar(
                          title:  "Congratualtions",
                          message:  "You are stupid",
                          duration:  Duration(seconds: 3),
                          ).show(context)
                      },
                      child: const Text("TEST"),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange, // Background color
                      ),
                      onPressed: () => { Controller().changeColor(context,Colors.orange)
                      },
                      child: const Text("Orange"),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green, // Background color
                      ),
                      onPressed: () => { Controller().changeColor(context,Colors.green)
                      },
                      child: const Text("Green"),
                    )


                  ],
                )
              ],
            )
        )

    );
  }
}