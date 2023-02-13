import 'package:clean_arch/common/constants/mapper/related_table_mapper.dart';
import 'package:clean_arch/common/constants/mapper/table_column_attributes_mapper.dart';
import 'package:clean_arch/common/constants/mapper/table_name_mapper.dart';
import 'package:clean_arch/model/base_model.dart';
import 'package:clean_arch/model/impl/customer.dart';
import 'package:clean_arch/model/impl/customer_memeber.dart';
import 'package:clean_arch/model/impl/manager.dart';
import 'package:clean_arch/model/impl/office.dart';
import 'package:clean_arch/model/impl/office_branch.dart';
import 'package:clean_arch/model/impl/sensor.dart';
import 'package:clean_arch/model/impl/service_provider.dart';
import 'package:clean_arch/provider/impl/signin_provider_impl.dart';
import 'package:clean_arch/provider/impl/table_provider_impl.dart';
import 'package:clean_arch/view/widget/table/table_crud_button/table_create_info.dart';
import 'package:clean_arch/view/widget/table/table_related_view/related_table_view.dart';
import 'package:clean_arch/view/widget/table/table_related_view/related_table_container.dart';
import 'package:clean_arch/view/widget/table/table_related_view/detail_info.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:clean_arch/common/constants/column_attributes.dart';
import 'package:clean_arch/common/constants/text_style.dart';
import 'package:clean_arch/view/widget/sidebar_menu.dart';

//ignore: must_be_immutable
class TableCreatePage<M extends Base> extends StatelessWidget {
  final double infoWidthRate;
  final double infoHeight;
  final double containerTableWidthRate;
  final double containerTableHeight;
  final List<ColumnAttributes> columnAttributesList =
      columnAttributesMapper[M.toString()]!;
  final String tableName = tableNameMapper[M.toString()]!;
  Color infoColor;
  Color containerTableColor;

  TableCreatePage(
      {this.infoWidthRate = 0.75,
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
    tableProviderRead.initAddTextList();
    return FutureBuilder(
        future: Future.wait([
          providerRead.isLogined(),
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
          } else {
            if (snapshot.data[0] == true) {
              return MediaQuery.of(context).size.width < 1280
                  ? const Center(
                      child:
                          Text("노트북(1280) 화면보다 크게해주세요.", style: snapShotStyle))
                  : Scaffold(
                      resizeToAvoidBottomInset: true,
                      key: _scaffoldKey,
                      // drawer: PFAdminDrawer(),
                      body: Container(
                        color: const Color.fromARGB(255, 232, 237, 246),
                        child: Row(
                          children: [
                            const SideBarMenu(),
                            Expanded(
                              child: Column(
                                children: [
                                  SizedBox(height: 24),
                                  Row(
                                    children: [
                                      SizedBox(width: 24),
                                      SizedBox(
                                        width: 336,
                                        height:
                                            MediaQuery.of(context).size.height -
                                                48,
                                        child: TableCreateInfo<M>(),
                                      ),
                                      SizedBox(width: 10),
                                    ],
                                  ),
                                  SizedBox(height: 24),
                                ],
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
