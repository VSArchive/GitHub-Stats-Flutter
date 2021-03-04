import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:github_stats/model/graphModal.dart';

// ignore: must_be_immutable
class Graph1 extends StatelessWidget {
  List<GraphRepo> data;
  Map<String, int> stars = new Map<String, int>();

  Graph1({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    data.forEach((element) {
      if (element.stargazersCount > 0) {
        stars[element.name] = element.stargazersCount;
      }
    });
    print(Stars);
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
              child: Text("Stars"),
              alignment: Alignment.topCenter,
            ),
          ),
        ],
      ),
    );
  }

  List<charts.Series<Stars, String>> _createSampleData2() {
    var graphData = List<Stars>();

    stars.forEach((key, value) {
      if (key.toString().length < 10) {
        graphData.add(new Stars(key.toString(), value));
      } else {
        graphData
            .add(new Stars(key.toString().substring(0, 10) + "...", value));
      }
    });

    return [
      new charts.Series<Stars, String>(
        id: 'Stars',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (Stars stars, _) => stars.name,
        measureFn: (Stars stars, _) => stars.count,
        data: graphData,
      )
    ];
  }
}

class Stars {
  final String name;
  final int count;

  Stars(this.name, this.count);
}
