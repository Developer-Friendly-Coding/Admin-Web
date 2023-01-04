import 'package:flutter/material.dart';

class BoardViewPage extends StatelessWidget {
  const BoardViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffFF3939),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(children: [
        Text(
          "사 용 중",
          style: TextStyle(
            fontSize: 75,
            color: Colors.white,
            decoration: TextDecoration.none,
          ),
        ),
        Row(
          children: [
            Column(
              children: [Text("NOW"), Text("NOW"), Text("NOW"), Text("NOW")],
            ),
            Column(
              children: [Text("NOW"), Text("NOW"), Text("NOW"), Text("NOW")],
            )
          ],
        ),
      ]),
    );
  }
}
