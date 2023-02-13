import 'package:clean_arch/common/constants/mapper/table_column_attributes_mapper.dart';
import 'package:clean_arch/common/util/class_builder.dart';
import 'package:clean_arch/model/base_model.dart';
import 'package:clean_arch/model/impl/contract.dart';
import 'package:clean_arch/provider/impl/table_provider_impl.dart';
import 'package:flutter/material.dart';
import 'package:clean_arch/common/constants/text_style.dart';
import 'package:clean_arch/common/constants/column_attributes.dart';
import 'package:provider/provider.dart';
import 'package:recase/recase.dart';
import 'package:go_router/go_router.dart';

class TableViewRow<M extends Base> extends StatefulWidget {
  final int index;
  final bool test;

  List<Type> havingDescriptionModelList;
  TableViewRow(
      {required this.havingDescriptionModelList,
      required this.index,
      this.test = false,
      key})
      : super(key: key);

  @override
  State<TableViewRow<M>> createState() => _TableViewRowState<M>();
}

class _TableViewRowState<M extends Base> extends State<TableViewRow<M>> {
  final List<ColumnAttributes> columnAttributesList =
      columnAttributesMapper[M.toString()]!;

  List<Widget> alignElementsWidget(
      TableProvider<M> providerRead, int index, BuildContext context) {
    List<String?> elements = providerRead.dataList![index].toRow();
    int length = columnAttributesList.length;
    List<Widget> result = [];
    length =
        widget.havingDescriptionModelList.contains(M) ? length - 1 : length;
    result.add(Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(left: 22),
        child: Transform.scale(
          scale: 1.4,
          child: Checkbox(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.0),
            ),
            side: MaterialStateBorderSide.resolveWith(
              (states) => BorderSide(width: 1, color: Color(0xff2D96EE)),
            ),
            value: Provider.of<TableProvider<M>>(context)
                    .isCheckedListMapper[index] ??
                false,
            onChanged: (value) {
              providerRead.setCheck(index);
            },
          ),
        ),
      ),
    ));

    for (int i = 0; i < length; i++) {
      Align alignElement = Align(
        alignment: Alignment.centerLeft,
        child: Container(
          constraints: BoxConstraints(maxWidth: columnAttributesList[i].width),
          color: widget.test == true ? Colors.blueGrey : null,
          margin: EdgeInsets.only(left: columnAttributesList[i].leftMargin),
          child: columnAttributesList[i].isHyperLink == true
              ? GestureDetector(
                  onTap: () async {
                    String target = ReCase(columnAttributesList[i]
                            .hyperLinkTargetModel
                            .toString())
                        .camelCase;
                    if (M == Contract) {
                      switch (columnAttributesList[i].name) {
                        case "계약자":
                          target = "contractRep";
                          break;
                        case "알림수신자":
                          target = "contactRep";
                          break;
                        default:
                      }
                    }
                    int targetId =
                        providerRead.dataList![index].getMember("${target}Id");
                    ClassBuilder.getTableProvider(
                            columnAttributesList[i].hyperLinkTargetModel!,
                            false,
                            context)!
                        .setSelectedId(targetId);
                    providerRead.setSelectedId(
                        providerRead.dataList![index].getMember("id"));

                    context.push(
                      "/${ReCase(target).camelCase}/${targetId}",
                    );
                  },
                  child: Text(elements[i]!,
                      style: columnAttributesList[i].isHyperLink == true
                          ? tableHyperLinkRowTextStyle
                          : tableRowTextStyle),
                )
              : Text(
                  elements[i]!,
                  style: tableRowTextStyle,
                ),
        ),
      );
      result.add(alignElement);
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    TableProvider<M> providerRead =
        Provider.of<TableProvider<M>>(context, listen: false);

    return Stack(
      children: alignElementsWidget(providerRead, widget.index, context),
    );
  }
}
