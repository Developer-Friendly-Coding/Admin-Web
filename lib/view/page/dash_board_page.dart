import 'dart:async';
import 'package:clean_arch/provider/impl/dash_board_provider_impl.dart';
import 'package:clean_arch/provider/impl/signin_provider_impl.dart';
import 'package:clean_arch/responsive.dart';
import 'package:clean_arch/view/widget/dash_board/header.dart';
import 'package:clean_arch/view/widget/dash_board/measure_container.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:clean_arch/common/constants/text_style.dart';
import 'package:clean_arch/view/widget/sidebar_menu.dart';

class DashBoardPage extends StatefulWidget {
  const DashBoardPage({Key? key}) : super(key: key);

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.height);
    SignInProvider providerRead =
        Provider.of<SignInProvider>(context, listen: false);
    DashBoardProvider dashBoardProviderRead =
        Provider.of<DashBoardProvider>(context, listen: false);

    return FutureBuilder(
        future: Future.wait([
          providerRead.isLogined(),
          dashBoardProviderRead.getOfficeBranchList()
        ]),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData == false) {
            return const Center(
                child: Text("Loading...", style: snapShotStyle));
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error: ${snapshot.error}',
                style: const TextStyle(fontSize: 15),
              ),
            );
          } else {
            if (snapshot.data[0] == true) {
              if (snapshot.data[1] == null) {
                return const Center(
                  child: Text(
                    'Error: 지점불러오기 실패}',
                    style: snapShotStyle,
                  ),
                );
              } else if (snapshot.data[1].isEmpty) {
                return const Center(
                  child: Text(
                    'Error: 지점이 없음}',
                    style: snapShotStyle,
                  ),
                );
              } else {
                return MediaQuery.of(context).size.width < 1280
                    ? const Center(
                        child: Text("모니터(1280) 화면보다 크게해주세요.",
                            style: snapShotStyle))
                    : Scaffold(
                        key: _scaffoldKey,
                        body: SafeArea(
                          child: Container(
                            color: const Color.fromARGB(255, 232, 237, 246),
                            child: Row(
                              children: [
                                const SideBarMenu(),
                                Expanded(
                                  child: SingleChildScrollView(
                                    padding: const EdgeInsets.all(18),
                                    child: Column(
                                      children: [
                                        const Header(),
                                        const SizedBox(height: 18),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              flex: 2,
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 8),
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(10)),
                                                  border: Border.all(
                                                      color: Colors.white10),
                                                ),
                                                child:
                                                    DropdownButtonHideUnderline(
                                                  child: DropdownButton(
                                                    value: Provider.of<
                                                                DashBoardProvider>(
                                                            context)
                                                        .officeBranch,
                                                    items: dashBoardProviderRead
                                                        .officeBranchList!
                                                        .map(
                                                      (value) {
                                                        return DropdownMenuItem(
                                                            value: value,
                                                            child: Text(
                                                                style:
                                                                    sensorOfficeBranchStyle,
                                                                value.toRow()[
                                                                    1]));
                                                      },
                                                    ).toList(),
                                                    onChanged: ((value) {
                                                      dashBoardProviderRead
                                                          .setOfficeBranch(
                                                              value!);
                                                    }),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 20),
                                            Expanded(
                                              flex: 6,
                                              child: MeasureContainer(
                                                sensorType: "습도",
                                              ),
                                            ),
                                            // Expanded(
                                            //   flex: 6,
                                            //   child: MeasureContainer(
                                            //     sensorType: "온도",
                                            //   ),
                                            // )
                                          ],
                                        ),
                                        const SizedBox(height: 18),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: const [
                                            Expanded(
                                              flex: 2,
                                              child: SizedBox(),
                                            ),
                                            SizedBox(width: 20),
                                            // Expanded(
                                            //   flex: 12,
                                            //   child: MeasureContainer(),
                                            // ),
                                          ],
                                        ),
                                        const SizedBox(height: 800),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
              }
            } else if (snapshot.data[0] == false) {
              return const Center(
                child: Text(
                  'Error: 로그인 실패}',
                  style: snapShotStyle,
                ),
              );
            } else {
              return const Center(
                child: Text(
                  'Error: 알수없는 에러}',
                  style: snapShotStyle,
                ),
              );
            }
          }
        });
  }
}
