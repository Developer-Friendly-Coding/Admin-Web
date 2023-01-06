import 'package:clean_arch/common/constants/mapper/table_column_attributes_mapper.dart';
import 'package:clean_arch/common/util/class_builder.dart';
import 'package:clean_arch/view/page/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:clean_arch/provider/impl/table_provider_impl.dart';
import 'package:clean_arch/model/base_model.dart';
import 'package:clean_arch/common/constants/text_style.dart';
import 'package:clean_arch/view/widget/table/table_view/table_view_row.dart';
import 'package:clean_arch/view/widget/table/table_view/table_view_column.dart';
import 'package:clean_arch/common/constants/column_attributes.dart';
import 'package:recase/recase.dart';

class TableView<M extends Base> extends StatelessWidget {
  // final double widthRate;
  final double height;
  final double rowHeight;
  final bool test;
  final Color color;
  final TextStyle? columnStyle;
  final TextStyle? rowStyle;
  final List<ColumnAttributes> columnAttributesList =
      columnAttributesMapper[M.toString()]!;
  bool isMultiDialog;
  bool isCUdialog;
  String? cuDialogMode;
  TableProvider? cuDialogProvider;
  Map<int, String>? targetMapper;
  TableView(
      {
      // this.widthRate = 0.65,
      this.height = 400,
      this.rowHeight = 50,
      this.color = Colors.white,
      this.test = false,
      this.columnStyle,
      this.rowStyle,
      this.isMultiDialog = false,
      this.isCUdialog = false,
      super.key});

  void setCUdialogAttributes(
      String mode, Type model, Map<int, String> mapper, BuildContext context) {
    cuDialogMode = mode;
    cuDialogProvider = ClassBuilder.getTableProvider(model, false, context);
    targetMapper = mapper;
  }

  void setIsCUdialog(bool iscudialog) {
    isCUdialog = iscudialog;
  }

  void setisMultiDialog(bool ismultiDialog) {
    isMultiDialog = ismultiDialog;
  }

  @override
  Widget build(BuildContext context) {
    TableProvider<M> providerRead =
        Provider.of<TableProvider<M>>(context, listen: false);

    return FutureBuilder(
      future: providerRead.getTableData(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData == false) {
          return const Center(child: Text("Loading...", style: snapShotStyle));
        } else if (snapshot.hasError) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Error: ${snapshot.error}',
              style: const TextStyle(fontSize: 15),
            ),
          );
        } else {
          providerRead.initAddButtonTECList();

          return Container(
            height: height,
            decoration: BoxDecoration(
              border: isCUdialog
                  ? Border.all(
                      width: 1,
                      color: Colors.black,
                    )
                  : null,
              color: color,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                const SizedBox(height: 24),
                TableViewColumn<M>(columnStyle: columnStyle),
                const SizedBox(height: 30),
                Consumer<TableProvider<M>>(
                  builder: (context, provider, child) {
                    return provider.dataList!.isEmpty
                        ? Center(
                            child: Text(
                              "No Result",
                              style: snapShotSensorStyle,
                            ),
                          )
                        : Expanded(
                            child: ListView.separated(
                              scrollDirection: Axis.vertical,
                              itemCount: provider.dataList!.length,
                              separatorBuilder: (context, index) =>
                                  const Divider(
                                thickness: 1,
                              ),
                              itemBuilder: (BuildContext context, int index) {
                                return InkWell(
                                  onTap: () {
                                    isMultiDialog
                                        ? provider.setMultiCuDialogId(provider
                                            .dataList![index]
                                            .getMember("id"))
                                        : provider.setSelectedId(
                                            provider.dataList![index]);
                                  },
                                  onDoubleTap: isMultiDialog
                                      ? null
                                      : isCUdialog
                                          ? () {
                                              provider.setSelectedId(
                                                  provider.dataList![index]);
                                              provider.setCuDialogTEC(
                                                  targetMapper!,
                                                  cuDialogProvider!,
                                                  cuDialogMode!);
                                              Navigator.pop(context);
                                            }
                                          : () {
                                              provider.setSelectedId(
                                                  provider.dataList![index]);

                                              provider
                                                  .initUpdateButtonTECList();
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  settings: RouteSettings(
                                                      name:
                                                          "/${ReCase(M.toString()).camelCase}/${provider.selectedId}"),
                                                  builder: (context) =>
                                                      (DetailPage<M>(
                                                    selectedId:
                                                        provider.selectedId,
                                                  )),
                                                ),
                                              );
                                            },
                                  child: Container(
                                    color: (isMultiDialog
                                            ? provider.isMultiCuDialogContainId(
                                                provider.dataList![index]
                                                    .getMember("id"))
                                            : provider.isSelectedId(
                                                provider.dataList![index]))
                                        ? const Color(0xFFf0f8ff)
                                        : null,
                                    height: rowHeight,
                                    child: TableViewRow<M>(
                                      rowStyle: rowStyle,
                                      index: index,
                                      test: test,
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                  },
                ),

                ////
              ],
            ),
          );
        }
      },
    );
  }
}
