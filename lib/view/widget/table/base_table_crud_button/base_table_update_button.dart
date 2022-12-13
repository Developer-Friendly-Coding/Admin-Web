// import 'package:clean_arch/common/constants/table/table_column_attributes_mapper.dart';
// import 'package:clean_arch/view/widget/table/base_table_view/base_table_attributes.dart';
// import 'package:flutter/material.dart';
// import 'package:clean_arch/model/base_model.dart';
// import 'package:provider/provider.dart';
// import 'package:clean_arch/provider/impl/base_table_provider_impl.dart';
// import 'package:fluttertoast/fluttertoast.dart';

// class BaseTableUpdateButton<M extends Base> extends StatelessWidget {
//   final double alertWidth;
//   final double alertHeight;
//   final double componentNameWidth;
//   final double componentWidth;
//   final double componentLeftMargin;
//   final bool test;
//   final List<ColumnAttributes> columnAttributesList =
//       columnAttributesMapper[M.toString()]!;
//   final _formKey = GlobalKey<FormState>();

//   BaseTableUpdateButton(
//       {this.alertWidth = 900,
//       this.alertHeight = 370,
//       this.componentNameWidth = 160,
//       this.componentWidth = 240,
//       this.componentLeftMargin = 30,
//       this.test = false,
//       super.key});

//   List<Widget> alertComponentList(
//       BaseTableProvider<M> providerRead, BuildContext context) {
//     List<Widget> result = [];
//     int length = columnAttributesList.length;

//     for (int i = 1; i < length; i++) {
//       Container component = Container(
//         color: test == true ? Colors.amber : null,
//         child: Row(
//           children: [
//             Container(
//                 margin: EdgeInsets.only(left: componentLeftMargin),
//                 width: componentNameWidth,
//                 child: Text(
//                   columnAttributesList[i].columnName,
//                   style: const TextStyle(fontSize: 20),
//                 )),
//             SizedBox(
//               width: componentWidth,
//               child: TextFormField(
//                 autovalidateMode: AutovalidateMode.always,
//                 // validator: columnAttributesList[i].validator,
//                 controller: providerRead.updateButtonTECList[i],
//                 decoration: const InputDecoration(
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       );

//       result.add(component);
//     }

//     return result;
//   }

//   @override
//   Widget build(BuildContext context) {
//     BaseTableProvider<M> providerRead =
//         Provider.of<BaseTableProvider<M>>(context, listen: false);

//     return ElevatedButton(
//         onPressed: () {
//           if (providerRead.selectedIndex == -1) {
//             Fluttertoast.showToast(
//                 msg: "먼저 수정할 열을 선택해 주세요",
//                 toastLength: Toast.LENGTH_LONG,
//                 gravity: ToastGravity.CENTER,
//                 timeInSecForIosWeb: 1,
//                 backgroundColor: Colors.red,
//                 textColor: Colors.white,
//                 fontSize: 16.0);
//           } else {
//             List<Widget> tableCL = alertComponentList(providerRead, context);
//             showDialog(
//               context: context,
//               builder: (BuildContext context) => Form(
//                 key: _formKey,
//                 child: AlertDialog(
//                   actionsPadding: const EdgeInsets.only(bottom: 50, right: 50),
//                   contentPadding: const EdgeInsets.only(top: 50),
//                   title: const Text('테이블 열 수정'),
//                   content: Container(
//                     constraints:
//                         const BoxConstraints(maxWidth: 1050, maxHeight: 500),
//                     width: alertWidth,
//                     height: alertHeight,
//                     child: GridView.builder(
//                       itemCount: tableCL.length, //item 개수
//                       gridDelegate:
//                           const SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount: 2, //1 개의 행에 보여줄 item 개수
//                         childAspectRatio: 4.5 / 1, //가로 대 세로 비율
//                       ),
//                       itemBuilder: (BuildContext context, int index) {
//                         return tableCL[index];
//                       },
//                     ),
//                   ),
//                   actions: [
//                     TextButton(
//                       onPressed: () async {
//                         // if (_formKey.currentState?.validate() ?? false) {
//                         try {
//                           int? statusCode = await providerRead.updateTableRow();
//                           if (statusCode == 200) {
//                             await providerRead.getTableData();
//                             Fluttertoast.showToast(
//                                 msg: "수정 성공!",
//                                 toastLength: Toast.LENGTH_LONG,
//                                 gravity: ToastGravity.CENTER,
//                                 timeInSecForIosWeb: 1,
//                                 backgroundColor: Colors.red,
//                                 textColor: Colors.white,
//                                 fontSize: 35.0);
//                           } else {
//                             Fluttertoast.showToast(
//                                 msg: "수정 실페...",
//                                 toastLength: Toast.LENGTH_LONG,
//                                 gravity: ToastGravity.CENTER,
//                                 timeInSecForIosWeb: 1,
//                                 backgroundColor: Colors.red,
//                                 textColor: Colors.white,
//                                 fontSize: 35.0);
//                           }
//                         } catch (e) {
//                           debugPrint(e.toString());
//                           return null;
//                         }

//                         Navigator.of(context).pop();
//                         // } else {
//                         //   Fluttertoast.showToast(
//                         //       msg: "모든 유효성을 통과하세요",
//                         //       toastLength: Toast.LENGTH_LONG,
//                         //       gravity: ToastGravity.CENTER,
//                         //       timeInSecForIosWeb: 1,
//                         //       backgroundColor: Colors.red,
//                         //       textColor: Colors.white,
//                         //       fontSize: 35.0);
//                         // }
//                       },
//                       child: const Text(
//                         '확인',
//                         style: TextStyle(
//                             fontSize: 21, fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                     TextButton(
//                       onPressed: () {
//                         providerRead.setUpdateButtonTECList();
//                         Navigator.of(context).pop();
//                       },
//                       child: const Text(
//                         '취소',
//                         style: TextStyle(
//                             fontSize: 21, fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           }
//         },
//         child: const Text('수정'));
//   }
// }
