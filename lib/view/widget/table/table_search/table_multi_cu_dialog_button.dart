import 'package:clean_arch/common/util/class_builder.dart';
import 'package:clean_arch/provider/impl/table_provider_impl.dart';
import 'package:clean_arch/view/widget/table/table_search/table_search_container.dart';
import 'package:clean_arch/view/widget/table/table_cu_dialog/table_for_multi_cuDialog.dart';
import 'package:flutter/material.dart';

class MultiCUDialogButton extends StatelessWidget {
  final Size? size;
  final EdgeInsetsGeometry contentPadding;
  final double iconSize;
  final InputBorder? border;
  final Type modelType;
  final String text;
  const MultiCUDialogButton(
      {this.size,
      this.contentPadding = EdgeInsets.zero,
      this.iconSize = 25,
      this.border,
      required this.modelType,
      required this.text,
      super.key});

  @override
  Widget build(BuildContext context) {
    final TableSearchContainer search =
        ClassBuilder.getTableSearchContainer(modelType, true)!;
    final TableViewForMultiCuDialog table =
        ClassBuilder.getTableViewForMultiCuDialog(modelType)!;
    final TableProvider provider =
        ClassBuilder.getTableProvider(modelType, false, context)!;
    return ElevatedButton(
      style: ButtonStyle(
          fixedSize: MaterialStateProperty.all(size ?? Size(100, 50))),
      child: Text(text),
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
                      height: 580,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                      ),
                      padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
                      child: Column(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.65,
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: search,
                                ),
                                const SizedBox(height: 10),
                                table,
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    ElevatedButton(
                                        style: ButtonStyle(
                                          fixedSize: MaterialStateProperty.all(
                                              Size(100, 50)),
                                        ),
                                        onPressed: () async {
                                          await provider
                                              .addTempDataListInCreate();
                                          provider
                                              .clearMultiCuDialogIndexList();
                                          Navigator.pop(context);
                                        },
                                        child: Text("확인")),
                                    SizedBox(width: 30),
                                    ElevatedButton(
                                        style: ButtonStyle(
                                          fixedSize: MaterialStateProperty.all(
                                              Size(100, 50)),
                                        ),
                                        onPressed: () {
                                          provider
                                              .clearMultiCuDialogIndexList();
                                          provider.clearTempDataListInCreate();
                                          Navigator.pop(context);
                                        },
                                        child: Text("취소")),
                                    SizedBox(width: 15)
                                  ],
                                ),
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
    );
  }
}
