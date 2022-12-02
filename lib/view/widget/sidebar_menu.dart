import 'package:clean_arch/common/constants/table/detail_table_mapper.dart';
import 'package:clean_arch/provider/impl/base_table_provider_impl.dart';
import 'package:flutter/material.dart';
import 'package:clean_arch/common/constants/text_style.dart';
import 'package:accordion/accordion.dart';
import 'package:provider/provider.dart';
import 'package:recase/recase.dart';

class SideBarMenu extends StatefulWidget {
  const SideBarMenu({super.key});

  @override
  State<SideBarMenu> createState() => _SideBarMenuState();
}

class _SideBarMenuState extends State<SideBarMenu> {
  @override
  Widget build(BuildContext context) {
    double currentWidth = MediaQuery.of(context).size.width;

    // var temp1 = AccordionSection(
    //   isOpen: false,
    //   leftIcon: const Icon(Icons.home_work, color: Color(0xff0090FF)),
    //   header: Text('입주사 관리',
    //       style: currentWidth >= 1920 ? accordionStyle : accordionStyleLapTop),
    //   content: TextButton(
    //     onPressed: () {
    //       Navigator.pushNamedAndRemoveUntil(
    //           context, "/customer", (route) => false);
    //     },
    //     child: SizedBox(
    //       width: MediaQuery.of(context).size.width * 0.15,
    //       height: MediaQuery.of(context).size.width * 0.026,
    //       child: Align(
    //         alignment: Alignment.centerLeft,
    //         child: Text("입주사",
    //             style: currentWidth >= 1920
    //                 ? accordionElementTextStyle
    //                 : accordionElementTextStyleLapTop),
    //       ),
    //     ),
    //   ),
    // );

    // var temp2 = AccordionSection(
    //   isOpen: false,
    //   leftIcon: const Icon(Icons.content_paste, color: Color(0xff0090FF)),
    //   header: Text('매니저 관리',
    //       style: currentWidth >= 1920 ? accordionStyle : accordionStyleLapTop),
    //   content: Column(
    //     children: [
    //       TextButton(
    //         onPressed: () {
    //           Navigator.pushNamedAndRemoveUntil(
    //               context, "/office", (route) => false);
    //         },
    //         child: SizedBox(
    //           width: MediaQuery.of(context).size.width * 0.15,
    //           height: MediaQuery.of(context).size.width * 0.026,
    //           child: Align(
    //             alignment: Alignment.centerLeft,
    //             child: Text("사무실",
    //                 style: currentWidth >= 1920
    //                     ? accordionElementTextStyle
    //                     : accordionElementTextStyleLapTop),
    //           ),
    //         ),
    //       ),
    //       TextButton(
    //         onPressed: () {
    //           Navigator.pushNamedAndRemoveUntil(
    //               context, "/manager", (route) => false);
    //         },
    //         child: SizedBox(
    //           width: MediaQuery.of(context).size.width * 0.15,
    //           height: MediaQuery.of(context).size.width * 0.026,
    //           child: Align(
    //             alignment: Alignment.centerLeft,
    //             child: Text("매니저",
    //                 style: currentWidth >= 1920
    //                     ? accordionElementTextStyle
    //                     : accordionElementTextStyleLapTop),
    //           ),
    //         ),
    //       ),
    //       TextButton(
    //         onPressed: () {
    //           Navigator.pushNamedAndRemoveUntil(
    //               context, "/contract", (route) => false);
    //         },
    //         child: SizedBox(
    //           width: MediaQuery.of(context).size.width * 0.15,
    //           height: MediaQuery.of(context).size.width * 0.026,
    //           child: Align(
    //             alignment: Alignment.centerLeft,
    //             child: Text("계약",
    //                 style: currentWidth >= 1920
    //                     ? accordionElementTextStyle
    //                     : accordionElementTextStyleLapTop),
    //           ),
    //         ),
    //       ),
    //       TextButton(
    //         onPressed: () {
    //           Navigator.pushNamedAndRemoveUntil(
    //               context, "/officeBranch", (route) => false);
    //         },
    //         child: SizedBox(
    //           width: MediaQuery.of(context).size.width * 0.15,
    //           height: MediaQuery.of(context).size.width * 0.026,
    //           child: Align(
    //             alignment: Alignment.centerLeft,
    //             child: Text("지점",
    //                 style: currentWidth >= 1920
    //                     ? accordionElementTextStyle
    //                     : accordionElementTextStyleLapTop),
    //           ),
    //         ),
    //       ),
    //       TextButton(
    //         onPressed: () {
    //           Navigator.pushNamedAndRemoveUntil(
    //               context, "/serviceProvider", (route) => false);
    //         },
    //         child: SizedBox(
    //           width: MediaQuery.of(context).size.width * 0.15,
    //           height: MediaQuery.of(context).size.width * 0.026,
    //           child: Align(
    //             alignment: Alignment.centerLeft,
    //             child: Text("운영사",
    //                 style: currentWidth >= 1920
    //                     ? accordionElementTextStyle
    //                     : accordionElementTextStyleLapTop),
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    // );

    // BaseTableProvider<M> providerRead =
    //     Provider.of<BaseTableProvider<M>>(context, listen: false);

    List<Widget> entityList() {
      List<Widget> result = [];
      List<String> tableNameList = tableNameMapper.values.toList();
      List<String> tableClassNameList = tableNameMapper.keys.toList();
      int length = tableNameList.length;
      for (int i = 0; i < length; i++) {
        TextButton textButton = TextButton(
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
                context,
                "/${ReCase(tableClassNameList[i]).camelCase}",
                (route) => false);
          },
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.15,
            height: MediaQuery.of(context).size.width * 0.026,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(tableNameList[i], style: leftEntityBannerStyle),
            ),
          ),
        );
        result.add(textButton);
      }
      return result;
    }

    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width * 0.1802083333,
      child: Stack(children: [
        Align(
          alignment: Alignment.topLeft,
          child: Container(
              margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.0244,
                  top: MediaQuery.of(context).size.width * 0.0296),
              child: Text("Pathfinder",
                  style: currentWidth >= 1920 ? logoStyle : logoStyleLaptop)),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Container(
              margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.0244,
                  top: MediaQuery.of(context).size.width * 0.103),
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/main', (route) => false);
                },
                child: Text("대쉬보드",
                    style: currentWidth >= 1920
                        ? dashBoardStyle
                        : dashBoardStyleLaptop),
              )),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Container(
              margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.0244,
                  top: MediaQuery.of(context).size.width * 0.133),
              // margin: EdgeInsets.only(
              //     top: MediaQuery.of(context).size.width * 0.133,
              //     left: MediaQuery.of(context).size.width * 0.010),
              child: Column(children: [...entityList()])

              // Accordion(
              //   contentBorderColor: Color(0xff0090FF),
              //   headerBackgroundColor: Colors.white,
              //   scaleWhenAnimating: false,
              //   openAndCloseAnimation: true,
              //   children: [temp1, temp2],
              // ),
              ),
        ),
      ]),
    );
  }
}
