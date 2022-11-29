import 'package:clean_arch/common/constants/table_search_child_mapper.dart';
import 'package:clean_arch/model(DTO)/base_model.dart';
import 'package:clean_arch/view/widget/table/base_table_search/base_table_search_child.dart';
import 'package:flutter/material.dart';

//ignore: must_be_immutable
class BaseTableSearchContainer<M extends Base> extends StatelessWidget {
  final List<SearchChild> searchContainerChildList =
      searchChildMapper[M.toString()]!;
  final double width;
  final double hegiht;
  final double nameWidth;
  final double nameLeftMargin;
  final Color color;

  BaseTableSearchContainer(
      {this.width = 600,
      this.hegiht = 270,
      this.nameWidth = 100,
      this.nameLeftMargin = 30,
      this.color = Colors.white,
      super.key});

  List<Widget> getChildren() {
    List<Widget> resultChildren = [];
    resultChildren.add(const SizedBox(height: 15));
    for (int i = 0; i < searchContainerChildList.length; i++) {
      // print(getSize(globalKeyList[i])!.height);
      Container child = Container(
        color: color,
        child: Row(
          children: [
            Container(
              width: nameWidth,
              margin: EdgeInsets.only(left: nameLeftMargin),
              child: Text(
                searchContainerChildList[i].columnName,
              ),
            ),
            Container(child: searchContainerChildList[i].child),
          ],
        ),
      );

      resultChildren.add(child);
      resultChildren.add(const SizedBox(height: 25));
    }
    return resultChildren;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      width: width,
      height: hegiht,
      child: ListView(children: getChildren()),
    );
  }
}
