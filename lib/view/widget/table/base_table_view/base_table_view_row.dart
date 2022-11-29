import 'package:clean_arch/common/constants/table_column_attributes_mapper.dart';
import 'package:clean_arch/model(DTO)/base_model.dart';
import 'package:clean_arch/provider/impl/base_table_provider_impl.dart';
import 'package:flutter/material.dart';
import 'package:clean_arch/common/constants/text_style.dart';
import 'package:clean_arch/view/widget/table/base_table_view/base_table_attributes.dart';

class BaseTableViewRow<M extends Base> extends StatelessWidget {
  final BaseTableProvider<M> provider;
  final int index;
  final bool test;
  final TextStyle? rowStyle;
  final List<ColumnAttributes> columnAttributesList =
      columnAttributesMapper[M.toString()]!;

  BaseTableViewRow(
      {required this.provider,
      required this.index,
      this.test = false,
      this.rowStyle,
      Key? key})
      : super(key: key);

  List<Widget> alignElementsWidget(BaseTableProvider<M> provider, int index,
      List<ColumnAttributes> columnAttributesList, BuildContext context) {
    List<String?> elements = provider.dataList![index].toRow();

    List<Widget> result = [];
    for (int i = 0; i < elements.length; i++) {
      var alignElement = Align(
        alignment: Alignment.centerLeft,
        child: Container(
          color: test == true ? Colors.blueGrey : null,
          margin: EdgeInsets.only(
              left: MediaQuery.of(context).size.width *
                  columnAttributesList[i].columnLeftMarginRate),
          width: MediaQuery.of(context).size.width *
              columnAttributesList[i].columntWidthRate,
          child: Text(
            elements[i]!,
            style: MediaQuery.of(context).size.width < 1920
                ? (rowStyle ?? memberInfoListTextStyleLapTop)
                : (rowStyle ?? memberInfoListTextStyle),
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
      children:
          alignElementsWidget(provider, index, columnAttributesList, context),
    );
  }
}
