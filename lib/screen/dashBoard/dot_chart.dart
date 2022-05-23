import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
class DotCharts extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final List<SalesData> chartData = [
      SalesData(DateTime.parse('2010-01-08'),0),
      SalesData(DateTime.parse('2011-01-08'), 10),
      SalesData(DateTime.parse('2012-01-08'), 15),
      SalesData(DateTime.parse('2013-01-08'), 18),
      SalesData(DateTime.parse('2014-01-08'), 25)
    ];

    return Scaffold(
        body: Center(
            child: Container(
                child: SfCartesianChart(
                    primaryXAxis: DateTimeAxis(),
                    series: <ChartSeries>[
                      // Renders line chart
                      LineSeries<SalesData, DateTime>(
                          dataSource: chartData,
                          xValueMapper: (SalesData sales, _) => sales.year,
                          yValueMapper: (SalesData sales, _) => sales.sales
                      )
                    ]
                )
            )
        )
    );
  }
}
class SalesData {
  SalesData(this.year, this.sales);
   DateTime year;
   double sales;
}