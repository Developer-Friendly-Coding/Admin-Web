import 'package:clean_arch/common/constants/mapper/table_column_attributes_mapper.dart';
import 'package:clean_arch/common/util/class_builder.dart';
import 'package:clean_arch/model/base_model.dart';
import 'package:clean_arch/provider/impl/table_provider_impl.dart';
import 'package:clean_arch/view/page/customer_member_page.dart';
import 'package:clean_arch/view/page/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:clean_arch/common/constants/text_style.dart';
import 'package:clean_arch/common/constants/column_attributes.dart';
import 'package:provider/provider.dart';
import 'package:recase/recase.dart';

class TableViewForCuDialogRow<M extends Base> extends StatelessWidget {
  final int index;
  final bool test;
  final TextStyle? rowStyle;
  final List<ColumnAttributes> columnAttributesList =
      columnAttributesMapper[M.toString()]!;

  TableViewForCuDialogRow(
      {required this.index, this.test = false, this.rowStyle, Key? key})
      : super(key: key);

  List<Widget> alignElementsWidget(
      TableProvider<M> providerRead, int index, BuildContext context) {
    List<String?> elements = providerRead.dataList![index].toRow();
    List<Widget> result = [];

    for (int i = 0; i < elements.length; i++) {
      Align alignElement = Align(
        alignment: Alignment.centerLeft,
        child: Container(
          constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width *
                  columnAttributesList[i].widthRate),
          color: test == true ? Colors.blueGrey : null,
          margin: EdgeInsets.only(
              left: MediaQuery.of(context).size.width *
                  columnAttributesList[i].leftMarginRate),
          child: Text(
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
    TableProvider<M> providerRead =
        Provider.of<TableProvider<M>>(context, listen: false);

    return Stack(
      children: alignElementsWidget(providerRead, index, context),
    );
  }
}
