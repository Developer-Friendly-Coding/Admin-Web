import 'package:clean_arch/common/constants/text_style.dart';
import 'package:clean_arch/provider/impl/base_table_provider_impl.dart';
import 'package:flutter/material.dart';
import 'package:clean_arch/model(DTO)/base_model.dart';
import 'package:provider/provider.dart';

class BaseTableRangeBox<M extends Base> extends StatelessWidget {
  final String prefix;
  final String suffix;
  final double textFieldWidth;
  final double paddingTopAndBottom;
  final double buttonWidth;
  final double buttonHeight;
  final Color color;
  final bool test;
  final String startMemberName;
  final String endMemberName;
  final TextEditingController startController = TextEditingController();
  final TextEditingController endController = TextEditingController();

  BaseTableRangeBox(
      {required this.startMemberName,
      required this.endMemberName,
      this.buttonWidth = 70,
      this.buttonHeight = 30,
      this.color = Colors.transparent,
      this.paddingTopAndBottom = 10,
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
              contentPadding: EdgeInsets.only(
                  left: 5,
                  right: 0,
                  top: paddingTopAndBottom,
                  bottom: paddingTopAndBottom),
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
    BaseTableProvider<M> providerRead =
        Provider.of<BaseTableProvider<M>>(context, listen: false);
    return Row(
      children: [
        rangeTextField(context, startController),
        const Text("~"),
        rangeTextField(context, endController),
        SizedBox(width: 10),
        SizedBox(
            width: buttonWidth,
            height: buttonHeight,
            child: ElevatedButton(
                onPressed: () {
                  providerRead.getTableDateByRange(startMemberName,
                      startController.text, endMemberName, endController.text);
                },
                child: Text("확인"))),
      ],
    );
  }
}
