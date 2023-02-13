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

class RelatedTableViewRow<M extends Base> extends StatelessWidget {
  final int index;
  final bool test;
  final TextStyle? rowStyle;
  final List<ColumnAttributes> columnAttributesList =
      columnAttributesMapper[M.toString()]!;
  List<Type> havingDescriptionModelList;
  RelatedTableViewRow(
      {required this.havingDescriptionModelList,
      required this.index,
      this.test = false,
      this.rowStyle,
      Key? key})
      : super(key: key);

  List<Widget> alignElementsWidget(
      TableProvider<M> providerRead, int index, BuildContext context) {
    List<String?> elements = providerRead.relatedDataList![index].toRow();
    List<Widget> result = [];
    int length = columnAttributesList.length;

    length = havingDescriptionModelList.contains(M) ? length - 1 : length;
    for (int i = 0; i < length; i++) {
      Align alignElement = Align(
        alignment: Alignment.centerLeft,
        child: Container(
          constraints: BoxConstraints(maxWidth: columnAttributesList[i].width),
          color: test == true ? Colors.blueGrey : null,
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
                    int targetId = providerRead.relatedDataList![index]
                        .getMember("${target}Id");
                    ClassBuilder.getTableProvider(
                            columnAttributesList[i].hyperLinkTargetModel!,
                            false,
                            context)!
                        .setSelectedId(targetId);
                    providerRead.setSelectedId(
                        providerRead.relatedDataList![index].getMember("id"));
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          settings: RouteSettings(name: "/$target/$targetId"),
                          builder: (context) => (ClassBuilder.getDetailPage(
                              columnAttributesList[i].hyperLinkTargetModel!,
                              targetId)!)),
                    );
                  },
                  child: Text(elements[i]!,
                      style: relatedTableHyperLinkRowTextStyle),
                )
              : Text(
                  elements[i]!,
                  style: relatedTableRowTextStyle,
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
      children: alignElementsWidget(providerRead, index, context),
    );
  }
}
