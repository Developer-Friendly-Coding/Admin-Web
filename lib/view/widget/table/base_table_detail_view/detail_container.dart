import 'package:clean_arch/common/constants/detail_table_mapper.dart';
import 'package:clean_arch/common/constants/text_style.dart';
import 'package:clean_arch/model(DTO)/base_model.dart';
import 'package:clean_arch/provider/impl/base_table_provider_impl.dart';
import 'package:clean_arch/view/widget/table/base_table_detail_view/detail__table_view.dart';
import 'package:clean_arch/view/widget/table/base_table_view/base_table_attributes.dart';
import 'package:clean_arch/view/widget/table/base_table_view/base_table_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tabbed_view/tabbed_view.dart';

//ignore: must_be_immutable
class DetailContainer<M extends Base> extends StatefulWidget {
  int selectedId;
  List<DetailTableView> detailTableViewList;
  final double widthRate;
  final double height;
  Color color;
  int idx = 0;
  List<String> buttonTextList = detailTableNameMapper[M.toString()]!;
  DetailContainer(
      {required this.selectedId,
      required this.detailTableViewList,
      required this.widthRate,
      required this.height,
      required this.color,
      super.key});

  @override
  State<DetailContainer> createState() => _DetailContainerState();
}

class _DetailContainerState<M> extends State<DetailContainer> {
  late TabbedViewController _controller;

  void setTabDate() {
    int length = widget.buttonTextList.length;
    List<TabData> tabs = [];
    for (int i = 0; i < length; i++) {
      tabs.add(TabData(
          closable: false,
          text: widget.buttonTextList[i],
          content: Center(
            child: widget.detailTableViewList[i],
          )));
    }
    _controller = TabbedViewController(tabs);
  }

  @override
  Widget build(BuildContext context) {
    setTabDate();
    TabbedView tabbedView = TabbedView(controller: _controller);
    Widget tabbedViewContainer =
        TabbedViewTheme(child: tabbedView, data: TabbedViewThemeData.classic());
    return Container(
      height: widget.height,
      width: MediaQuery.of(context).size.width * widget.widthRate,
      child: tabbedViewContainer,
    );
  }
}
