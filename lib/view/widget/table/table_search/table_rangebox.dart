import 'package:clean_arch/common/constants/text_style.dart';
import 'package:clean_arch/provider/impl/table_provider_impl.dart';
import 'package:flutter/material.dart';
import 'package:clean_arch/model/base_model.dart';
import 'package:provider/provider.dart';

class TableRangeBox<M extends Base> extends StatelessWidget {
  final String prefix;
  final String suffix;
  final double textFieldWidth;
  final double confirmButtonWidth;
  final double clearButtonWidth;
  final Color confirmButtonColor;
  final Color clearButtonColor;
  final double buttonHeight;
  final Color color;
  final bool test;
  final String startMemberName;
  final String endMemberName;
  final TextEditingController startController = TextEditingController();
  final TextEditingController endController = TextEditingController();

  TableRangeBox(
      {required this.startMemberName,
      required this.endMemberName,
      this.confirmButtonColor = Colors.blue,
      this.clearButtonColor = Colors.red,
      this.confirmButtonWidth = 70,
      this.clearButtonWidth = 80,
      this.buttonHeight = 30,
      this.color = Colors.transparent,
      this.test = false,
      this.textFieldWidth = 100,
      this.suffix = "",
      this.prefix = "",
      super.key});

  Row rangeTextField(BuildContext context, TextEditingController controller) {
    return Row(
      children: [
        Text(prefix),
        const SizedBox(width: 5),
        SizedBox(
          width: textFieldWidth,
          child: TextFormField(
            controller: controller,
            style: MediaQuery.of(context).size.width < 1920
                ? unifiedSearchStyleLapTop
                : unifiedSearchStyle,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.only(left: 5, right: 0, top: 10, bottom: 10),
              filled: true,
              fillColor: test == true ? Colors.amber : Colors.transparent,
              isDense: true,
              border: const OutlineInputBorder(
                borderSide: BorderSide(
                  width: 5,
                  style: BorderStyle.none,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 5),
        Text(suffix),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    TableProvider<M> providerRead =
        Provider.of<TableProvider<M>>(context, listen: false);
    return Row(
      children: [
        rangeTextField(context, startController),
        const Text("~"),
        rangeTextField(context, endController),
        SizedBox(width: 10),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: confirmButtonColor,
                fixedSize: Size(confirmButtonWidth, buttonHeight)),
            onPressed: () {
              providerRead.getDateByRange(startMemberName, startController.text,
                  endMemberName, endController.text);
            },
            child: const Text("확인")),
        const SizedBox(width: 10),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: clearButtonColor,
                fixedSize: Size(clearButtonWidth, buttonHeight)),
            onPressed: () {
              providerRead.getDateByRange(
                  startMemberName, "", endMemberName, "");
              startController.text = "";
              endController.text = "";
            },
            child: Text("초기화")),
      ],
    );
  }
}
