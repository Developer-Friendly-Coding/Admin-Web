import 'package:clean_arch/common/constants/text_style.dart';
import 'package:clean_arch/model/impl/office.dart';
import 'package:clean_arch/provider/impl/table_provider_impl.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class BoardViewPage extends StatelessWidget {
  final int selectedId;

  const BoardViewPage({required this.selectedId, super.key});

  @override
  Widget build(BuildContext context) {
    TableProvider providerRead =
        Provider.of<TableProvider<Office>>(context, listen: false);
    return FutureBuilder(
      future: providerRead.getBoadrViewDataById(selectedId),
      builder: ((ctx, snapshot) {
        if (snapshot.hasError) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Error: ${snapshot.error}',
              style: const TextStyle(fontSize: 15),
            ),
          );
        } else if (snapshot.hasData == false) {
          return const Center(child: Text("Loading...", style: snapShotStyle));
        } else if (snapshot.data!["statusCode"] != 200) {
          // errorDialog(ctx, snapshot.data!["statusCode"],
          //         snapshot.data!["error"], snapshot.data!["message"])
          return Center(
            child: Container(
              width: 1000,
              height: 300,
              child: Column(
                children: const [
                  Text(
                    "에러 발생",
                    style: snapShotStyle,
                  ),
                  SizedBox(height: 50),
                  Text(
                    "개발자에게 문의하세요",
                    style: snapShotStyle,
                  ),
                ],
              ),
            ),
          );
        } else {
          bool inUse = snapshot.data!["inUse"];
          late User now;
          if (inUse) {
            now = User.fromJson(snapshot.data!["now"]);
          }
          late User next;
          if (snapshot.data!["next"].isNotEmpty) {
            next = User.fromJson(snapshot.data!["next"]);
          }

          return Container(
            color: inUse
                ? const Color(0xffFF3939)
                : const Color.fromARGB(255, 39, 212, 88),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(children: [
              const SizedBox(height: 50),
              inUse
                  ? const Text(
                      "사 용 중",
                      style: TextStyle(
                        fontSize: 75,
                        color: Colors.white,
                        decoration: TextDecoration.none,
                      ),
                    )
                  : const Text(
                      "예 약 가 능",
                      style: TextStyle(
                        fontSize: 75,
                        color: Colors.white,
                        decoration: TextDecoration.none,
                      ),
                    ),
              const SizedBox(height: 180),
              inUse
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: getTextList("NOW", now),
                        ),
                        const SizedBox(width: 200),
                        Column(
                          children: getTextList("NEXT", next),
                        )
                      ],
                    )
                  : snapshot.data!["next"].isNotEmpty
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: getTextList("NEXT", next),
                            ),
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: const [
                                Text("NEXT", style: boardViewStyle),
                                SizedBox(height: 50),
                                Text("예약없음", style: boardViewStyle)
                              ],
                            ),
                          ],
                        )
            ]),
          );
        }
      }),
    );
  }
}

class User {
  String name;
  String customerName;
  DateTime startDateTime;
  DateTime endDateTime;

  User({
    required String name,
    required String customerName,
    required DateTime startDateTime,
    required DateTime endDateTime,
  })  : this.name = name,
        this.customerName = customerName,
        this.startDateTime = startDateTime,
        this.endDateTime = endDateTime;

  factory User.fromJson(Map<String, dynamic> data) {
    return User(
      name: data['name'],
      customerName: data['customerName'],
      startDateTime: DateTime.parse(data['startDateTime']),
      endDateTime: DateTime.parse(data['endDateTime']),
    );
  }
}

List<Text> getTextList(String userState, User user) {
  List<Text> textList = [];
  textList.add(Text(userState, style: boardViewStyle));
  textList.add(Text(user.customerName, style: boardViewStyle));
  textList.add(Text(user.name, style: boardViewStyle));
  textList.add(Text(
      "${DateFormat("hh:mm").format(user.startDateTime)} ~ ${DateFormat("hh:mm").format(user.endDateTime)}",
      style: boardViewStyle));

  return textList;
}
