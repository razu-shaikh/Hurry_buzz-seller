import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
class DotCharts extends StatelessWidget {

  final List<double> salesList;
  DotCharts(this.salesList, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<SalesData> chartData;
    if(salesList.isEmpty){
      chartData = [
       SalesData('Jan',0),
       SalesData('Feb',0),
       SalesData('Mar',0),
       SalesData('Apr',0),
       SalesData('May',0),
       SalesData('Jun',0),
       SalesData('Jul',0),
       SalesData('Aug',0),
       SalesData('Sep',0),
       SalesData('Oct',0),
       SalesData('Nov',0),
       SalesData('Dec',0),

     ];

   }else{
      chartData = [
       SalesData('Jan',salesList[0]),
       SalesData('Feb',salesList[1]),
       SalesData('Mar',salesList[2]),
       SalesData('Apr',salesList[3]),
       SalesData('May',salesList[4]),
       SalesData('Jun',salesList[5]),
       SalesData('Jul',salesList[6]),
       SalesData('Aug',salesList[7]),
       SalesData('Sep',salesList[8]),
       SalesData('Oct',salesList[9]),
       SalesData('Nov',salesList[10]),
       SalesData('Dec',salesList[11]),

     ];
   }


    return Scaffold(
        body: Center(
            child: Container(
                child: SfCartesianChart(
                    primaryXAxis: CategoryAxis(),
                    series: <ChartSeries>[
                      // Renders line chart
                      LineSeries<SalesData, String>(
                          dataSource: chartData,
                          xValueMapper: (SalesData sales, _) => sales.month,
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
  SalesData(this.month, this.sales);
   String month;
   double sales;
}