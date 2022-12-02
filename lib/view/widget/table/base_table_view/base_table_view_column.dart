import 'package:clean_arch/common/constants/table/table_column_attributes_mapper.dart';
import 'package:clean_arch/model(DTO)/base_model.dart';
import 'package:clean_arch/provider/impl/base_table_provider_impl.dart';
import 'package:clean_arch/view/widget/table/base_table_view/base_table_attributes.dart';
import 'package:clean_arch/common/constants/text_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BaseTableViewColumn<M extends Base> extends StatelessWidget {
  final bool test;
  final TextStyle? columnStyle;
  final List<ColumnAttributes> columnAttributesList =
      columnAttributesMapper[M.toString()]!;
  BaseTableViewColumn({this.columnStyle, this.test = false, Key? key})
      : super(key: key);

  List<Widget> alignElementsWidget(BuildContext context) {
    int length = columnAttributesList.length;
    List<Widget> result = [];

    for (int i = 0; i < length; i++) {
      Align alignElement = Align(
        alignment: Alignment.centerLeft,
        child: Container(
          color: test == true ? Colors.blueGrey : null,
          margin: EdgeInsets.only(
              left: MediaQuery.of(context).size.width *
                  columnAttributesList[i].columnLeftMarginRate),
          width: MediaQuery.of(context).size.width *
              columnAttributesList[i].columntWidthRate,
          child: Text(
            columnAttributesList[i].columnName,
            style: MediaQuery.of(context).size.width < 1920
                ? (columnStyle ?? memberInfoElementStyleLapTop)
                : (columnStyle ?? memberInfoElementStyle),
          ),
        ),
      );
      result.add(alignElement);
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: alignElementsWidget(context),
    );
  }
}
