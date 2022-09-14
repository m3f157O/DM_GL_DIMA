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
                        Controller().toViewMenu(context),
                      },
                      child: Text(context.select<AppState,PHASE>((value) =>value.state).toString()),
                    )


                  ],
                )
              ],
            )
        )

    );
  }
}