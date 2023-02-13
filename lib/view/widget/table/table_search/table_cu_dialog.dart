import 'package:clean_arch/common/constants/column_attributes.dart';
import 'package:clean_arch/common/constants/mapper/table_name_mapper.dart';
import 'package:clean_arch/common/constants/text_style.dart';
import 'package:clean_arch/common/constants/validator.dart';
import 'package:clean_arch/common/util/class_builder.dart';
import 'package:clean_arch/model/base_model.dart';
import 'package:clean_arch/view/widget/table/table_search/table_search_container.dart';
import 'package:clean_arch/view/widget/table/table_cu_dialog/table_view_for_cuDialog.dart';
import 'package:flutter/material.dart';

class TableCUDialog<M extends Base> extends StatelessWidget {
  final double iconSize;
  final InputBorder? border;
  final TextEditingController controller;
  final ColumnAttributes columnAttributes;
  final String mode;
  final bool? isSearch;

  const TableCUDialog(
      {required this.controller,
      required this.columnAttributes,
      required this.mode,
      this.iconSize = 25,
      this.isSearch = false,
      this.border,
      super.key});

  @override
  Widget build(BuildContext context) {
    final TableSearchContainer search = ClassBuilder.getTableSearchContainer(
        columnAttributes.cuDialogTargetModel!, true)!;
    final TableViewForCuDialog table = ClassBuilder.getTableViewForCuDialog(
        columnAttributes.cuDialogTargetModel!, columnAttributes, controller)!;
    table.setFromAndMode(M, mode);
    return Container(
      width: mode == 'update'
          ? 137
          : mode == 'create'
              ? 137
              : 184,
      height: mode == 'update' ? null : 44,
      child: TextFormField(
        minLines: mode == 'update' ? 1 : 1,
        maxLines: mode == 'update' ? 100 : 1,
        decoration: InputDecoration(
          labelText: columnAttributes.name,
          labelStyle: searchTextStyle,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(width: 1, color: Color(0xffC8C8CB)),
          ),
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
                            height: 550,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.white,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(height: 27),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                      margin: EdgeInsets.only(left: 32),
                                      width: 110,
                                      height: 29,
                                      child: Text(
                                        tableNameMapper[columnAttributes
                                            .cuDialogTargetModel
                                            .toString()]!,
                                        style: cuDialogTableNameTextStyle,
                                      )),
                                ),
                                SizedBox(height: 19),
                                search,
                                SizedBox(height: 20),
                                table,
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
        readOnly: true,
        validator: isSearch == true ? null : stringNotNullValidor,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: controller,
      ),
    );
  }
}
