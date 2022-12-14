import 'package:dima_project/model/phases.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


/// -----------------------------------
///           MODEL
/// -----------------------------------


class AppState extends ChangeNotifier {


  //CAREFUL, using setters gives me problems
  Map FastSortAdapter=
  {
    "name":0,
    "expiredate":1,
  };

  int sort=0;
  num totalEntries=0;
  num totalWords=0;
  num totalChars=0;

  num wordTuples=0;
  num charTuples=0;

  Duration totalTime=Duration.zero;
  Color main=Colors.white;
  Color text=Colors.white;
  Color second=Colors.blue;
  bool asc=false;
  PHASE _state=PHASE.startingScreen;

  List<Map<dynamic,dynamic>> savedActivities=[{"name":"duug","expiredate":"1"},{"name":"duug","expiredate":"2"},{"name":"duug","expiredate":"3"},{"name":"duug","expiredate":"4"},{"name":"duug","expiredate":"5"},];
  List<Map<dynamic,dynamic>> newActivities=[];



  PHASE get state => _state;

  void setstate(PHASE i) {
    _state = i;
    notifyListeners();
  }





  void addActivity(Map<dynamic,dynamic> newAc) {

    newActivities.add(newAc);
    notifyListeners();

  }

  void refresh() {
    savedActivities.addAll(newActivities);
    newActivities=[];
    notifyListeners();
  }


  void setColor(Color i) {
    main=i;
    notifyListeners();
  }

  void setSecond(Color i) {
    second=i;
    notifyListeners();
  }

  void setSort(String i) {
    print("setting sort to");
    print(FastSortAdapter[i]);

    sort=FastSortAdapter[i];
    notifyListeners();
  }

  void setEntries(int i) {
    print(i);
    totalEntries=i;
    notifyListeners();
  }

  void setWordTuples(num i) {
    print(i);
    wordTuples=i;
    notifyListeners();
  }

  void setCharTuples(num i) {
    print(i);
    charTuples=i;
    notifyListeners();
  }

  void setWords(num i) {
    print(i);
    totalWords=i;
    notifyListeners();
  }

  void setChars(num i) {
    print(i);
    totalChars=i;
    notifyListeners();
  }



  void setTime(Duration i) {
    print("setting calories to");
    print(i);

    totalTime=i;
    notifyListeners();
  }

  void toogleAsc() {
    asc=!asc;
    savedActivities=List.from(savedActivities.reversed);
    notifyListeners();
  }


  void setActivities(List<Map<dynamic,dynamic>> i) {
    savedActivities = i;
    notifyListeners();
  }











// Eventually other stuff would go here, appSettings, premiumUser flags, currentTheme, etc...
}