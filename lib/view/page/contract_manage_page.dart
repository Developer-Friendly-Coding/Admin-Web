import 'dart:html';
import 'dart:ui' as ui;
import 'package:clean_arch/common/constants/mapper/table_name_mapper.dart';
import 'package:clean_arch/common/constants/text_style.dart';
import 'package:clean_arch/provider/impl/signin_provider_impl.dart';
import 'package:clean_arch/responsive.dart';
import 'package:clean_arch/view/widget/sidebar_menu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContractManagePage extends StatefulWidget {
  const ContractManagePage({Key? key}) : super(key: key);

  @override
  State<ContractManagePage> createState() => _ContractManagePageState();
}

class _ContractManagePageState extends State<ContractManagePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final IFrameElement _iFrameElement = IFrameElement();
  final String tableName = tableNameMapper['ContractManage']!;
  @override
  void initState() {
    _iFrameElement.style.height = '100%';
    _iFrameElement.style.width = "100%";
    _iFrameElement.src = "https://contract.pathfinder.camp/";
    _iFrameElement.style.border = 'none';

//ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      'iframeElement',
      (int ViewId) => _iFrameElement,
    );
    super.initState();
  }

  final Widget _iframeWidget = HtmlElementView(
    viewType: 'iframeElement',
    key: UniqueKey(),
  );
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
                      if (Responsive.isDesktop(context))
                        const Expanded(flex: 1, child: SideBarMenu()),
                      Expanded(
                        flex: 5,
                        child: SingleChildScrollView(
                          child: Column(children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.75,
                              child: Column(
                                children: [
                                  SizedBox(height: 20),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      width: 200,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "$tableName 페이지",
                                          style: detailPageInfoStyle,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 30),
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.75,
                                    height: MediaQuery.of(context).size.width *
                                        0.38,
                                    child: _iframeWidget,
                                  ),
                                  const SizedBox(height: 50)
                                ],
                              ),
                            ),
                          ]),
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
