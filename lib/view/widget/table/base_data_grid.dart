// import 'package:clean_arch/common/constants/mapper/table_column_attributes_mapper.dart';
// import 'package:clean_arch/common/constants/text_style.dart';
// import 'package:clean_arch/model/base_model.dart';
// import 'package:clean_arch/provider/impl/base_table_provider_impl.dart';
// import 'package:clean_arch/view/widget/table/base_table_view/base_table_attributes.dart';
// import 'package:provider/provider.dart';
// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_datagrid/datagrid.dart';

// class BaseDataGrid<M extends Base> extends StatelessWidget {
//   final List<ColumnAttributes> columnAttributesList =
//       columnAttributesMapper[M.toString()]!;

//   BaseDataGrid({super.key});

//   List<GridColumn> getGridColumnList() {
//     int length = columnAttributesList.length;
//     List<GridColumn> result = [];
//     for (int i = 0; i < length; i++) {
//       result.add(GridColumn(
//           autoFitPadding: EdgeInsets.symmetric(
//               horizontal: columnAttributesList[i].padding!),
//           columnName: columnAttributesList[i].name,
//           label: Container(
//               alignment: Alignment.center,
//               child: Text(
//                 columnAttributesList[i].name,
//               ))));
//     }
//     return result;
//   }

//   @override
//   Widget build(BuildContext context) {
//     BaseTableProvider<M> providerRead =
//         Provider.of<BaseTableProvider<M>>(context, listen: false);
//     return FutureBuilder(
//       future: providerRead.getTableData(),
//       builder: (context, snapshot) {
//         if (snapshot.hasData == false) {
//           return const Center(child: Text("Loading...", style: snapShotStyle));
//         } else if (snapshot.hasError) {
//           return Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               'Error: ${snapshot.error}',
//               style: const TextStyle(fontSize: 15),
//             ),
//           );
//         } else {
//           Provider.of<BaseTableProvider<M>>(context);
//           providerRead.initAddButtonTECList();
//           return Container(
//             color: Colors.white,
//             width: MediaQuery.of(context).size.width * 0.65,
//             height: 400,
//             child: SfDataGrid(
//               shrinkWrapRows: true,
//               isScrollbarAlwaysShown: true,
//               // horizontalScrollPhysics: const NeverScrollableScrollPhysics(),
//               // verticalScrollPhysics: const NeverScrollableScrollPhysics(),
//               columnWidthMode: ColumnWidthMode.auto,
//               gridLinesVisibility: GridLinesVisibility.both,
//               headerGridLinesVisibility: GridLinesVisibility.both,
//               source: DataSource<M>(
//                 providerRead: providerRead,
//               ),
//               columns: getGridColumnList(),
//             ),
//           );
//         }
//       },
//     );
//   }
// }

// class DataSource<M extends Base> extends DataGridSource {
//   BaseTableProvider<M>? providerRead;

//   List<DataGridRow> dataGridRows = [];
//   DataSource({
//     required BaseTableProvider<M> providerRead,
//   }) {
//     int length = providerRead.dataList.length;

//     for (int i = 0; i < length; i++) {
//       dataGridRows.add(
//         DataGridRow(
//           cells: providerRead.dataList[i].toRow().map((member) {
//             return DataGridCell(columnName: member!, value: member);
//           }).toList(),
//         ),
//       );
//     }
//   }
//   @override
//   List<DataGridRow> get rows => dataGridRows;
//   @override
//   DataGridRowAdapter? buildRow(DataGridRow row) {
//     return DataGridRowAdapter(
//         cells: row.getCells().map<Widget>((dataGridCell) {
//       return Container(
//           alignment: Alignment.center,
//           child: Text(
//             dataGridCell.value,
//             overflow: TextOverflow.ellipsis,
//           ));
//     }).toList());
//   }
// }
