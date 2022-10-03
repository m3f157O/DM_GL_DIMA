import 'package:dima_project/view/show_data.dart';
import 'package:dima_project/view/show_profile.dart';
import 'package:dima_project/view/show_stats.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../controller/controller.dart';
import 'graphs/dummy.dart';



class ClientMenu extends StatefulWidget {


  const ClientMenu({Key? key}) : super(key: key);


  @override
  ClientMenuAPI createState() => ClientMenuAPI();
}

class ClientMenuAPI extends State<ClientMenu> {


  late int selected;











  @override
  void initState() {
    super.initState();



  }

  late int _selectedIndex=0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget getWidget() {
    if(_selectedIndex==1) {
      return const ShowData();
    } else if(_selectedIndex==2){
      return const ShowProfile();
        //
    } else {
      return const ShowStats();

    }

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getWidget(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.stairs),
            label: 'Sort',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.flutter_dash_rounded),
            label: 'Exercises',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap:_onItemTapped,
      ),
    );


  }
}