import 'package:clean_arch/common/constants/mapper/table_name_mapper.dart';
import 'package:clean_arch/model/impl/contract.dart';
import 'package:clean_arch/model/impl/customer.dart';
import 'package:clean_arch/model/impl/customer_memeber.dart';
import 'package:clean_arch/model/impl/gate.dart';
import 'package:clean_arch/model/impl/gate_credential.dart';
import 'package:clean_arch/model/impl/manager.dart';
import 'package:clean_arch/model/impl/office_branch.dart';
import 'package:clean_arch/provider/impl/signin_provider_impl.dart';
import 'package:clean_arch/responsive.dart';
import 'package:clean_arch/view/widget/table/table_search/table_search_container.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:clean_arch/common/constants/text_style.dart';
import 'package:clean_arch/view/widget/sidebar_menu.dart';
import 'package:clean_arch/view/widget/table/table_view/table_view.dart';

import 'package:clean_arch/view/widget/table/table_crud_button/table_delete_button.dart';
import 'package:clean_arch/view/widget/table/table_crud_button/table_create_button.dart';

class OfficeBranchPage extends StatefulWidget {
  const OfficeBranchPage({Key? key}) : super(key: key);

  @override
  State<OfficeBranchPage> createState() => _OfficeBranchPageState();
}

class _OfficeBranchPageState extends State<OfficeBranchPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final String tableName = tableNameMapper['OfficeBranch']!;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SignInProvider providerRead =
        Provider.of<SignInProvider>(context, listen: false);

    return FutureBuilder(
        future: providerRead.isLogined(),
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
            if (snapshot.data == true) {
              return MediaQuery.of(context).size.width < 1280
                  ? const Center(
                      child:
                          Text("노트북(1280) 화면보다 크게해주세요.", style: snapShotStyle))
                  : Scaffold(
                      key: _scaffoldKey,
                      body: Container(
                        color: const Color(0xffF7F8FA),
                        child: Row(
                          children: [
                            const SideBarMenu<OfficeBranch>(),
                            SizedBox(width: 21),
                            Expanded(
                              child: Column(
                                children: [
                                  SizedBox(height: 26),
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child:
                                          TableSearchContainer<OfficeBranch>()),
                                  const SizedBox(height: 18),
                                  Container(
                                    height: 73,
                                    color: Colors.white,
                                    child: Column(
                                      children: [
                                        SizedBox(height: 13),
                                        Row(children: [
                                          Container(
                                            margin: EdgeInsets.only(left: 16),
                                            width: 207,
                                            height: 44,
                                            child: Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  tableName,
                                                  style: tableNameTextStyle,
                                                )),
                                          ),
                                          Expanded(
                                            child: Container(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  TableCreateButton<
                                                      OfficeBranch>(),
                                                  SizedBox(width: 15),
                                                  TableDeleteButton<
                                                      OfficeBranch>(),
                                                  SizedBox(width: 32)
                                                ],
                                              ),
                                            ),
                                          ),
                                        ]),
                                        SizedBox(height: 16),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Align(
                                        alignment: Alignment.topLeft,
                                        child: TableView<OfficeBranch>()),
                                  ),
                                  const SizedBox(height: 15)
                                ],
                              ),
                            ),
                            SizedBox(width: 19),
                          ],
                        ),
                      ),
                    );
            } else {
              return const Center(
                  child: Text(
                "Please Login First",
                style: snapShotStyle,
              ));
            }
          }
        });
  }
}
