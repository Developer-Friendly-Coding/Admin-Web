import 'package:clean_arch/common/constants/mapper/related_table_mapper.dart';
import 'package:clean_arch/model/impl/contract.dart';
import 'package:clean_arch/model/impl/tax_bill.dart';
import 'package:clean_arch/provider/impl/signin_provider_impl.dart';
import 'package:clean_arch/view/widget/table/base_table_search/base_table_container.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:clean_arch/common/constants/text_style.dart';
import 'package:clean_arch/view/widget/sidebar_menu.dart';
import 'package:clean_arch/view/widget/table/base_table_view/base_table_view.dart';
import 'package:clean_arch/view/widget/table/base_table_crud_button/base_table_delete_button.dart';
import 'package:clean_arch/view/widget/table/base_table_crud_button/base_table_create_button.dart';

class TaxBillPage extends StatefulWidget {
  const TaxBillPage({Key? key}) : super(key: key);

  @override
  State<TaxBillPage> createState() => _TaxBillPageState();
}

class _TaxBillPageState extends State<TaxBillPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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
              return Scaffold(
                key: _scaffoldKey,
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
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.65,
                                child: Column(
                                  children: [
                                    const SizedBox(height: 50),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child:
                                          BaseTableSearchContainer<TaxBill>(),
                                    ),
                                    const SizedBox(height: 30),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          const SizedBox(width: 15),
                                          BaseTableCreateButton<TaxBill>(),
                                          const SizedBox(width: 15),
                                          const BaseTableDeleteButton<
                                              TaxBill>(),
                                        ]),
                                    const SizedBox(height: 20),
                                    BaseTableView<TaxBill>(),
                                    const SizedBox(height: 50)
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
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
