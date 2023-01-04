import 'package:clean_arch/common/constants/mapper/table_column_attributes_mapper.dart';
import 'package:clean_arch/common/util/class_builder.dart';
import 'package:clean_arch/view/page/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:clean_arch/provider/impl/base_table_provider_impl.dart';
import 'package:clean_arch/model/base_model.dart';
import 'package:clean_arch/common/constants/text_style.dart';
import 'package:clean_arch/view/widget/table/base_table_view/base_table_view_row.dart';
import 'package:clean_arch/view/widget/table/base_table_view/base_table_view_column.dart';
import 'package:clean_arch/view/widget/table/base_table_view/base_table_attributes.dart';
import 'package:recase/recase.dart';

class BaseTableView<M extends Base> extends StatelessWidget {
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
  BaseTableProvider? cuDialogProvider;
  Map<int, String>? targetMapper;
  BaseTableView(
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
    cuDialogProvider = ClassBuilder.getBaseTableProvider(model, false, context);
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
    BaseTableProvider<M> providerRead =
        Provider.of<BaseTableProvider<M>>(context, listen: false);

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
                BaseTableViewColumn<M>(columnStyle: columnStyle),
                const SizedBox(height: 30),
                Consumer<BaseTableProvider<M>>(
                  builder: (context, provider, child) {
                    return provider.dataList.isEmpty
                        ? Center(
                            child: Text(
                              "No Result",
                              style: snapShotSensorStyle,
                            ),
                          )
                        : Expanded(
                            child: ListView.separated(
                              scrollDirection: Axis.vertical,
                              itemCount: provider.dataList.length,
                              separatorBuilder: (context, index) =>
                                  const Divider(
                                thickness: 1,
                              ),
                              itemBuilder: (BuildContext context, int index) {
                                return InkWell(
                                  onTap: () {
                                    isMultiDialog
                                        ? provider
                                            .setMultiCuDialogSelectedIndex(
                                                index)
                                        : provider.changeSelectedIndex(index);

                                    isMultiDialog
                                        ? null
                                        : provider.initUpdateButtonTECList();
                                  },
                                  onDoubleTap: isMultiDialog
                                      ? null
                                      : isCUdialog
                                          ? () {
                                              provider
                                                  .changeSelectedIndex(index);
                                              provider.setCuDialogTEC(
                                                  targetMapper!,
                                                  cuDialogProvider!,
                                                  cuDialogMode!);
                                              Navigator.pop(context);
                                            }
                                          : () {
                                              provider
                                                  .changeSelectedIndex(index);
                                              provider
                                                  .initUpdateButtonTECList();
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  settings: RouteSettings(
                                                      name:
                                                          "/${ReCase(M.toString()).camelCase}/${provider.dataList[index].getMember("id")}"),
                                                  builder: (context) =>
                                                      (DetailPage<M>(
                                                    selectedId: provider
                                                        .dataList[index]
                                                        .getMember("id"),
                                                  )),
                                                ),
                                              );
                                            },
                                  child: Container(
                                    color: (isMultiDialog
                                            ? provider
                                                .isMultiCuDialogContainIndex(
                                                    index)
                                            : provider.selectedIndex == index)
                                        ? const Color(0xFFf0f8ff)
                                        : null,
                                    height: rowHeight,
                                    child: BaseTableViewRow<M>(
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
