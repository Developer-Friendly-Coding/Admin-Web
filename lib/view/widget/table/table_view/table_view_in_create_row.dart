import 'package:clean_arch/common/constants/mapper/table_column_attributes_mapper.dart';
import 'package:clean_arch/model/base_model.dart';
import 'package:clean_arch/provider/impl/table_provider_impl.dart';
import 'package:flutter/material.dart';
import 'package:clean_arch/common/constants/text_style.dart';
import 'package:clean_arch/common/constants/column_attributes.dart';
import 'package:provider/provider.dart';

class TableViewInCreateRow<M extends Base> extends StatelessWidget {
  final int index;
  final bool test;
  final TextStyle? rowStyle;
  final List<ColumnAttributes> columnAttributesList =
      columnAttributesMapper[M.toString()]!;

  TableViewInCreateRow(
      {required this.index, this.test = false, this.rowStyle, Key? key})
      : super(key: key);

  List<Widget> alignElementsWidget(
      TableProvider<M> providerRead, int index, BuildContext context) {
    List<String?> elements = providerRead.tempDataListInCreate[index].toRow();
    List<Widget> result = [];
    int lastIndex = elements.length - 1;
    for (int i = 0; i < elements.length; i++) {
      Align alignElement = Align(
        alignment: Alignment.centerLeft,
        child: Container(
          constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width *
                  columnAttributesList[i].width),
          color: test == true ? Colors.blueGrey : null,
          margin: EdgeInsets.only(
              left: MediaQuery.of(context).size.width *
                  columnAttributesList[i].leftMargin),
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
    result.add(Align(
      alignment: Alignment.centerLeft,
      child: Container(
          constraints:
              BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.1),
          color: test == true ? Colors.blueGrey : null,
          margin: EdgeInsets.only(
              left: MediaQuery.of(context).size.width *
                  (columnAttributesList[lastIndex].leftMargin + 0.15)),
          child: IconButton(
            icon: Icon(Icons.cancel),
            onPressed: () {
              providerRead.removeTempDataListInCreate(index);
            },
          )),
    ));
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
