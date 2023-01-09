import 'package:clean_arch/common/constants/mapper/related_table_mapper.dart';
import 'package:clean_arch/common/constants/mapper/table_column_attributes_mapper.dart';
import 'package:clean_arch/common/constants/mapper/table_name_mapper.dart';
import 'package:clean_arch/model/base_model.dart';
import 'package:clean_arch/provider/impl/signin_provider_impl.dart';
import 'package:clean_arch/provider/impl/table_provider_impl.dart';
import 'package:clean_arch/view/widget/table/table_detail_view/related_table_view.dart';
import 'package:clean_arch/view/widget/table/table_detail_view/related_table_container.dart';
import 'package:clean_arch/view/widget/table/table_detail_view/detail_info.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:clean_arch/common/constants/column_attributes.dart';
import 'package:clean_arch/common/constants/text_style.dart';
import 'package:clean_arch/view/widget/sidebar_menu.dart';

//ignore: must_be_immutable
class DetailPage<M extends Base> extends StatelessWidget {
  final int selectedId;
  final double infoWidthRate;
  final double infoHeight;
  final double containerTableWidthRate;
  final double containerTableHeight;
  late List<RelatedTableView> detailTableViewList =
      getRelatedTableList(M.toString(), selectedId)!;
  final List<ColumnAttributes> columnAttributesList =
      columnAttributesMapper[M.toString()]!;
  final String tableName = tableNameMapper[M.toString()]!;
  Color infoColor;
  Color containerTableColor;

  DetailPage(
      {required this.selectedId,
      this.infoWidthRate = 0.75,
      this.infoHeight = 200,
      this.infoColor = Colors.white,
      this.containerTableWidthRate = 0.75,
      this.containerTableHeight = 500,
      this.containerTableColor = Colors.white,
      super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    SignInProvider providerRead =
        Provider.of<SignInProvider>(context, listen: false);
    TableProvider<M> tableProviderRead =
        Provider.of<TableProvider<M>>(context, listen: false);
    tableProviderRead.setSelectedId(selectedId);
    return FutureBuilder(
        future: Future.wait([
          providerRead.isLogined(),
          tableProviderRead.initUpdateButtonTECList()
        ]),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData == false) {
            return const Center(
                child: Text("Loading...", style: snapShotStyle));
          } else if (snapshot.hasError) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Error: ${snapshot.error}',
                style: const TextStyle(fontSize: 15),
              ),
            );
          } else if (snapshot.data[0] == true && snapshot.data[1] == false) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  'Error: 존재하지 않음',
                  style: snapShotStyle,
                ),
              ),
            );
          }
          // 데이터를 정상적으로 받아오게 되면 다음 부분을 실행하게 되는 것이다.
          else {
            if (snapshot.data[0] == true && snapshot.data[1] == true) {
              print(snapshot.data);
              return Scaffold(
                key: _scaffoldKey,
                // drawer: PFAdminDrawer(),
                body: Container(
                  color: const Color.fromARGB(255, 232, 237, 246),
                  child: Row(
                    children: [
                      const SideBarMenu(),
                      SingleChildScrollView(
                        child: SizedBox(
                          width:
                              MediaQuery.of(context).size.width * 0.8197916667,

                          child: Column(
                            children: [
                              const SizedBox(height: 30),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  margin: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width *
                                          (0.8197916667 - 0.65) /
                                          2),
                                  width: 280,
                                  height: 50,
                                  child: Center(
                                    child: Text(
                                      "${tableName} 상세",
                                      style: detailPageInfoStyle,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              DetailInfo<M>(
                                selectedId: selectedId,
                                widthRate: infoWidthRate,
                                height: infoHeight,
                                color: infoColor,
                              ),
                              const SizedBox(height: 30),
                              RelatedContainer<M>(
                                detailTableViewList: detailTableViewList,
                                widthRate: containerTableWidthRate,
                                height: containerTableHeight,
                                color: containerTableColor,
                                // selectedM: selectedM,
                              )
                            ],
                          ),

                          ////
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else if (snapshot.data[0] == false) {
              return const Center(
                  child: Text(
                "Please Login First",
                style: snapShotStyle,
              ));
            } else {
              return const Center(
                  child: Text(
                "알수없는 에러, 개발자에게 문의하세요",
                style: snapShotStyle,
              ));
            }
          }
        });
  }

  //
}
