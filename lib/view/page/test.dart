// import 'package:flutter/material.dart';

// class MyWidget extends StatelessWidget {
//   final List<int> shades = [100, 200, 300, 400, 500, 600, 700, 800, 900];
//   final ScrollController _horizontal = ScrollController(),
//       _vertical = ScrollController();

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 500,
//       width: 400,
//       child: Scrollbar(
//         controller: _horizontal,
//         thumbVisibility: true,
//         trackVisibility: true,
//         notificationPredicate: (notif) => notif.depth == 0,
//         child: SingleChildScrollView(
//           controller: _horizontal,
//           scrollDirection: Axis.horizontal,
//           child: Row(
//             children: [Container(width: 400,,height: 300,)
//               DataTable(
//                 columns: const <DataColumn>[
//                   DataColumn(label: Text('Preview')),
//                   DataColumn(label: Text('Color')),
//                   DataColumn(label: Text('Shade')),
//                 ],
//                 rows: [
//                   for (var color in Colors.primaries)
//                     for (var shade in shades)
//                       DataRow(
//                         cells: [
//                           DataCell(Container(
//                               height: 20, width: 50, color: color[shade])),
//                           DataCell(Text(color.toString())),
//                           DataCell(Text('$shade')),
//                         ],
//                       ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
