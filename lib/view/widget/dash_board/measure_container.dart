import 'package:clean_arch/common/constants/color_list.dart';
import 'package:clean_arch/common/constants/text_style.dart';
import 'package:clean_arch/provider/impl/dash_board_provider_impl.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

Map<int, String> officeMapper = {};

class MeasureContainer extends StatelessWidget {
  final String sensorType;

  MeasureContainer({required this.sensorType, super.key});

  @override
  Widget build(BuildContext context) {
    ColorList.initColor();
    DashBoardProvider dashBoardProviderRead =
        Provider.of<DashBoardProvider>(context, listen: false);

    return FutureBuilder(
        future: Future.wait([
          sensorType == "습도"
              ? Provider.of<DashBoardProvider>(context, listen: false)
                  .getHumiditySensorValuesByOfficeBranchId()
              : Provider.of<DashBoardProvider>(context, listen: false)
                  .getTemperatureSensorValuesByOfficeBranchId(),
        ]),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData == false) {
            return const Center(
                child: Text("Loading...", style: snapShotStyle));
          } else if (snapshot.hasError) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Error: ${snapshot.error}',
                style: const TextStyle(fontSize: 15),
              ),
            );
          } else if (snapshot.data[0] == "fail") {
            return Container(
              padding: EdgeInsets.only(right: 25, top: 20, bottom: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                border: Border.all(color: Colors.white10),
              ),
              height: 300,
              child: Center(
                child: Text(
                  'No Data',
                  style: snapShotSensorStyle,
                ),
              ),
            );
          } else {
            return Container(
              padding: EdgeInsets.only(right: 25, top: 20, bottom: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                border: Border.all(color: Colors.white10),
              ),
              height: 300,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                            style: sensorStyle,
                            "평균${sensorType}:${sensorType == "온도" ? dashBoardProviderRead.avgTemperatureMeasureValue : dashBoardProviderRead.avgHumidityMeasureValue}.C"),
                        SizedBox(height: 20),
                        Text(
                            style: sensorStyle,
                            "최고${sensorType}:${sensorType == "온도" ? dashBoardProviderRead.maxTemperatureMeasureValue : dashBoardProviderRead.maxHumidityMeasureValue}.C"),
                        SizedBox(height: 20),
                        Text(
                            style: sensorStyle,
                            "최저${sensorType}:${sensorType == "온도" ? dashBoardProviderRead.minTemperatureMeasureValue : dashBoardProviderRead.minHumidityMeasureValue}.C"),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: LineChart(
                      swapAnimationDuration: Duration(milliseconds: 150),
                      LineChartData(
                        lineTouchData: LineTouchData(
                          getTouchedSpotIndicator: (LineChartBarData barData,
                              List<int> spotIndexes) {
                            return spotIndexes.map((spotIndex) {
                              return TouchedSpotIndicatorData(
                                FlLine(color: Colors.yellow, strokeWidth: 4),
                                FlDotData(
                                  show: true,
                                  getDotPainter:
                                      (spot, percent, barData, index) {
                                    return FlDotCirclePainter(
                                      radius: 5,
                                      color: Colors.white,
                                      strokeWidth: 3,
                                      strokeColor:
                                          Color.fromARGB(255, 63, 78, 120),
                                    );
                                  },
                                ),
                              );
                            }).toList();
                          },
                          touchTooltipData: LineTouchTooltipData(
                            fitInsideVertically: true,
                            fitInsideHorizontally: true,
                            tooltipBgColor: Color.fromARGB(255, 58, 65, 77)
                                .withOpacity(0.8),
                            getTooltipItems: (List<LineBarSpot> lineBarsSpots) {
                              List<LineTooltipItem> lineToolTipItemList = [];
                              for (int i = 0; i < lineBarsSpots.length; i++) {
                                final flSpot = lineBarsSpots[i];
                                final hour =
                                    flSpot.x.toStringAsFixed(2).split(".")[0];
                                final min =
                                    flSpot.x.toStringAsFixed(2).split(".")[1];
                                LineTooltipItem temp = LineTooltipItem(
                                  '${officeMapper[i]} \n',
                                  const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: '${hour}시 ${min}분\n',
                                      style: TextStyle(
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                    TextSpan(
                                      text:
                                          "${flSpot.y.toStringAsFixed(1)}.C\n",
                                      style: TextStyle(
                                        color: Colors.grey[100],
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                );
                                lineToolTipItemList.add(temp);
                              }
                              return lineToolTipItemList;
                            },
                          ),
                          handleBuiltInTouches: true,
                        ),
                        gridData: FlGridData(
                          show: true,
                          drawVerticalLine: true,
                          horizontalInterval: 5,
                          verticalInterval: 1,
                        ),
                        titlesData: FlTitlesData(
                          show: true,
                          rightTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                          topTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              interval: 1,
                              showTitles: true,
                              reservedSize: 35,
                              getTitlesWidget: bottomTitleWidgets,
                            ),
                          ),
                          leftTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              getTitlesWidget: leftTitleWidgets,
                              reservedSize: 40,
                            ),
                          ),
                        ),
                        borderData: FlBorderData(
                          show: true,
                          border: Border.all(color: const Color(0xff37434d)),
                        ),
                        minX: double.parse(
                                DateFormat('HH').format(DateTime.now())) -
                            dashBoardProviderRead.duration,
                        maxX: double.parse(
                                DateFormat('HH').format(DateTime.now())) +
                            1,
                        minY: 10,
                        maxY: 30,
                        lineBarsData: lineChartBarDataList(
                            dashBoardProviderRead.humidityOfficeList!),
                      ),
                    ),
                    ////
                  )
                ],
              ),
            );
          }
        });
  }
}

Widget bottomTitleWidgets(double value, TitleMeta meta) {
  const style = TextStyle(
    color: Color(0xff68737d),
    fontWeight: FontWeight.bold,
    fontSize: 13,
  );

  return SideTitleWidget(
    axisSide: meta.axisSide,
    space: 16,
    child: Text(meta.formattedValue + ":00", style: style),
  );
}

Widget leftTitleWidgets(double value, TitleMeta meta) {
  const style = TextStyle(
    color: Color(0xff67727d),
    fontWeight: FontWeight.bold,
    fontSize: 13,
  );

  return SideTitleWidget(
    axisSide: meta.axisSide,
    space: 16,
    child: Text(
      meta.formattedValue + ".C",
      style: style,
    ),
  );
}

List<FlSpot> flSpots(List<Map<String, dynamic>> sensorValues) {
  List<FlSpot> spots = [];
  sensorValues.forEach((value) {
    double timeValue;
    double measureValue;
    String hourAndMinuteAndSecond =
        DateFormat('HH:mm').format(DateTime.parse(value["dateTime"]));
    timeValue = double.parse(hourAndMinuteAndSecond.split(":")[0]) +
        double.parse(hourAndMinuteAndSecond.split(":")[1]) * 0.01;

    measureValue = value["measureValue"];

    spots.add(FlSpot(timeValue, measureValue));
  });

  return spots;
}

List<LineChartBarData>? lineChartBarDataList(
    List<Map<String, dynamic>> sensorOfficeList) {
  List<LineChartBarData> lineChartBarDataList = [];

  for (int i = 0; i < sensorOfficeList.length; i++) {
    officeMapper[i] = sensorOfficeList[i]["name"];
    for (int j = 0; j < sensorOfficeList[i]["sensorList"].length; j++) {
      LineChartBarData temp = LineChartBarData(
        color: ColorList.getColor(),
        spots: flSpots(sensorOfficeList[i]["sensorList"][j]["sensorValues"]
            .cast<Map<String, dynamic>>()),
        isCurved: false,
        barWidth: 3,
        // isStrokeCapRound: true,
        dotData: FlDotData(
          show: true,
        ),
      );
      lineChartBarDataList.add(temp);
    }
  }

  return lineChartBarDataList;
}
