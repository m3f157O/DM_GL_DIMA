import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/model.dart';
import '../model/phases.dart';

/// -----------------------------------
///           CONTROLLER
/// -----------------------------------
///       HOW TO ADD A NEW VIEW LINK:
/// 1. IF YOU NEED TO SHOW MORE DATA, ADD THE CORRESPONDING LISTENED VALUE IN THE MODEL, AND ACCORDING TO THE FOLLOWING, THE CORRECT METHOD IN EACH COMPONENT
/// 2. IF YOU NEED TO MAKE THAT DATA PERSISTENT, MAKE IT CONSISTENT WITH A DB TABLE/BLOB
/// 3. IF YOU NEED TO ACQUIRE DATA, HERE IS WHAT I SUGGEST:
///   -NON-PERSISTENT DATA: INVOKE VIEW->CONTROLLER->NET_CONTROLLER AND GET IT AS A RETURN ARGUMENT
///   -PERSISTENT DATA: INVOKE VIEW->CONTROLLER->MODEL_DB. IF IT'S A LARGE SIZE OF DATA, I DON'T RECOMMEND GETTING IT AS A RETURN ARGUMENT.
///                     IF IT'S NOT A "FINAL" DATA, I RECOMMEND SETTING IT AS AN OBSERVED VALUE, TO MAKE IT AVAILABLE IN REAL TIME AND AVOIDING
///                     EXPLICIT METHOD INVOCATIONS
/// 3a. DONT LISTEN ON VALUES THAT CHANGE SPORADICALLY, AS IT IS A WASTE OF RESOURCES
/// 4. NOW YOU CAN CREATE A VIEW. TO DO SO, YOU NEED TO ASSOCIATE IT TO A PHASE. ONCE YOU HAVE ASSOCIATED IT WITH A PHASE YOU CAN UPDATE THE PHASE MACHINE TABLE IN THE
///    main.dart CLASS. CHOOSE THE PHASE THAT YOU WANT TO BE ITS PREDECESSOR PHASE, AND CREATE A CORRESPONDING CONTROLLER METHOD, WHICH WILL BE CALLED BY ITS PREDECESSOR TO MAKE THE TRANSITION.
///
/// EXAMPLE: I NEED TO ACQUIRE THE EXERCISE FROM POLAR TM (NOT PERSISTENT)
/// ///      1. I ADD GetExerciseData METHOD TO THE NetController, WHICH RETURNS THE DATA, ADD A METHOD TO THE Controller TO USE IT AND GET ITS RETURN ARGUMENT.
///          1a. NetController makes an async call to remote
///          2. I CREATE THE VIEW Client_MEnu_Api AND CREATE THE CORRESPONDING METHOD TO ACQUIRE AND USE THE DATA. I ASSOCIATE IT WITH THE PHASE clientMenu, AND CHOOSE ITS PREDECESSOR,
///             THAT WILL BE get_token_from_polar
///          3. I CHOOSE WHICH ACTION WITHIN THAT VIEW CAUSES THE CONTROLLER TO MODIFY THE MODEL PHASE TO clientMenu (WHICH IS CONSTANTLY OBSERVED BY THE STATE MACHINE) CAUSING THE VIEW TO
///             TRANSITION TO THE ASSOCIATED PHASE'S ONE.
///          4. NOW, WHEN WITHIN THE VIEW get_token_from_polar, A CERTAIN USER ACTION CAUSES THE TRANSITION TO HAPPEN AND THE DATA TO BE SHOWN
/// EXAMPLE: I NEED TO ACQUIRE THE EXERCISE FROM POLAR TM (PERSISTENT)
/// ///      1. I ADD GetExerciseData METHOD TO THE db_model, WHICH SETS THE CORRESPONDING OBSERVED DATA IN THE MDDEL, ADD A METHOD TO THE Controller TO USE IT.
/// ///      1a. IF ITS A LARGE QUANTITY OF DATA, SPLIT THEM IN ALREADY STORED AND REMOTE, AND ALWAYS MAKE TWO DIFFERENT CALLS, TO INCREASE PARALLELISM
///              EXAMPLE: I NEED TO GET THE NEW EXERCISES, AND ALREADY HAVE THE PREVIOUS ONE. I MAKE TWO SEPARATE CALLS IN PARALLEL, INSTEAD OF ASKING FOR THE NEW AND LOADING THE OLD AND VICE VERSA
///          2a. MAKE db_model CALLS TRANSPARENT, AS IT WILL SET AN OBSERVED VALUE, IT COULD BE AS WELL A void CALL
///          2. I CREATE THE VIEW Client_MEnu_Api AND INJECT IT WITH THE CORRECT PROVIDER DEPENDENCY, TO OBSERVE AND USE THE DATA. I ASSOCIATE IT WITH THE PHASE clientMenu, AND CHOOSE ITS PREDECESSOR,
///             THAT WILL BE get_token_from_polar
///          3. I CHOOSE WHICH ACTION WITHIN THAT VIEW CAUSES THE CONTROLLER TO MODIFY THE MODEL PHASE TO clientMenu (WHICH IS CONSTANTLY OBSERVED BY THE STATE MACHINE) CAUSING THE VIEW TO
///             TRANSITION TO THE ASSOCIATED PHASE'S ONE.
///          4. NOW, WHEN WITHIN THE VIEW get_token_from_polar, A CERTAIN USER ACTION CAUSES THE TRANSITION TO HAPPEN AND THE DATA TO BE SHOWN, IN THIS CASE FASTER BECAUSE IT WAS OBSERVED DATA
///
///
class Controller {
  // Models
  static final Controller _instance = Controller();


  static getController(){
    return _instance;
  }


  void validateCredentials(String password, String name,BuildContext context){
    //TODO REAL AUTHENTICATION
    toViewMenu(context);
  }


  void registerUser(String password, String name,BuildContext context){
    //TODO REAL REGISTRATION
    toViewMenu(context);
  }



  void toggleAsc(BuildContext context) {
    Provider.of<AppState>(context,listen: false).toogleAsc();

  }
  void toInitial(BuildContext context) {
    Provider.of<AppState>(context,listen: false).setstate(PHASE.startingScreen);

  }

  void toRegister(BuildContext context) {
    Provider.of<AppState>(context,listen: false).setstate(PHASE.register);

  }



  //Future<bool> refreshActivities(BuildContext context) async {
  //return await fetchActivitiesByDate(context);
  //}

  //TODO SYNCH AFTER UPDATE OR CRASH ON FIRST START CARFEUL!!
  /*Future<bool> statsRoutine(BuildContext context) async {
    return await lock.synchronized(() async {
      DataBase().setStatistics(context);
      return true;
    });
  }*/
  /*
  Future<String> firstMessage() async {
    await lock.synchronized(() async {
      // Only this block can run (once) until done
      await DataBase().initDatabase();
    });
    return await lock.synchronized(() async {
      // Only this block can run (once) until done
      return await DataBase().fetchTable();
    });
  }
  void reset(BuildContext context) async {
    await lock.synchronized(() async {
      await DataBase().reset();
    });
  }
  Future<void> addToDb(BuildContext context,String name) async {
    Provider.of<AppState>(context,listen: false).addToBuffer();
    return DataBase().updateDummyTable(name);
  }*/




  void addActivity(BuildContext context,Map<dynamic,dynamic> newAc) {


    Provider.of<AppState>(context,listen: false).addActivity(newAc);

  }

  void flushActivity(BuildContext context) {


    Provider.of<AppState>(context,listen: false).refresh();

  }


  void toViewMenu(BuildContext context) {



    Provider.of<AppState>(context,listen: false).setstate(PHASE.clientMenu);

  }

  void changeColor(BuildContext context, Color color) {



    Provider.of<AppState>(context,listen: false).setColor(color);

  }


  void changeSecondColor(BuildContext context, Color color) {



    Provider.of<AppState>(context,listen: false).setSecond(color);

  }





/*
  Future<bool> fetchActivitiesByDate(BuildContext context) {
    return DataBase().fetchActivitiesBy(context,"expiredate");
  }
  Future<bool> fetchActivitiesBy(BuildContext context, String field) {
    Provider.of<AppState>(context,listen: false).setSort(field);
    return DataBase().fetchActivitiesBy(context,field);
  }
*/

// Services
}