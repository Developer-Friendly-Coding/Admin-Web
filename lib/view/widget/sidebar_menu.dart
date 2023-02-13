import 'package:clean_arch/common/constants/mapper/table_name_mapper.dart';
import 'package:clean_arch/model/base_model.dart';
import 'package:clean_arch/provider/impl/table_provider_impl.dart';
import 'package:flutter/material.dart';
import 'package:clean_arch/common/constants/text_style.dart';
import 'package:accordion/accordion.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:recase/recase.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:go_router/go_router.dart';

class SideBarMenu<M extends Base> extends StatefulWidget {
  const SideBarMenu({super.key});

  @override
  State<SideBarMenu> createState() => _SideBarMenuState<M>();
}

class _SideBarMenuState<M extends Base> extends State<SideBarMenu> {
  @override
  Widget build(BuildContext context) {
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
            modelNameToModelConstructor[ReCase(M.toString()).camelCase] is Base
                ? Provider.of<TableProvider<M>>(context, listen: false)
                    .clearGetAPiQuery()
                : null;
            context.push(
              "/${ReCase(getKeyByValue(tableNameList[i])).camelCase}",
            );
          },
          child: SizedBox(
            height: 32,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  VerticalDivider(
                      thickness: 1, width: 1, color: Color(0xff809FB8)),
                  SizedBox(width: 16),
                  Text(tableNameList[i],
                      style: sideBarAccordianContentTextStyle),
                ],
              ),
            ),
          ),
        );
        textButtonList.add(temp);
      }
      return AccordionSection(
        headerPadding: const EdgeInsets.only(left: 27, right: 25, bottom: 10),
        rightIcon: const Icon(
          Icons.keyboard_arrow_down,
          size: 20,
          color: Color(0xff809FB8),
          // size: 12,
        ),
        isOpen: false,
        headerBackgroundColor: Colors.white,
        header: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(icon, color: const Color(0xff809FB8)),
            const SizedBox(width: 10),
            Text(header, style: sideBarAccordianHeaderTextStyle),
          ],
        ),
        content: Column(
          children: [...textButtonList],
        ),
        contentHorizontalPadding: 22,
        contentVerticalPadding: 0,
      );
    }

    return Container(
      color: Colors.white,
      width: 250,
      child: Column(children: [
        const SizedBox(height: 61),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            height: 24,
            width: 118,
            margin: const EdgeInsets.only(left: 40),
            alignment: Alignment.centerLeft,
            child: SvgPicture.asset('images/pf_logo.svg',
                semanticsLabel: 'Pf Logo'),
          ),
        ),
        const SizedBox(height: 38),
        Expanded(
          child: ListView(
            children: [
              Accordion(
                  headerPadding: EdgeInsets.only(left: 28, bottom: 13),
                  contentBorderColor: Colors.white,
                  openAndCloseAnimation: false,
                  disableScrolling: true,
                  children: [
                    AccordionSection(
                      onOpenSection: () {
                        modelNameToModelConstructor[
                                ReCase(M.toString()).camelCase] is Base
                            ? Provider.of<TableProvider<M>>(context,
                                    listen: false)
                                .clearGetAPiQuery()
                            : null;
                        context.push('/dashBoard');
                      },
                      isOpen: false,
                      headerBackgroundColor: Colors.white,
                      header: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(Icons.dashboard, color: Color(0xff809FB8)),
                          const SizedBox(width: 10),
                          TextButton(
                            style: TextButton.styleFrom(
                              minimumSize: Size.zero,
                              padding: EdgeInsets.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            onPressed: () {
                              modelNameToModelConstructor[
                                      ReCase(M.toString()).camelCase] is Base
                                  ? Provider.of<TableProvider<M>>(context,
                                          listen: false)
                                      .clearGetAPiQuery()
                                  : null;
                              context.push('/dashBoard');
                            },
                            child: const Text("대쉬보드",
                                style: sideBarAccordianHeaderTextStyle),
                          ),
                        ],
                      ),
                      content: const SizedBox(),
                    ),
                    accordionSection(Icons.house, "고객관리", ["입주고객", "입주멤버"]),
                    accordionSection(Icons.apartment, "공간관리", [
                      "지점", "사무실",
                      // "사무실가격",
                      '센서', '센서측정값'
                    ]),
                    accordionSection(Icons.manage_search, "인사관리", [
                      "매니저",
                      // "매니저 권한",
                      "운영사"
                    ]),
                    accordionSection(Icons.verified_user, "보안관리", [
                      "출입문", "출입권한",
                      //  "출입기록"
                    ]),
                    // accordionSection(Icons.inventory, "재고관리", ["물품관리", "물품코드"]),
                    // accordionSection(Icons.storage, "기록관리", ["운영기록", "메시지기록"]),
                    accordionSection(
                        Icons.campaign, "공지관리", ["공지사항", "이벤트", "이용가이드"]),
                    accordionSection(
                        Icons.description, "계약관리", ["계약", "결제관리", "세금계산서"]),
                    AccordionSection(
                      headerPadding: const EdgeInsets.only(
                          left: 27, right: 25, bottom: 10),
                      rightIcon: const Icon(
                        Icons.keyboard_arrow_down,
                        size: 20,
                        color: Color(0xff809FB8),
                        // size: 12,
                      ),
                      isOpen: false,
                      headerBackgroundColor: Colors.white,
                      header: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Icon(
                            Icons.hail,
                            color: Color(0xff809FB8),
                          ),
                          SizedBox(width: 10),
                          Text("비대면 오피스",
                              style: sideBarAccordianHeaderTextStyle),
                        ],
                      ),
                      content: Column(
                          children: getTextButtonList([
                        "부산대점 3층",
                        "부산대점 4층",
                        "부산대점 6층",
                        "메이커스페이스 7층",
                        "메이커스페이스 8층",
                        "남포점",
                        "초량점",
                        "센텀점",
                      ], [
                        "https://app.gather.town/app/Z3MwjWdFS1CLEzjP/Pathfinder_PNU_3F",
                        "https://app.gather.town/app/Z3MwjWdFS1CLEzjP/Pathfinder_PNU_3F",
                        "https://app.gather.town/app/Z3MwjWdFS1CLEzjP/Pathfinder_PNU_3F",
                        "https://app.gather.town/app/Z3MwjWdFS1CLEzjP/Pathfinder_PNU_3F",
                        "https://app.gather.town/app/Z3MwjWdFS1CLEzjP/Pathfinder_PNU_3F",
                        "https://app.gather.town/app/Z3MwjWdFS1CLEzjP/Pathfinder_PNU_3F",
                        "https://app.gather.town/app/Z3MwjWdFS1CLEzjP/Pathfinder_PNU_3F",
                        "https://app.gather.town/app/Z3MwjWdFS1CLEzjP/Pathfinder_PNU_3F"
                      ])),
                      contentHorizontalPadding: 22,
                      contentVerticalPadding: 0,
                    )
                  ]),
            ],
          ),
        ),
      ]),
    );
  }
}

List<TextButton> getTextButtonList(List<String> textList, List<String> url) {
  List<TextButton> textButtonList = [];
  for (int i = 0; i < textList.length; i++) {
    TextButton temp = TextButton(
      onPressed: () {
        launchUrl(Uri.parse(url[i]));
      },
      child: SizedBox(
        height: 32,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              VerticalDivider(thickness: 1, width: 1, color: Color(0xff809FB8)),
              SizedBox(width: 16),
              Text(textList[i], style: sideBarAccordianContentTextStyle),
            ],
          ),
        ),
      ),
    );
    textButtonList.add(temp);
  }
  return textButtonList;
}
