import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class Graph2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.width * 0.7,
      decoration: BoxDecoration(
        //color: CupertinoColors.darkBackgroundGray.withOpacity(0.3),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: charts.LineChart(
          _createSampleData(),
          animate: true,
          animationDuration: Duration(seconds: 2),
        ),
      ),
    );
  }

  static List<charts.Series<Task, int>> _createSampleData() {
    final data = [
      new Task(0, 5),
      new Task(1, 25),
      new Task(2, 100),
      new Task(3, 75),
    ];

    return [
      new charts.Series<Task, int>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (Task sales, _) => sales.year,
        measureFn: (Task sales, _) => sales.sales,
        data: data,
      )
    ];
  }
}

class Task {
  final int year;
  final int sales;

  Task(this.year, this.sales);
}
