// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';

// class Test extends StatefulWidget {
//   const Test({super.key});

//   @override
//   State<Test> createState() => _TestState();
// }

// class _TestState extends State<Test> {
//   late TooltipBehavior _tooltipBehavior;
//   late TrackballBehavior _trackballBehavior;

// //   @override
// //   void initState() {
// //     _trackballBehavior = TrackballBehavior(
// //         // Enables the trackball
// //         enable: true,
// //         tooltipSettings: InteractiveTooltip(enable: true, color: Colors.red));
// //     _tooltipBehavior = TooltipBehavior(enable: true);
// //     super.initState();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     _trackballBehavior = TrackballBehavior(
// //         // Enables the trackball
// //         enable: true,
// //         tooltipSettings: InteractiveTooltip(enable: true, color: Colors.red));
// //     _tooltipBehavior = TooltipBehavior(enable: true);
// //     return Scaffold(
// //       body: Center(
// //         child: Container(
// //           child: SfCartesianChart(
// //             // tooltipBehavior: _tooltipBehavior,
// //             /// To set the track ball as true and customized trackball behaviour.
// //             trackballBehavior: TrackballBehavior(
// //               // Enables the trackball
// //               enable: true,
// //               tooltipSettings:
// //                   InteractiveTooltip(enable: true, color: Colors.red),
// //               activationMode: ActivationMode.singleTap,
// //             ),
// //             primaryXAxis: CategoryAxis(),
// //             series: <ChartSeries>[
// //               LineSeries<ChartData, String>(
// //                   dataSource: [
// //                     ChartData('Jan', 35, Colors.red),
// //                     ChartData('Feb', 28, Colors.green),
// //                     ChartData('Mar', 34, Colors.blue),
// //                     ChartData('Apr', 32, Colors.pink),
// //                     ChartData('May', 40, Colors.black)
// //                   ],
// //                   // Bind the color for all the data points from the data source
// //                   pointColorMapper: (ChartData data, _) => data.color,
// //                   xValueMapper: (ChartData data, _) => data.x,
// //                   yValueMapper: (ChartData data, _) => data.y)
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

//   @override
//   void initState() {
//     super.initState();
//     // _tooltipBehavior = TooltipBehavior(enable: true);
//     _trackballBehavior = TrackballBehavior(
//       enable: true,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Text'),
//       ),
//       body: Center(
//         child: Container(
//           child: SfCartesianChart(
//             legend: Legend(
//                 isVisible: true,
//                 overflowMode: LegendItemOverflowMode.wrap,
//                 position: LegendPosition.bottom),

//             trackballBehavior: TrackballBehavior(
//               builder:
//                   (BuildContext context, TrackballDetails trackballDetails) {
//                 return Container(
//                     width: 150,
//                     height: 100,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                         color: Colors.blueGrey),
//                     child: Column(
//                       children: [
//                         Text(
//                             '${trackballDetails.groupingModeInfo!.points.first.y}'),
//                         Text(
//                             '${trackballDetails.groupingModeInfo!.points[1].y}'),
//                       ],
//                     ));
//               },
//               markerSettings: TrackballMarkerSettings(
//                   markerVisibility: TrackballVisibilityMode.visible),
//               tooltipDisplayMode: TrackballDisplayMode.groupAllPoints,
//               tooltipAlignment: ChartAlignment.near,
//               enable: true,
//               tooltipSettings: InteractiveTooltip(
//                   enable: true, format: '시간 : point.x  /  온도 : point.y.C'),
//               activationMode: ActivationMode.singleTap,
//             ),
//             // Initialize category axis
//             primaryXAxis: CategoryAxis(),
//             primaryYAxis: NumericAxis(minimum: 10, maximum: 30, interval: 5),
//             series: <ChartSeries>[
//               // lineSeriesList(//프로방디ㅓ어저주거젖쭈ㅠ)
//               // Initialize line series
//               LineSeries<ChartData, String>(
//                   name: "test1",

//                   // Enables the tooltip for individual series
//                   enableTooltip: true,
//                   dataSource: [
//                     // Bind data source
//                     ChartData(18.35, 15),
//                     ChartData(19.2, 20),
//                     ChartData(20.2, 24),
//                     ChartData(22.2, 26),
//                     ChartData(23.8, 30)
//                   ],
//                   xValueMapper: (ChartData data, _) =>
//                       "${data.x.toString().split(".")[0]}:${data.x.toString().split(".")[1]}${data.x.toString().split(".")[1].length == 1 ? "0" : ""}",
//                   yValueMapper: (ChartData data, _) => data.y),
//               LineSeries<ChartData, String>(
//                   name: "test2",

//                   // Enables the tooltip for individual series
//                   enableTooltip: true,
//                   dataSource: [
//                     // Bind data source
//                     ChartData(18.35, 15),
//                     ChartData(19.2, 24),
//                     ChartData(20.2, 27),
//                     ChartData(22.2, 29),
//                     ChartData(23.8, 22)
//                   ],
//                   xValueMapper: (ChartData data, _) =>
//                       "${data.x.toString().split(".")[0]}:${data.x.toString().split(".")[1]}${data.x.toString().split(".")[1].length == 1 ? "0" : ""}",
//                   yValueMapper: (ChartData data, _) => data.y),
//               // LineSeries<ChartData, String>(
//               //     name: "test1",

//               //     // Enables the tooltip for individual series
//               //     enableTooltip: true,
//               //     dataSource: [
//               //       // Bind data source
//               //       ChartData(18.35, 24),
//               //       ChartData(19.2, 25),
//               //       ChartData(20.2, 29),
//               //       ChartData(22.2, 15),
//               //       ChartData(23.8, 19)
//               //     ],
//               //     xValueMapper: (ChartData data, _) => data.x.toString(),
//               //     yValueMapper: (ChartData data, _) => data.y),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class ChartData {
//   ChartData(this.x, this.y);
//   final double x;
//   final double y;
// }

// List<ChartData> chatDatas(List<Map<String, dynamic>> sensorValues) {
//   List<ChartData> chatDatas = [];
//   sensorValues.forEach((value) {
//     double timeValue;
//     double measureValue;
//     String hourAndMinute =
//         DateFormat('HH:mm').format(DateTime.parse(value["dateTime"]));
//     timeValue = double.parse(hourAndMinute.split(":")[0]) +
//         double.parse(hourAndMinute.split(":")[1]) * 0.01;
//     measureValue = value["measureValue"];

//     chatDatas.add(ChartData(timeValue, measureValue));
//   });

//   return chatDatas;
// }

// List<LineSeries<ChartData, double>> lineSeriesList(
//     List<Map<String, dynamic>> sensorOfficeList) {
//   List<LineSeries<ChartData, double>> lineSeriesList = [];

//   for (int i = 0; i < sensorOfficeList.length; i++) {
//     for (int j = 0; j < sensorOfficeList[i]["sensorList"].length; j++) {
//       LineSeries<ChartData, double> temp = LineSeries<ChartData, double>(
//           name: "test1",
//           enableTooltip: true,
//           dataSource:
//               chatDatas(sensorOfficeList[i]["sensorList"][j]["sensorValues"]),
//           xValueMapper: (ChartData data, _) => data.x,
//           yValueMapper: (ChartData data, _) => data.y);

//       lineSeriesList.add(temp);
//     }
//   }
//   return lineSeriesList;
// }
