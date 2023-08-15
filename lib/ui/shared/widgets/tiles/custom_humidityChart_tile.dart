import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CustomHumidityChartTile extends StatelessWidget {
  final double? humidity;

  const CustomHumidityChartTile({
    this.humidity, 
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 100,
      child: Stack(
        alignment: Alignment.center,
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: PieChart(
              PieChartData(
                  centerSpaceRadius: 50,
                  sectionsSpace: 0,
                  startDegreeOffset: -90,
                  sections: [
                    PieChartSectionData(
                      color: Theme.of(context).colorScheme.primary,
                      radius: 10,
                      value: humidity,
                      showTitle: false,
                    ),
                    PieChartSectionData(
                      color: Theme.of(context).colorScheme.shadow,
                      radius: 10,
                      value: 100 - (humidity??0),
                      showTitle: false,
                    ),
                  ]),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${(humidity??0).toStringAsFixed(1)}%",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}