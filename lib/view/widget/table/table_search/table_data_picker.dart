import 'package:clean_arch/common/constants/text_style.dart';
import 'package:clean_arch/model/base_model.dart';
import 'package:clean_arch/provider/impl/table_provider_impl.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

//ignore: must_be_immutable
class DatePicker<M extends Base> extends StatelessWidget {
  final Color color;
  final double width;
  final double height;
  final double confirmButtonWidth;
  final double clearButtonWidth;
  final Color confirmButtonColor;
  final Color clearButtonColor;
  final double buttonHeight;
  final String startMemberName;
  final String endMemberName;
  final TextEditingController fromController = TextEditingController();
  final TextEditingController toController = TextEditingController();
  DateTime _fromSelectedDate = DateTime.now();
  DateTime _toSelectedDate = DateTime.now();
  DatePicker(
      {required this.startMemberName,
      required this.endMemberName,
      this.confirmButtonColor = Colors.blue,
      this.clearButtonColor = Colors.red,
      this.confirmButtonWidth = 70,
      this.clearButtonWidth = 80,
      this.buttonHeight = 30,
      this.color = Colors.transparent,
      this.width = 145,
      this.height = 30,
      super.key});

  final TextEditingController controller = TextEditingController();

  _selectDate(BuildContext context, String fromOrTo,
      TextEditingController controller) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));
    switch (fromOrTo) {
      case "from":
        if (picked != null && picked != _fromSelectedDate) {
          _fromSelectedDate = picked;
          controller.text = DateFormat('yyyy-MM-dd').format(_fromSelectedDate);
        }
        break;
      case "to":
        if (picked != null && picked != _toSelectedDate) {
          _toSelectedDate = picked;
          controller.text = DateFormat('yyyy-MM-dd').format(_toSelectedDate);
        }
        break;
      default:
    }
  }

  Row datePickerTextField(
      BuildContext context, TextEditingController controller, String fromOrTo) {
    return Row(
      children: [
        const SizedBox(width: 5),
        SizedBox(
          width: 140,
          child: TextFormField(
            controller: controller,
            style: MediaQuery.of(context).size.width < 1920
                ? unifiedSearchStyleLapTop
                : unifiedSearchStyle,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(
                  left: 10, right: 0, top: 10, bottom: 10),
              filled: true,
              fillColor: Colors.transparent,
              isDense: true,
              border: const OutlineInputBorder(
                borderSide: BorderSide(
                  width: 5,
                  style: BorderStyle.none,
                ),
              ),
              suffixIcon: IconButton(
                onPressed: () {
                  _selectDate(context, fromOrTo, controller);
                },
                icon: const Icon(Icons.calendar_month),
              ),
            ),
          ),
        ),
        const SizedBox(width: 5),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    TableProvider<M> providerRead =
        Provider.of<TableProvider<M>>(context, listen: false);

    return Row(
      children: [
        datePickerTextField(context, fromController, "from"),
        const Text("~"),
        datePickerTextField(context, toController, "to"),
        const SizedBox(width: 10),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: confirmButtonColor,
                fixedSize: Size(confirmButtonWidth, buttonHeight)),
            onPressed: () {
              providerRead.getDateByRange(
                startMemberName,
                fromController.text == ""
                    ? ""
                    : DateFormat("yyyy-MM-dd hh:mm:ss")
                        .format(_fromSelectedDate),
                endMemberName,
                toController.text == ""
                    ? ""
                    : DateFormat("yyyy-MM-dd hh:mm:ss").format(_toSelectedDate),
              );
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
              fromController.text = "";
              toController.text = "";
            },
            child: const Text("초기화")),
      ],
    );
  }
}
