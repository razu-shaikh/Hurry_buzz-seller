import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineCharts extends StatelessWidget {

  final List<int> orderList;
  LineCharts(this.orderList, {Key? key}) : super(key: key);

  List<FlSpot> flspots = [
    FlSpot(0, 0),
  ];

  @override
  Widget build(BuildContext context) {
    print(orderList);
    const cutOffYValue = 0.0;
    const yearTextStyle = TextStyle(fontSize: 8, color: Colors.black);
    for(var i = 0;i<orderList.length;i++){
      flspots.add(
        FlSpot(
          double.parse(i.toString()),
          orderList[i].toDouble(),
        ),
      );
    }
    return SizedBox(
      height: 300,
      child: LineChart(
        LineChartData(
          lineTouchData: LineTouchData(enabled: false),
          lineBarsData: [
            LineChartBarData(
              spots:
                flspots,
                // FlSpot(0,0 ),
                // FlSpot(1, 1),
                // FlSpot(2, 2),
                // FlSpot(3, 3),
                // FlSpot(4, 4),
                // FlSpot(5, 5),
                // FlSpot(6, 6),
                // FlSpot(7, 7),
                // FlSpot(8, 8),
                // FlSpot(9, 9),
                // FlSpot(10, 10),
                // FlSpot(11, 11),

              isCurved: true,
              barWidth: 2,
              colors: [
                Colors.black,
              ],
              belowBarData: BarAreaData(
                show: true,
                colors: [Colors.lightBlue.withOpacity(0.5)],
                cutOffY: cutOffYValue,
                applyCutOffY: true,
              ),
              aboveBarData: BarAreaData(
                show: true,
                 colors: [Colors.lightGreen.withOpacity(0.5)],
                cutOffY: cutOffYValue,
                applyCutOffY: true,
              ),
              dotData: FlDotData(
                show: false,
              ),
            ),
          ],
          minY: 0,
          titlesData: FlTitlesData(
            bottomTitles: SideTitles(
                showTitles: true,
                reservedSize: 5,
                getTitles: (value) {
                  switch (value.toInt()) {
                    case 0:
                      return 'Jan';
                    case 1:
                      return 'Feb';
                    case 2:
                      return 'Mar';
                    case 3:
                      return 'Apr';
                    case 4:
                      return 'May';
                    case 5:
                      return 'Jun';
                    case 6:
                      return 'July';
                    case 7:
                      return 'Aug';
                    case 8:
                      return 'Sep';
                    case 9:
                      return 'Oct';
                    case 10:
                      return ' Nov';
                    case 11:
                      return 'Dec';
                    default:
                      return '';
                  }
                }),
            leftTitles: SideTitles(
              showTitles: true,
              getTitles: (value) {
                return '${value}';
              },
            ),
          ),
          axisTitleData: FlAxisTitleData(
              leftTitle: AxisTitle(showTitle: true,textStyle:yearTextStyle , titleText: 'Value', margin: 10),
              bottomTitle: AxisTitle(
                  showTitle: true,
                  margin: 10,
                  titleText: 'Year',
                  textStyle: yearTextStyle,
                  textAlign: TextAlign.right)),
          gridData: FlGridData(
            show: true,
            checkToShowHorizontalLine: (double value) {
              return value == 1 || value == 2 || value == 3 || value == 4 || value == 5 || value == 6 || value == 7 || value == 8 ;
            },
          ),
        ),
      ),
    );
  }
}