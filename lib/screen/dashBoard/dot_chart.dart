import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
class DotCharts extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final List<SalesData> chartData = [
      SalesData(DateTime.parse('2017-01-08'),0),
      SalesData(DateTime.parse('2018-01-08'),5),
      SalesData(DateTime.parse('2019-01-08'),10),
      SalesData(DateTime.parse('2020-01-08'),18),
      SalesData(DateTime.parse('2021-01-08'),25),
      SalesData(DateTime.parse('2022-01-08'),28)
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