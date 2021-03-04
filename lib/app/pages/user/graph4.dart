import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:github_stats/model/graphModal.dart';

// ignore: must_be_immutable
class Graph4 extends StatelessWidget {
  List<GraphRepo> data;
  Map<String, int> issues = new Map<String, int>();

  Graph4({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    data.forEach((element) {
      if (element.openIssuesCount > 0) {
        issues[element.name] = element.openIssuesCount;
      }
    });
    print(issues);
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.width * 0.7,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: charts.BarChart(
              _createSampleData2(),
              animate: true,
              animationDuration: Duration(seconds: 1),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: double.infinity,
              child: Text("Open Issues"),
              alignment: Alignment.topCenter,
            ),
          ),
        ],
      ),
    );
  }

  List<charts.Series<Issues, String>> _createSampleData2() {
    var graphData = List<Issues>();

    issues.forEach((key, value) {
      if (key.toString().length < 10) {
        graphData.add(new Issues(key.toString(), value));
      } else {
        graphData
            .add(new Issues(key.toString().substring(0, 10) + "...", value));
      }
    });

    return [
      new charts.Series<Issues, String>(
        id: 'Issues',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (Issues issues, _) => issues.name,
        measureFn: (Issues issues, _) => issues.count,
        data: graphData,
      )
    ];
  }
}

class Issues {
  final String name;
  final int count;

  Issues(this.name, this.count);
}
