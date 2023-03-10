import 'package:clean_arch/view/page/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:clean_arch/provider/impl/table_provider_impl.dart';
import 'package:clean_arch/model/base_model.dart';
import 'package:clean_arch/common/constants/text_style.dart';
import 'package:clean_arch/view/widget/table/table_view/table_view_row.dart';
import 'package:clean_arch/view/widget/table/table_view/table_view_column.dart';
import 'package:recase/recase.dart';

class RelatedTableView<M extends Base> extends StatelessWidget {
  final int id;
  final String modelName;
  final double widthRate;
  final double height;
  final double rowHeight;
  final bool test;
  final Color color;
  final TextStyle? columnStyle;
  final TextStyle? rowStyle;

  const RelatedTableView(
      {required this.id,
      required this.modelName,
      this.widthRate = 0.65,
      this.height = 400,
      this.rowHeight = 50,
      this.color = Colors.white,
      this.test = false,
      this.columnStyle,
      this.rowStyle,
      super.key});

  @override
  Widget build(BuildContext context) {
    TableProvider<M> providerRead =
        Provider.of<TableProvider<M>>(context, listen: false);

    return FutureBuilder(
        future: providerRead.getRelatedTableDataById(modelName, id),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
                child: Text(
              "Error!...",
              style: snapShotStyle,
            ));
          } else if (snapshot.hasData == false) {
            return const Center(
                child: Text(
              "Loading...",
              style: snapShotStyle,
            ));
          } else {
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
                  TableViewColumn<M>(columnStyle: columnStyle),
                  const SizedBox(height: 30),

                  Expanded(
                    child: Consumer<TableProvider<M>>(
                      builder: (context, provider, child) {
                        return provider.dataList!.isEmpty
                            ? Center(
                                child: Text(
                                  "No Result",
                                  style: snapShotSensorStyle,
                                ),
                              )
                            : ListView.separated(
                                controller: ScrollController(),
                                itemCount: provider.dataList!.length,
                                separatorBuilder: (context, index) =>
                                    const Divider(
                                      thickness: 1,
                                    ),
                                itemBuilder: (BuildContext context, int index) {
                                  return InkWell(
                                    onTap: () {
                                      provider.setSelectedId(
                                          provider.dataList![index]);
                                    },
                                    onDoubleTap: () {
                                      provider.setSelectedId(
                                          provider.dataList![index]);
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          settings: RouteSettings(
                                              name:
                                                  "/${ReCase(M.toString()).camelCase}/${provider.selectedId}"), //????????? serviceProvdier/1
                                          builder: (context) => (DetailPage<M>(
                                            selectedId: provider.selectedId,
                                          )),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      color: provider.isSelectedId(
                                              provider.dataList![index])
                                          ? const Color(0xFFf0f8ff)
                                          : null,
                                      height: rowHeight,
                                      child: TableViewRow<M>(
                                        rowStyle: rowStyle,
                                        index: index,
                                        test: test,
                                      ),
                                    ),
                                  );
                                });
                      },
                    ),
                  ),

                  ////
                ],
              ),
            );
          }
        });
  }
}
