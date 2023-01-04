import 'package:clean_arch/common/constants/mapper/table_column_attributes_mapper.dart';
import 'package:clean_arch/common/util/class_builder.dart';
import 'package:clean_arch/model/base_model.dart';
import 'package:clean_arch/provider/impl/base_table_provider_impl.dart';
import 'package:clean_arch/view/page/customer_member_page.dart';
import 'package:flutter/material.dart';
import 'package:clean_arch/common/constants/text_style.dart';
import 'package:clean_arch/view/widget/table/base_table_view/base_table_attributes.dart';
import 'package:provider/provider.dart';
import 'package:recase/recase.dart';

class BaseTableViewRow<M extends Base> extends StatelessWidget {
  final int index;
  final bool test;
  final TextStyle? rowStyle;
  final List<ColumnAttributes> columnAttributesList =
      columnAttributesMapper[M.toString()]!;

  BaseTableViewRow(
      {required this.index, this.test = false, this.rowStyle, Key? key})
      : super(key: key);

  List<Widget> alignElementsWidget(
      BaseTableProvider<M> providerRead, int index, BuildContext context) {
    List<String?> elements = providerRead.dataList[index].toRow();
    List<Widget> result = [];
    for (int i = 0; i < elements.length; i++) {
      var alignElement = Align(
        alignment: Alignment.centerLeft,
        child: Container(
          constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width *
                  columnAttributesList[i].widthRate),
          color: test == true ? Colors.blueGrey : null,
          margin: EdgeInsets.only(
              left: MediaQuery.of(context).size.width *
                  columnAttributesList[i].leftMarginRate),
          child: columnAttributesList[i].isHyperLink == true
              ? GestureDetector(
                  onTap: () async {
                    String target = ReCase(columnAttributesList[i]
                            .hyperLinkTargetModel
                            .toString())
                        .camelCase;
                    //target=customerMember
                    String targetId = "${target}Id";
                    //targedId = customerMemberId
                    int selectedId =
                        providerRead.dataList[index].getMember(targetId);
                    //targedId = 44
                    providerRead.changeSelectedIndex(index);
                    BaseTableProvider targetProvider =
                        ClassBuilder.getBaseTableProvider(
                            columnAttributesList[i].hyperLinkTargetModel!,
                            false,
                            context);
                    await targetProvider.getTableData();
                    targetProvider.changeSelectedIndex(index);
                    targetProvider.initUpdateButtonTECList();

                    Navigator.push(
                      test22().currentContext!,
                      MaterialPageRoute(
                          settings: RouteSettings(name: "/$target/$selectedId"),
                          builder: (context) => (ClassBuilder.getDetailPage(
                              columnAttributesList[i].hyperLinkTargetModel!,
                              int.parse(targetId)))),
                    );
                  },
                  child: Text(elements[i]!,
                      style: columnAttributesList[i].isHyperLink == true
                          ? (MediaQuery.of(context).size.width < 1920
                              ? tableMemberHyperLinkStyleLapTop
                              : tableMemberHyperLinkStyleLapTop)
                          : (MediaQuery.of(context).size.width < 1920
                              ? (rowStyle ?? tableMemberStyleLapTop)
                              : (rowStyle ?? tableMemberStyle))),
                )
              : Text(
                  elements[i]!,
                  style: MediaQuery.of(context).size.width < 1920
                      ? (rowStyle ?? tableMemberStyleLapTop)
                      : (rowStyle ?? tableMemberStyle),
                ),
        ),
      );

      result.add(alignElement);
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    BaseTableProvider<M> providerRead =
        Provider.of<BaseTableProvider<M>>(context, listen: false);

    return Stack(
      children: alignElementsWidget(providerRead, index, context),
    );
  }
}
