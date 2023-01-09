// import 'package:clean_arch/common/util/class_builder.dart';
// import 'package:clean_arch/model/base_model.dart';
// import 'package:clean_arch/provider/impl/table_provider_impl.dart';
// import 'package:clean_arch/view/widget/table/table_search/table_container.dart';
// import 'package:clean_arch/view/widget/table/table_view/table_view.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class MultiCUDialogButton extends StatelessWidget {
//   final Size? size;
//   final EdgeInsetsGeometry contentPadding;
//   final double iconSize;
//   final InputBorder? border;
//   final Type model;
//   final String name;
//   const MultiCUDialogButton(
//       {this.size,
//       this.contentPadding = EdgeInsets.zero,
//       this.iconSize = 25,
//       this.border,
//       required this.model,
//       required this.name,
//       super.key});

//   @override
//   Widget build(BuildContext context) {
//     final TableViewForCuDialog table = ClassBuilder.getTableView(model, 300)!;
//     final TableSearchContainer search =
//         ClassBuilder.getTableSearchContainer(model)!;
//     final TableProvider provider =
//         ClassBuilder.getTableProvider(model, false, context)!;
//     return ElevatedButton(
//       style: ButtonStyle(
//           fixedSize: MaterialStateProperty.all(size ?? Size(100, 50))),
//       child: Text(name),
//       onPressed: () {
//         table.setisMultiDialog(true);
//         search.setIsCUdialog(true);
//         showDialog(
//           barrierColor: const Color.fromRGBO(0, 0, 0, 0.3),
//           context: context,
//           barrierDismissible: false,
//           builder: (BuildContext context) {
//             return Material(
//               color: Colors.transparent,
//               child: MaterialButton(
//                 padding: EdgeInsets.zero,
//                 splashColor: Colors.transparent,
//                 highlightColor: Colors.transparent,
//                 enableFeedback: false,
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//                 child: Center(
//                   child: MaterialButton(
//                     onPressed: () {},
//                     child: Container(
//                       width: 800,
//                       height: 550,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(8),
//                         color: Colors.white,
//                       ),
//                       padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
//                       child: Column(
//                         children: [
//                           SizedBox(
//                             width: MediaQuery.of(context).size.width * 0.65,
//                             child: Column(
//                               children: [
//                                 Align(
//                                   alignment: Alignment.centerLeft,
//                                   child: search,
//                                 ),
//                                 const SizedBox(height: 10),
//                                 table,
//                                 const SizedBox(height: 10),
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.end,
//                                   children: [
//                                     ElevatedButton(
//                                         style: ButtonStyle(
//                                           fixedSize: MaterialStateProperty.all(
//                                               Size(100, 50)),
//                                         ),
//                                         onPressed: () {
//                                           //선택한거를 Base에 셋팅해줘야한다.
//                                           // provider.showTableInCreatePage();
//                                           //
//                                           provider
//                                               .clearMultiCuDialogIndexList();
//                                           Navigator.pop(context);
//                                         },
//                                         child: Text("확인")),
//                                     SizedBox(width: 30),
//                                     ElevatedButton(
//                                         style: ButtonStyle(
//                                           fixedSize: MaterialStateProperty.all(
//                                               Size(100, 50)),
//                                         ),
//                                         onPressed: () {
//                                           provider
//                                               .clearMultiCuDialogIndexList();
//                                           Navigator.pop(context);
//                                         },
//                                         child: Text("취소")),
//                                     SizedBox(width: 15)
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
// }
