import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:github_stats/model/graphModal.dart';

// ignore: must_be_immutable
class Graph3 extends StatelessWidget {
  List<GraphRepo> data;
  Map<String, int> languages = new Map<String, int>();

  Graph3({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    data.forEach((element) {
      if(languages.containsKey(element.language)){
        languages[element.language] += languages[element.language];
      } else if (element.language != null) {
        languages[element.language] = 1;
      }
    });
    print(languages);
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
              child: Text("Languages"),
              alignment: Alignment.topCenter,
            ),
          ),
        ],
      ),
    );
  }

  List<charts.Series<LanguageStats, String>> _createSampleData2() {
    var graphData = List<LanguageStats>();
    var otherLang = 0;

    languages.forEach((key, value) {
      if(value <= 2){
        otherLang += value;
      } else {
        graphData.add(new LanguageStats(key.toString(), value));
      }
    });

    graphData.add(new LanguageStats("Others", otherLang));

    return [
      new charts.Series<LanguageStats, String>(
        id: 'Languages',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (LanguageStats language, _) => language.name,
        measureFn: (LanguageStats language, _) => language.count,
        data: graphData,
      )
    ];
  }
}

class LanguageStats {
  final String name;
  final int count;

  LanguageStats(this.name, this.count);
}
