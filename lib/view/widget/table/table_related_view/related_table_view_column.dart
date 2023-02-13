import 'package:clean_arch/common/constants/mapper/table_column_attributes_mapper.dart';
import 'package:clean_arch/model/base_model.dart';
import 'package:clean_arch/provider/impl/table_provider_impl.dart';
import 'package:clean_arch/common/constants/column_attributes.dart';
import 'package:clean_arch/common/constants/text_style.dart';
import 'package:flutter/material.dart';

class RelatedTableViewColumn<M extends Base> extends StatelessWidget {
  final bool test;
  final TextStyle? columnStyle;
  final List<ColumnAttributes> columnAttributesList =
      columnAttributesMapper[M.toString()]!;
  List<Type> havingDescriptionModelList;
  RelatedTableViewColumn(
      {required this.havingDescriptionModelList,
      this.columnStyle,
      this.test = false,
      Key? key})
      : super(key: key);

  List<Widget> alignElementsWidget(BuildContext context) {
    int length = columnAttributesList.length;
    List<Widget> result = [];
    length = havingDescriptionModelList.contains(M) ? length - 1 : length;
    for (int i = 0; i < length; i++) {
      Align alignElement = Align(
        alignment: Alignment.centerLeft,
        child: Container(
          color: test == true ? Colors.blueGrey : null,
          margin: EdgeInsets.only(left: columnAttributesList[i].leftMargin),
          width: columnAttributesList[i].width,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              columnAttributesList[i].name,
              style: tableColumnTextStyle,
            ),
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
      children: [
        ...alignElementsWidget(context),
        Container(
          margin: EdgeInsets.only(top: 75),
          color: Color(0xffE7E7E7),
          width: havingDescriptionModelList.contains(M)
              ? (MediaQuery.of(context).size.width - 640 >
                      (columnAttributesList[columnAttributesList.length - 2]
                              .leftMargin +
                          columnAttributesList[columnAttributesList.length - 2]
                              .width +
                          50)
                  ? MediaQuery.of(context).size.width - 640
                  : columnAttributesList[columnAttributesList.length - 2]
                          .leftMargin +
                      columnAttributesList[columnAttributesList.length - 2]
                          .width +
                      50)
              : (MediaQuery.of(context).size.width - 640 >
                      (columnAttributesList[columnAttributesList.length - 1]
                              .leftMargin +
                          columnAttributesList[columnAttributesList.length - 1]
                              .width +
                          50)
                  ? MediaQuery.of(context).size.width - 640
                  : columnAttributesList[columnAttributesList.length - 1]
                          .leftMargin +
                      columnAttributesList[columnAttributesList.length - 1]
                          .width +
                      50),
          height: 1,
        )
      ],
    );
  }
}
