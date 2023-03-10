import 'package:clean_arch/common/constants/mapper/related_table_mapper.dart';
import 'package:clean_arch/common/constants/mapper/table_name_mapper.dart';
import 'package:flutter/material.dart';
import 'package:clean_arch/common/constants/text_style.dart';
import 'package:accordion/accordion.dart';
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

    AccordionSection accordionSection(
        IconData icon, String header, List<String> tableNameList) {
      String getKeyByValue(String value) {
        return tableNameMapper.keys
            .firstWhere((k) => tableNameMapper[k] == value);
      }

      List<TextButton> textButtonList = [];
      for (int i = 0; i < tableNameList.length; i++) {
        TextButton temp = TextButton(
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
                context,
                "/${ReCase(getKeyByValue(tableNameList[i])).camelCase}",
                (route) => false);
          },
          child: SizedBox(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(tableNameList[i], style: leftEntityBannerStyle),
            ),
          ),
        );
        textButtonList.add(temp);
      }
      return AccordionSection(
        isOpen: false,
        leftIcon: Icon(icon, color: Color(0xff0090FF)),
        headerBackgroundColor: Colors.white,
        header: Text(header,
            style:
                currentWidth >= 1920 ? accordionStyle : accordionStyleLapTop),
        content: Column(
          children: [...textButtonList],
        ),
        contentHorizontalPadding: 20,
        contentBorderWidth: 1,
      );
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
                child: Text("????????????",
                    style: currentWidth >= 1920
                        ? dashBoardStyle
                        : dashBoardStyleLaptop),
              )),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Container(
              margin: EdgeInsets.only(
                  // left: MediaQuery.of(context).size.width * 0.0244,
                  top: MediaQuery.of(context).size.width * 0.133),
              child: Accordion(children: [
                accordionSection(
                    Icons.house, "????????????", ["?????????", "????????????", "??????", "???????????????"]),
                accordionSection(Icons.apartment, "????????????",
                    ["??????", "?????????", "???????????????", '??????', '???????????????']),
                accordionSection(
                    Icons.manage_search, "????????????", ["?????????", "????????? ??????", "?????????"]),
                accordionSection(
                    Icons.verified_user, "????????????", ["?????????", "????????????", "????????????"]),
                accordionSection(Icons.inventory, "????????????", ["????????????", "????????????"])
              ])),
        ),
      ]),
    );
  }
}
