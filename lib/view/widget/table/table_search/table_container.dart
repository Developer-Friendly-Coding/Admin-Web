import 'package:clean_arch/common/constants/mapper/related_table_mapper.dart';
import 'package:clean_arch/common/constants/mapper/table_name_mapper.dart';
import 'package:clean_arch/common/constants/mapper/table_search_child_mapper.dart';
import 'package:clean_arch/common/constants/text_style.dart';
import 'package:clean_arch/model/base_model.dart';
import 'package:clean_arch/view/widget/table/table_search/table_search_child.dart';
import 'package:flutter/material.dart';

//ignore: must_be_immutable
class TableSearchContainer<M extends Base> extends StatelessWidget {
  final List<SearchChild> searchContainerChildList =
      searchChildMapper[M.toString()]!;
  final double width;
  final double hegiht;
  final double nameWidth;
  final double nameLeftMargin;
  final Color color;

  TableSearchContainer(
      {this.width = 550,
      this.hegiht = 150,
      this.nameWidth = 100,
      this.nameLeftMargin = 30,
      this.color = Colors.white,
      super.key});

  List<Widget> getChildren() {
    List<Widget> resultChildren = [];
    resultChildren.add(const SizedBox(height: 15));
    for (int i = 0; i < searchContainerChildList.length; i++) {
      Row child = Row(
        children: [
          Container(
            width: nameWidth,
            margin: EdgeInsets.only(left: nameLeftMargin),
            child: Text(
              searchContainerChildList[i].columnName,
              style: searchNameStyle,
            ),
          ),
          Container(child: searchContainerChildList[i].child),
        ],
      );

      resultChildren.add(child);
      resultChildren.add(const SizedBox(height: 25));
    }
    return resultChildren;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
          ),
          width: width,
          height: hegiht,
          child: ListView(children: getChildren()),
        ),
      ],
    );
  }
}
