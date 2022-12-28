import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:syncfusion_flutter_charts/charts.dart';


class graphpage extends StatefulWidget {
  String name = '';
  graphpage({required this.name, Key? key}) : super(key: key);

  @override
  State<graphpage> createState() => _graphpageState();
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}

class _graphpageState extends State<graphpage> {
  List<_SalesData> data = [
    _SalesData('Jan', 40),
    _SalesData('Feb', 28),
    _SalesData('Mar', 34),
    _SalesData('Apr', 32),
    _SalesData('May', 40)
  ];
  @override
  Widget build(BuildContext context) {
    var nameSeries = "${widget.name}Series";
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.name} Graph"),
      ),
      body: widget.name == 'Line'
          ? SfCartesianChart(
              primaryXAxis: CategoryAxis(),
              // Chart title
              title: ChartTitle(text: ''),
              // Enable legend
              legend: Legend(isVisible: true),
              // Enable tooltip
              tooltipBehavior: TooltipBehavior(enable: true),
              series: <ChartSeries<_SalesData, String>>[
                  LineSeries<_SalesData, String>(
                      dataSource: data,
                      xValueMapper: (_SalesData sales, _) => sales.year,
                      yValueMapper: (_SalesData sales, _) => sales.sales,
                      name: 'Sales',
                      // Enable data label
                      dataLabelSettings: DataLabelSettings(isVisible: true))
                ])
          : widget.name == 'Column'
              ? SfCartesianChart(
                  primaryXAxis: CategoryAxis(),
                  // Chart title
                  title: ChartTitle(text: ''),
                  // Enable legend
                  legend: Legend(isVisible: true),
                  // Enable tooltip
                  tooltipBehavior: TooltipBehavior(enable: true),
                  series: <ChartSeries<_SalesData, String>>[
                      ColumnSeries<_SalesData, String>(
                          dataSource: data,
                          xValueMapper: (_SalesData sales, _) => sales.year,
                          yValueMapper: (_SalesData sales, _) => sales.sales,
                          name: 'Sales',
                          // Enable data label
                          dataLabelSettings: DataLabelSettings(isVisible: true))
                    ])
              // : widget.name == 'Pie'
              //     ? SfCartesianChart(
              //         primaryXAxis: CategoryAxis(),
              //         // Chart title
              //         title: ChartTitle(text: ''),
              //         // Enable legend
              //         legend: Legend(isVisible: true),
              //         // Enable tooltip
              //         tooltipBehavior: TooltipBehavior(enable: true),
              //         series: <ChartSeries<_SalesData, String>>[
              //             PieSeries<_SalesData, String>(
              //                 dataSource: data,
              //                 xValueMapper: (_SalesData sales, _) => sales.year,
              //                 // yValueMapper: (_SalesData sales, _) => sales.sales,
              //                 name: 'Sales',
              //                 // Enable data label
              //                 dataLabelSettings:
              //                     DataLabelSettings(isVisible: true))
              //           ])
                  : SfCartesianChart(
                      primaryXAxis: CategoryAxis(),
                      // Chart title
                      title: ChartTitle(text: ''),
                      // Enable legend
                      legend: Legend(isVisible: true),
                      // Enable tooltip
                      // tooltipBehavior: TooltipBehavior(enable: true),
                      series: <ChartSeries<_SalesData, String>>[
                          BarSeries<_SalesData, String>(
                              dataSource: data,
                              xValueMapper: (_SalesData sales, _) => sales.year,
                              yValueMapper: (_SalesData sales, _) =>
                                  sales.sales,
                              name: 'Sales',
                              // Enable data label
                              dataLabelSettings:
                                  DataLabelSettings(isVisible: true))
                        ]),
    );
  }
}
