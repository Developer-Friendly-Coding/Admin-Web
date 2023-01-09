import 'package:clean_arch/common/constants/column_attributes.dart';
import 'package:clean_arch/common/util/class_builder.dart';
import 'package:clean_arch/model/base_model.dart';
import 'package:clean_arch/view/widget/table/table_search/table_container.dart';
import 'package:clean_arch/view/widget/table/table_view/table_view.dart';
import 'package:clean_arch/view/widget/table/table_view/table_view_for_cuDialog.dart';
import 'package:flutter/material.dart';

class TableCUDialog<M extends Base> extends StatelessWidget {
  final double? width;
  final EdgeInsetsGeometry contentPadding;
  final double iconSize;
  final InputBorder? border;
  final TextEditingController controller;
  final ColumnAttributes columnAttributes;
  final String mode;
  TableCUDialog(
      {required this.controller,
      required this.columnAttributes,
      required this.mode,
      this.width,
      this.contentPadding = EdgeInsets.zero,
      this.iconSize = 25,
      this.border,
      super.key});

  @override
  Widget build(BuildContext context) {
    final TableSearchContainer search = ClassBuilder.getTableSearchContainer(
        columnAttributes.cuDialogTargetModel!)!;
    final TableViewForCuDialog table = ClassBuilder.getTableViewForCuDialog(
        columnAttributes.cuDialogTargetModel!, columnAttributes)!;
    table.setFromAndMode(M, mode);
    return Container(
      width: width,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          border: border,
          contentPadding: contentPadding,
          suffixIcon: IconButton(
            onPressed: () {
              showDialog(
                barrierColor: const Color.fromRGBO(0, 0, 0, 0.3),
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return Material(
                    color: Colors.transparent,
                    child: MaterialButton(
                      padding: EdgeInsets.zero,
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      enableFeedback: false,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Center(
                        child: MaterialButton(
                          onPressed: () {},
                          child: Container(
                            width: 800,
                            height: 500,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.white,
                            ),
                            padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
                            child: Column(
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.65,
                                  child: Column(
                                    children: [
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: search,
                                      ),
                                      const SizedBox(height: 10),
                                      table,
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
            icon: Icon(
              Icons.add_circle_outline,
              size: iconSize,
            ),
          ),
        ),
      ),
    );
  }
}
