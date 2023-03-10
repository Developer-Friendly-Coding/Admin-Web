import 'package:clean_arch/model/base_model.dart';
import 'package:clean_arch/provider/impl/table_provider_impl.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:web_date_picker/web_date_picker.dart';
import 'package:month_picker_dialog_2/month_picker_dialog_2.dart';

//ignore: must_be_immutable
class TableCalendar<M extends Base> extends StatefulWidget {
  final Color color;
  final double width;
  final double height;
  final double buttonWidth;
  final double buttonHeight;
  final String startMemberName;
  final String endMemberName;

  const TableCalendar(
      {required this.startMemberName,
      required this.endMemberName,
      this.buttonWidth = 70,
      this.buttonHeight = 30,
      this.color = Colors.transparent,
      this.width = 145,
      this.height = 30,
      super.key});

  @override
  State<TableCalendar<M>> createState() => _TableCalendarState<M>();
}

class _TableCalendarState<M extends Base> extends State<TableCalendar<M>> {
  final TextEditingController controller = TextEditingController();
  DateTime? selectedDate;

  DateTime startDate = DateTime(0001);

  DateTime endDate = DateTime(9999);

  @override
  Widget build(BuildContext context) {
    TableProvider<M> providerRead =
        Provider.of<TableProvider<M>>(context, listen: false);
    return Container(
      color: widget.color,
      child: Row(
        children: [
          WebDatePicker(
            width: widget.width,
            height: widget.height,
            onChange: (value) {
              startDate = value!;
            },
          ),
          const Text("~"),
          WebDatePicker(
            width: widget.width,
            height: widget.height,
            onChange: (value) {
              endDate = value!;
            },
          ),
          SizedBox(width: 10),
          SizedBox(
              width: widget.buttonWidth,
              height: widget.buttonHeight,
              child: ElevatedButton(
                  onPressed: () {
                    providerRead.getTableDateByRange(
                      widget.startMemberName,
                      DateFormat("yyyy-MM-dd hh:mm:ss").format(startDate),
                      widget.endMemberName,
                      DateFormat("yyyy-MM-dd hh:mm:ss").format(endDate),
                    );
                  },
                  child: const Text("??????"))),
        ],
      ),
    );
  }
}
