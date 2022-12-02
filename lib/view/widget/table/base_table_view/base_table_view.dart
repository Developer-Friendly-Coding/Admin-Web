import 'package:clean_arch/common/constants/enum/search.dart';
import 'package:clean_arch/common/constants/table/table_column_attributes_mapper.dart';
import 'package:clean_arch/view/page/detail_page.dart';
import 'package:clean_arch/view/widget/sidebar_menu.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:clean_arch/provider/impl/base_table_provider_impl.dart';
import 'package:clean_arch/model(DTO)/base_model.dart';
import 'package:clean_arch/common/constants/text_style.dart';
import 'package:clean_arch/view/widget/table/base_table_view/base_table_view_row.dart';
import 'package:clean_arch/view/widget/table/base_table_view/base_table_view_column.dart';
import 'package:clean_arch/view/widget/table/base_table_view/base_table_attributes.dart';

class BaseTableView<M extends Base> extends StatelessWidget {
  final double widthRate;
  final double height;
  final double rowHeight;
  final bool test;
  final Color color;
  final TextStyle? columnStyle;
  final TextStyle? rowStyle;
  final List<ColumnAttributes> columnAttributesList =
      columnAttributesMapper[M.toString()]!;

  BaseTableView(
      {this.widthRate = 0.65,
      this.height = 400,
      this.rowHeight = 50,
      this.color = Colors.white,
      this.test = false,
      this.columnStyle,
      this.rowStyle,
      super.key});

  @override
  Widget build(BuildContext context) {
    BaseTableProvider<M> providerRead =
        Provider.of<BaseTableProvider<M>>(context, listen: false);
    // BaseTableProvider<M> providerWatch =
    //     Provider.of<BaseTableProvider<M>>(context);
    return FutureBuilder(
      future: providerRead.getTableData(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        //해당 부분은 data를 아직 받아 오지 못했을때 실행되는 부분을 의미한다.
        if (snapshot.hasData == false) {
          return const Center(child: Text("Loading...", style: snapShotStyle));
        }
        //error가 발생하게 될 경우 반환하게 되는 부분
        else if (snapshot.hasError) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Error: ${snapshot.error}',
              style: const TextStyle(fontSize: 15),
            ),
          );
        }
        // 데이터를 정상적으로 받아오게 되면 다음 부분을 실행하게 되는 것이다.
        else {
          providerRead.setAddButtonTECList();
          return Container(
            height: height,
            width: MediaQuery.of(context).size.width * widthRate,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                const SizedBox(height: 24),
                BaseTableViewColumn<M>(columnStyle: columnStyle),
                const SizedBox(height: 30),

                Expanded(
                  child: ListView.separated(
                      controller: ScrollController(),
                      //itemcount는 rebuild되면서 변해야하므로 listen 에 true가 맞다.
                      itemCount: Provider.of<BaseTableProvider<M>>(context)
                          .dataList!
                          .length,
                      separatorBuilder: (context, index) => const Divider(
                            thickness: 1,
                          ),
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            providerRead.changeSelectedIndex(index);
                            providerRead.setUpdateButtonTECList();
                          },
                          onDoubleTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => (DetailPage<M>(
                                  selectedId:
                                      providerRead.dataList![index].getId(),
                                )),
                              ),
                            );
                          },
                          child: Container(
                            color: providerRead.selectedIndex == index
                                ? const Color(0xFFf0f8ff)
                                : null,
                            height: rowHeight,
                            child: BaseTableViewRow<M>(
                              rowStyle: rowStyle,
                              index: index,
                              test: test,
                            ),
                          ),
                        );
                      }),
                ),

                ////
              ],
            ),
          );
        }
      },
    );
  }
}
