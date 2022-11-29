import 'package:flutter/material.dart';
import 'package:clean_arch/common/constants/text_style.dart';
import 'package:accordion/accordion.dart';

class SideBarMenu extends StatefulWidget {
  const SideBarMenu({super.key});

  @override
  State<SideBarMenu> createState() => _SideBarMenuState();
}

class _SideBarMenuState extends State<SideBarMenu> {
  @override
  Widget build(BuildContext context) {
    double currentWidth = MediaQuery.of(context).size.width;

    var tenantManagementAccordion = AccordionSection(
        isOpen: false,
        leftIcon: const Icon(Icons.home_work, color: Color(0xff0090FF)),
        header: Text('입주사 관리',
            style:
                currentWidth >= 1920 ? accordionStyle : accordionStyleLapTop),
        content: Column(
          children: [
            Accordion(
                contentBorderColor: Color(0xff0090FF),
                headerBackgroundColor: Colors.white,
                scaleWhenAnimating: false,
                openAndCloseAnimation: true,
                children: [
                  AccordionSection(
                      isOpen: false,
                      header: Text(
                        "예비고객 관리",
                        style: currentWidth >= 1920
                            ? accordionChildTextStyle
                            : accordionChildTextStyleLapTop,
                      ),
                      content: Column(
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.15,
                              height: MediaQuery.of(context).size.width * 0.026,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text("입주사 상담",
                                    style: currentWidth >= 1920
                                        ? accordionElementTextStyle
                                        : accordionElementTextStyleLapTop),
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.15,
                              height: MediaQuery.of(context).size.width * 0.026,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text("방문 예약 관리",
                                    style: currentWidth >= 1920
                                        ? accordionElementTextStyle
                                        : accordionElementTextStyleLapTop),
                              ),
                            ),
                          ),
                        ],
                      )),
                  AccordionSection(
                      header: Text(
                        "입주계약 관리",
                        style: currentWidth >= 1920
                            ? accordionChildTextStyle
                            : accordionChildTextStyleLapTop,
                      ),
                      content: Column(
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.15,
                              height: MediaQuery.of(context).size.width * 0.026,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text("전자서명(모두사인)",
                                    style: currentWidth >= 1920
                                        ? accordionElementTextStyle
                                        : accordionElementTextStyleLapTop),
                              ),
                            ),
                          ),
                        ],
                      )),
                  AccordionSection(
                      header: Text(
                        "고객사 관리",
                        style: currentWidth >= 1920
                            ? accordionChildTextStyle
                            : accordionChildTextStyleLapTop,
                      ),
                      content: Column(
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.15,
                              height: MediaQuery.of(context).size.width * 0.026,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text("고객 정보",
                                    style: currentWidth >= 1920
                                        ? accordionElementTextStyle
                                        : accordionElementTextStyleLapTop),
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.15,
                              height: MediaQuery.of(context).size.width * 0.026,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text("CS",
                                    style: currentWidth >= 1920
                                        ? accordionElementTextStyle
                                        : accordionElementTextStyleLapTop),
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamedAndRemoveUntil(context,
                                  '/tenant/customer/kakao', (route) => false);
                            },
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.15,
                              height: MediaQuery.of(context).size.width * 0.026,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text("카카오 알림톡",
                                    style: currentWidth >= 1920
                                        ? accordionElementTextStyle
                                        : accordionElementTextStyleLapTop),
                              ),
                            ),
                          ),
                        ],
                      )),
                  AccordionSection(
                      header: Text(
                        "잠재고객 관리",
                        style: currentWidth >= 1920
                            ? accordionChildTextStyle
                            : accordionChildTextStyleLapTop,
                      ),
                      content: Column(
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.15,
                              height: MediaQuery.of(context).size.width * 0.026,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text("계약 종료 고객",
                                    style: currentWidth >= 1920
                                        ? accordionElementTextStyle
                                        : accordionElementTextStyleLapTop),
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.15,
                              height: MediaQuery.of(context).size.width * 0.026,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text("이탈 고객",
                                    style: currentWidth >= 1920
                                        ? accordionElementTextStyle
                                        : accordionElementTextStyleLapTop),
                              ),
                            ),
                          ),
                        ],
                      )),
                ]),
          ],
        ));

    var enterManagementAccordion = AccordionSection(
        isOpen: false,
        leftIcon: const Icon(Icons.login, color: Color(0xff0090FF)),
        header: Text('출입 관리',
            style:
                currentWidth >= 1920 ? accordionStyle : accordionStyleLapTop),
        content: Column(
          children: [
            Accordion(
                contentBorderColor: Color(0xff0090FF),
                headerBackgroundColor: Colors.white,
                scaleWhenAnimating: false,
                openAndCloseAnimation: true,
                children: [
                  AccordionSection(
                      isOpen: false,
                      header: Text(
                        "입주자 권한 관리",
                        style: currentWidth >= 1920
                            ? accordionChildTextStyle
                            : accordionChildTextStyleLapTop,
                      ),
                      content: Text("something")),
                  AccordionSection(
                      header: Text(
                        "출입 매체 관리",
                        style: currentWidth >= 1920
                            ? accordionChildTextStyle
                            : accordionChildTextStyleLapTop,
                      ),
                      content: Text("something")),
                  AccordionSection(
                      header: Text(
                        "출입 관리",
                        style: currentWidth >= 1920
                            ? accordionChildTextStyle
                            : accordionChildTextStyleLapTop,
                      ),
                      content: Text("something")),
                  AccordionSection(
                      header: Text(
                        "출입 내역 관리",
                        style: currentWidth >= 1920
                            ? accordionChildTextStyle
                            : accordionChildTextStyleLapTop,
                      ),
                      content: Text("ddd")),
                ]),
          ],
        ));

    var paymentManagementAccordion = AccordionSection(
        isOpen: false,
        leftIcon: const Icon(Icons.local_atm, color: Color(0xff0090FF)),
        header: Text('결제 관리',
            style:
                currentWidth >= 1920 ? accordionStyle : accordionStyleLapTop),
        content: Column(
          children: [
            Accordion(
                contentBorderColor: Color(0xff0090FF),
                headerBackgroundColor: Colors.white,
                scaleWhenAnimating: false,
                openAndCloseAnimation: true,
                children: [
                  AccordionSection(
                      isOpen: false,
                      header: Text(
                        "청구 내역 관리",
                        style: currentWidth >= 1920
                            ? accordionChildTextStyle
                            : accordionChildTextStyleLapTop,
                      ),
                      content: Text("Something")),
                  AccordionSection(
                      header: Text(
                        "결제 수단 관리",
                        style: currentWidth >= 1920
                            ? accordionChildTextStyle
                            : accordionChildTextStyleLapTop,
                      ),
                      content: Text("Something")),
                  AccordionSection(
                      header: Text(
                        "정기 결제 관리",
                        style: currentWidth >= 1920
                            ? accordionChildTextStyle
                            : accordionChildTextStyleLapTop,
                      ),
                      content: Text("Something")),
                ]),
          ],
        ));

    var managerManagementAccordion = AccordionSection(
        isOpen: false,
        leftIcon: const Icon(Icons.content_paste, color: Color(0xff0090FF)),
        header: Text('매니저 관리',
            style:
                currentWidth >= 1920 ? accordionStyle : accordionStyleLapTop),
        content: Column(
          children: [
            Accordion(
                contentBorderColor: Color(0xff0090FF),
                headerBackgroundColor: Colors.white,
                scaleWhenAnimating: false,
                openAndCloseAnimation: true,
                children: [
                  AccordionSection(
                      isOpen: false,
                      header: Text(
                        "조직 관리",
                        style: currentWidth >= 1920
                            ? accordionChildTextStyle
                            : accordionChildTextStyleLapTop,
                      ),
                      content: Text("준비중")),
                  AccordionSection(
                      header: Text(
                        "매니저 관리",
                        style: currentWidth >= 1920
                            ? accordionChildTextStyle
                            : accordionChildTextStyleLapTop,
                      ),
                      content: Text("준비중")),
                ]),
          ],
        ));

    var buildingManagementAccordion = AccordionSection(
        isOpen: false,
        leftIcon: const Icon(Icons.build, color: Color(0xff0090FF)),
        header: Text('시설 관리',
            style:
                currentWidth >= 1920 ? accordionStyle : accordionStyleLapTop),
        content: Column(
          children: [
            Accordion(
                contentBorderColor: Color(0xff0090FF),
                headerBackgroundColor: Colors.white,
                scaleWhenAnimating: false,
                openAndCloseAnimation: true,
                children: [
                  AccordionSection(
                      isOpen: false,
                      header: Text(
                        "시설 관리",
                        style: currentWidth >= 1920
                            ? accordionChildTextStyle
                            : accordionChildTextStyleLapTop,
                      ),
                      content: Text("준비중")),
                  AccordionSection(
                      header: Text(
                        "자산 관리",
                        style: currentWidth >= 1920
                            ? accordionChildTextStyle
                            : accordionChildTextStyleLapTop,
                      ),
                      content: Text("준비중")),
                  AccordionSection(
                      header: Text(
                        "비품 관리",
                        style: currentWidth >= 1920
                            ? accordionChildTextStyle
                            : accordionChildTextStyleLapTop,
                      ),
                      content: Text('준비중')),
                  AccordionSection(
                      header: Text(
                        "환경 관리",
                        style: currentWidth >= 1920
                            ? accordionChildTextStyle
                            : accordionChildTextStyleLapTop,
                      ),
                      content: Text("준비중")),
                ]),
          ],
        ));
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
                top: MediaQuery.of(context).size.width * 0.133,
                left: MediaQuery.of(context).size.width * 0.010),
            child: Accordion(
              contentBorderColor: Color(0xff0090FF),
              headerBackgroundColor: Colors.white,
              scaleWhenAnimating: false,
              openAndCloseAnimation: true,
              children: [
                tenantManagementAccordion,
                enterManagementAccordion,
                paymentManagementAccordion,
                managerManagementAccordion,
                buildingManagementAccordion
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
