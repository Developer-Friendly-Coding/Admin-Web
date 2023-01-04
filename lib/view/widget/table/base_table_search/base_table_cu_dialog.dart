import 'package:clean_arch/common/util/class_builder.dart';
import 'package:clean_arch/model/base_model.dart';
import 'package:clean_arch/provider/impl/base_table_provider_impl.dart';
import 'package:clean_arch/view/widget/table/base_table_search/base_table_container.dart';
import 'package:clean_arch/view/widget/table/base_table_view/base_table_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BaseTableCUDialog<M extends Base> extends StatelessWidget {
  final double? width;
  final EdgeInsetsGeometry contentPadding;
  final double iconSize;
  final InputBorder? border;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String mode;
  final Map<String, dynamic> targetMapper;

  BaseTableCUDialog(
      {required this.controller,
      required this.validator,
      required this.mode,
      required this.targetMapper,
      this.width,
      this.contentPadding = EdgeInsets.zero,
      this.iconSize = 25,
      this.border,
      super.key});

  @override
  Widget build(BuildContext context) {
    final BaseTableView table =
        ClassBuilder.getBaseTableView(targetMapper["targetModel"], 300);
    final BaseTableSearchContainer search =
        ClassBuilder.getBaseTableSearchContainer(targetMapper["targetModel"]);
    return Container(
      width: width,
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: validator,
        controller: controller,
        decoration: InputDecoration(
          border: border,
          contentPadding: contentPadding,
          suffixIcon: IconButton(
            onPressed: () {
              table.setCUdialogAttributes(mode, targetMapper["targetModel"],
                  targetMapper["targetMapper"], context);
              table.setIsCUdialog(true);
              search.setIsCUdialog(true);
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
