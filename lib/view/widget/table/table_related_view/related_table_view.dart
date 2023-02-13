// import 'package:clean_arch/model/impl/contract.dart';
// import 'package:clean_arch/model/impl/customer.dart';
// import 'package:clean_arch/model/impl/customer_memeber.dart';
// import 'package:clean_arch/model/impl/gate.dart';
// import 'package:clean_arch/model/impl/office.dart';
// import 'package:clean_arch/model/impl/sensor.dart';
// import 'package:clean_arch/view/page/detail_page.dart';
// import 'package:clean_arch/view/widget/table/table_crud_button/table_create_button.dart';
// import 'package:clean_arch/view/widget/table/table_crud_button/table_delete_button.dart';
// import 'package:clean_arch/view/widget/table/table_detail_view/related_table_view_row.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:clean_arch/provider/impl/table_provider_impl.dart';
// import 'package:clean_arch/model/base_model.dart';
// import 'package:clean_arch/common/constants/text_style.dart';
// import 'package:clean_arch/view/widget/table/table_view/table_view_row.dart';
// import 'package:clean_arch/view/widget/table/table_view/table_view_column.dart';
// import 'package:recase/recase.dart';
// import 'package:go_router/go_router.dart';

// class RelatedTableView<M extends Base> extends StatelessWidget {
//   final String relation;
//   int id;
//   final String modelName;
//   final Base? model;
//   final double horizonWidthRate;
//   final double widthRate;
//   final double height;
//   final double rowHeight;
//   final bool test;
//   final Color color;
//   final TextStyle? columnStyle;
//   final TextStyle? rowStyle;
//   final bool isDelete;
//   final bool isCreate;
//   final List<Type> havingDescriptionModelList = [
//     Contract,
//     Customer,
//     Office,
//     CustomerMember,
//     Sensor,
//     Gate
//   ];
//   RelatedTableView(
//       {required this.relation,
//       required this.id,
//       required this.modelName,
//       required this.isCreate,
//       required this.isDelete,
//       this.model,
//       this.horizonWidthRate = 1,
//       this.widthRate = 0.65,
//       this.height = 400,
//       this.rowHeight = 50,
//       this.color = Colors.white,
//       this.test = false,
//       this.columnStyle,
//       this.rowStyle,
//       super.key});

//   @override
//   Widget build(BuildContext context) {
//     TableProvider<M> providerRead =
//         Provider.of<TableProvider<M>>(context, listen: false);

//     if (relation == "N:1") {
//       id = model!.getMember("${ReCase(M.toString()).camelCase}Id");
//     }

//     return Row(
//       children: [
//         SizedBox(width: 30),
//         FutureBuilder(
//             future: providerRead.getRelatedDataById(modelName, id, relation),
//             builder: (context, snapshot) {
//               if (snapshot.hasError) {
//                 return const Center(
//                     child: Text(
//                   "Error!...",
//                   style: snapShotStyle,
//                 ));
//               } else if (snapshot.hasData == false) {
//                 return const Center(
//                     child: Text(
//                   "Loading...",
//                   style: snapShotStyle,
//                 ));
//               } else {
//                 return Container(
//                   height: height,
//                   width: MediaQuery.of(context).size.width * widthRate,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: SingleChildScrollView(
//                     scrollDirection: Axis.horizontal,
//                     child: Container(
//                       width:
//                           MediaQuery.of(context).size.width * horizonWidthRate,
//                       child: Column(
//                         children: [
//                           const SizedBox(height: 24),
//                           TableViewColumn<M>(
//                               havingDescriptionModelList:
//                                   havingDescriptionModelList,
//                               columnStyle: columnStyle),
//                           const SizedBox(height: 30),
//                           Expanded(
//                             child: Consumer<TableProvider<M>>(
//                               builder: (context, provider, child) {
//                                 return provider.relatedDataList!.isEmpty
//                                     ? Center(
//                                         child: Text(
//                                           "No Result",
//                                           style: snapShotSensorStyle,
//                                         ),
//                                       )
//                                     : ListView.separated(
//                                         controller: ScrollController(),
//                                         itemCount:
//                                             provider.relatedDataList!.length,
//                                         separatorBuilder: (context, index) =>
//                                             const Divider(
//                                               thickness: 1,
//                                             ),
//                                         itemBuilder:
//                                             (BuildContext context, int index) {
//                                           return InkWell(
//                                             onTap: () {
//                                               provider.setSelectedId(provider
//                                                   .relatedDataList![index]
//                                                   .getMember("id"));
//                                             },
//                                             onDoubleTap: () {
//                                               provider.setSelectedId(provider
//                                                   .relatedDataList![index]
//                                                   .getMember("id"));
//                                               context.push(
//                                                   "/${ReCase(M.toString()).camelCase}/${provider.selectedId}");
//                                             },
//                                             child: Container(
//                                               color: provider.isChecked(provider
//                                                       .relatedDataList![index]
//                                                       .getMember("id"))
//                                                   ? const Color(0xFFf0f8ff)
//                                                   : null,
//                                               height: rowHeight,
//                                               child: RelatedTableViewRow<M>(
//                                                 rowStyle: rowStyle,
//                                                 index: index,
//                                                 test: test,
//                                               ),
//                                             ),
//                                           );
//                                         });
//                               },
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 );
//               }
//             }),
//         (isCreate == true || isDelete == true)
//             ? Container(
//                 width: MediaQuery.of(context).size.width * (0.75 - 0.65) - 35,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     isCreate == true
//                         ? TableCreateButton<M>(
//                             isFromRelatedTable: true,
//                             getRelatedDataById: () {
//                               return providerRead.getRelatedDataById(
//                                   modelName, id, relation);
//                             },
//                           )
//                         : SizedBox(),
//                     const SizedBox(height: 20),
//                     isDelete == true
//                         ? TableDeleteButton<M>(
//                             isFromRelatedTable: true,
//                             getRelatedDataById: () {
//                               return providerRead.getRelatedDataById(
//                                   modelName, id, relation);
//                             },
//                           )
//                         : SizedBox(),
//                   ],
//                 ),
//               )
//             : SizedBox()
//       ],
//     );
//   }
// }

import 'package:clean_arch/common/constants/column_attributes.dart';
import 'package:clean_arch/common/constants/mapper/table_column_attributes_mapper.dart';
import 'package:clean_arch/model/impl/contract.dart';
import 'package:clean_arch/model/impl/customer.dart';
import 'package:clean_arch/model/impl/customer_memeber.dart';
import 'package:clean_arch/model/impl/gate.dart';
import 'package:clean_arch/model/impl/office.dart';
import 'package:clean_arch/model/impl/sensor.dart';
import 'package:clean_arch/view/page/detail_page.dart';
import 'package:clean_arch/view/widget/table/table_related_view/related_table_view_column.dart';
import 'package:clean_arch/view/widget/table/table_related_view/related_table_view_row.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:clean_arch/provider/impl/table_provider_impl.dart';
import 'package:clean_arch/model/base_model.dart';
import 'package:clean_arch/common/constants/text_style.dart';
import 'package:clean_arch/view/widget/table/table_view/table_view_row.dart';
import 'package:clean_arch/view/widget/table/table_view/table_view_column.dart';
import 'package:recase/recase.dart';
import 'package:go_router/go_router.dart';

class RelatedTableView<M extends Base> extends StatelessWidget {
  final String relation;
  int id;
  final String modelName;
  final Base? model;
  final double rowHeight;
  final bool test;
  final Color color;
  final bool isDelete;
  final bool isCreate;
  final List<Type> havingDescriptionModelList = [
    Contract,
    Customer,
    Office,
    CustomerMember,
    Sensor,
    Gate
  ];
  final List<ColumnAttributes> columnAttributesList =
      columnAttributesMapper[M.toString()]!;

  final ScrollController _horizontal = ScrollController(),
      _vertical = ScrollController();
  TableProvider? cuDialogProvider;
  Map<String, dynamic>? targetMapper;
  RelatedTableView(
      {this.rowHeight = 56,
      this.color = Colors.white,
      this.test = false,
      required this.relation,
      required this.id,
      required this.modelName,
      required this.isCreate,
      required this.isDelete,
      this.model,
      super.key});

  @override
  Widget build(BuildContext context) {
    TableProvider<M> providerRead =
        Provider.of<TableProvider<M>>(context, listen: false);

    if (relation == "N:1") {
      id = model!.getMember("${ReCase(M.toString()).camelCase}Id");
    }

    return FutureBuilder(
      future: providerRead.getRelatedDataById(modelName, id, relation),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData == false) {
          return const Center(child: Text("Loading...", style: snapShotStyle));
        } else if (snapshot.hasError) {
          return Center(
            child: Text(
              'Error: ${snapshot.error}',
              style: const TextStyle(fontSize: 15),
            ),
          );
        } else if (snapshot.data == false) {
          return const Center(
            child: Text(
              'Fail',
              style: TextStyle(fontSize: 15),
            ),
          );
        } else {
          return Container(
            color: color,
            child: Scrollbar(
              controller: _horizontal,
              child: SingleChildScrollView(
                controller: _horizontal,
                scrollDirection: Axis.horizontal,
                child: Consumer<TableProvider<M>>(
                  builder: (context, provider, child) {
                    return SizedBox(
                      width: havingDescriptionModelList.contains(M)
                          ? (MediaQuery.of(context).size.width - 640 >
                                  (columnAttributesList[columnAttributesList.length - 2]
                                          .leftMargin +
                                      columnAttributesList[columnAttributesList.length - 2]
                                          .width +
                                      50)
                              ? MediaQuery.of(context).size.width - 640
                              : columnAttributesList[columnAttributesList.length - 2]
                                      .leftMargin +
                                  columnAttributesList[columnAttributesList.length - 2]
                                      .width +
                                  50)
                          : (MediaQuery.of(context).size.width - 640 >
                                  (columnAttributesList[columnAttributesList.length - 1]
                                          .leftMargin +
                                      columnAttributesList[columnAttributesList.length - 1]
                                          .width +
                                      50)
                              ? MediaQuery.of(context).size.width - 640
                              : columnAttributesList[columnAttributesList.length - 1]
                                      .leftMargin +
                                  columnAttributesList[columnAttributesList.length - 1]
                                      .width +
                                  50),
                      child: provider.relatedDataList!.isEmpty
                          ? const Center(
                              child: Text(
                                "No Result",
                                style: snapShotSensorStyle,
                              ),
                            )
                          : Column(
                              children: [
                                Container(
                                    height: 76,
                                    // color: const Color(0xffE6E6E6),
                                    child: RelatedTableViewColumn<M>(
                                      havingDescriptionModelList:
                                          havingDescriptionModelList,
                                    )),
                                Consumer<TableProvider<M>>(
                                  builder: (context, provider, child) {
                                    return Container(
                                      height:
                                          MediaQuery.of(context).size.height -
                                              179,
                                      //24 24 15 40
                                      child: Scrollbar(
                                        controller: _vertical,
                                        child: ListView.separated(
                                          separatorBuilder: (context, index) {
                                            return const Divider(
                                              color: Color(0xffE7E7E7),
                                              height: 1,
                                              thickness: 1,
                                            );
                                          },
                                          controller: _vertical,
                                          scrollDirection: Axis.vertical,
                                          itemCount:
                                              provider.relatedDataList!.length,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return InkWell(
                                              onTap: () {
                                                provider.setSelectedId(provider
                                                    .relatedDataList![index]
                                                    .getMember("id"));
                                                context.push(
                                                  "/${ReCase(M.toString()).camelCase}/${provider.selectedId}",
                                                );
                                              },
                                              child: Container(
                                                color: provider.isChecked(index)
                                                    ? const Color(0xFFf0f8ff)
                                                    : null,
                                                height: rowHeight,
                                                child: RelatedTableViewRow<M>(
                                                  havingDescriptionModelList:
                                                      havingDescriptionModelList,
                                                  index: index,
                                                  test: test,
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                    );
                  },
                ),
              ),
            ),
          );

          ///////////////////////
        }
      },
    );
  }
}
