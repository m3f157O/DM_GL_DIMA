import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
class ChartData {
  final num value;
  final num year;

  ChartData(this.value, this.year);
}

class ShowHeartbeat extends StatefulWidget {
  var color;

  var data;

  var title;


  ShowHeartbeat({
    Key? key,
    required this.data,
    required this.color,
    required this.title,
  }) : super(key: key);




  //todo remove bad practice
  @override
  RequestAndShow createState() => RequestAndShow(data: data,color: color,title: title);
}


class RequestAndShow extends State<ShowHeartbeat> {


  RequestAndShow({
    Key? key,
    required this.data,
    required this.color, required this.title,
  });


  final Map data;
  final Color color;
  final String title;

  List<ChartData> heartBeat=[];


  late TrackballBehavior _trackballBehavior;


  void processHeartbeat(Map toProcess) {
    for(int i=0;i<100;i++) {
      heartBeat.add(ChartData(i,i));
    }
  }






  @override
  void initState(){
    _trackballBehavior = TrackballBehavior(
        enable: true,
        // Display mode of trackball tooltip
        tooltipDisplayMode: TrackballDisplayMode.floatAllPoints
    );

    processHeartbeat(data);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {


    return Column(
      children: [
        Expanded( //
          flex: 1,// add this
          child: Center(
              heightFactor: 200,
              child:SfCartesianChart(


                trackballBehavior: _trackballBehavior,

                primaryXAxis: NumericAxis(

                  interactiveTooltip: const InteractiveTooltip(
                    enable: true,
                  ),
                ),
                primaryYAxis: NumericAxis(
                  interactiveTooltip: const InteractiveTooltip(
                      enable: true

                  ),

                ),



                title: ChartTitle(text: title),
                series: <ChartSeries<ChartData, num>>[
                  LineSeries<ChartData, num>(
                    dataSource: heartBeat,
                    color: color,
                    xValueMapper: (ChartData sales, _) => sales.year,
                    yValueMapper: (ChartData sales, _) => sales.value,

                  ),
                ],
              )),
        ),

      ],
    );

  }



}