import 'package:flutter/material.dart';
import 'package:finance_app/data/model/add_date.dart';
import 'package:finance_app/data/utlity.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

// ignore: must_be_immutable
class Chart extends StatefulWidget {
  int indexx;
  Chart({Key? key, required this.indexx}) : super(key: key);

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  List<Add_data>? a;
  bool b = true;
  bool j = true;

  @override
  Widget build(BuildContext context) {
    switch (widget.indexx) {
      case 0:
        a = today();
        b = true;
        j = true;
        break;
      case 1:
        a = week();
        b = false;
        j = true;
        break;
      case 2:
        a = month();
        b = false;
        j = true;
        break;
      case 3:
        a = year();
        b = false;
        j = false;
        break;
      default:
    }
    return Container(
      width: double.infinity,
      height: 250,
      child: SfCartesianChart(
        
        isTransposed: false,
        enableAxisAnimation: true,
        margin: const EdgeInsets.all(10),
        primaryXAxis: CategoryAxis(),
        primaryYAxis: NumericAxis(
          numberFormat: NumberFormat.compact(),
          labelFormat: '{value}',
          edgeLabelPlacement: EdgeLabelPlacement.shift,
          axisLine: AxisLine(width: 0),
          majorTickLines: MajorTickLines(size: 0),
        ),
        series: <ChartSeries<SalesData, String>>[
          SplineSeries<SalesData, String>(
            color: Color.fromARGB(255, 47, 125, 121),
            width: 5,
            animationDuration: 3,
            dataSource: <SalesData>[
              ...List.generate(time(a!, b ? true : false).length, (index) {
                return SalesData(
                    j
                        ? b
                            ? a![index].datetime.hour.toString()
                            : a![index].datetime.day.toString()
                        : a![index].datetime.month.toString(),
                    b
                        ? index > 0
                            ? time(a!, true)[index] + time(a!, true)[index - 1]
                            : time(a!, true)[index]
                        : index > 0
                            ? time(a!, false)[index] +
                                time(a!, false)[index - 1]
                            : time(a!, false)[index]);
              })
            ],
            xValueMapper: (SalesData sales, _) => sales.year,
            yValueMapper: (SalesData sales, _) => sales.sales,
            sortingOrder: SortingOrder.ascending,
            sortFieldValueMapper: (SalesData data, _) => data.year
          )
        ],
      ),
    );
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final int sales;
}
