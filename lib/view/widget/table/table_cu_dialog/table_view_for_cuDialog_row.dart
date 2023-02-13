import 'package:clean_arch/common/constants/mapper/table_column_attributes_mapper.dart';
import 'package:clean_arch/model/base_model.dart';
import 'package:clean_arch/provider/impl/table_provider_impl.dart';
import 'package:flutter/material.dart';
import 'package:clean_arch/common/constants/text_style.dart';
import 'package:clean_arch/common/constants/column_attributes.dart';
import 'package:provider/provider.dart';

class TableViewForCuDialogRow<M extends Base> extends StatelessWidget {
  final int index;
  final bool test;
  final TextStyle? rowStyle;
  final List<ColumnAttributes> columnAttributesList =
      columnAttributesMapper[M.toString()]!;
  List<Type> havingDescriptionModelList;
  TableViewForCuDialogRow(
      {required this.havingDescriptionModelList,
      required this.index,
      this.test = false,
      this.rowStyle,
      Key? key})
      : super(key: key);

  List<Widget> alignElementsWidget(
      TableProvider<M> providerRead, int index, BuildContext context) {
    List<String?> elements = providerRead.cuDialogDataList![index].toRow();
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
          child: Text(
            elements[i]!,
            style: cuDialogTableRowTextStyle,
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
