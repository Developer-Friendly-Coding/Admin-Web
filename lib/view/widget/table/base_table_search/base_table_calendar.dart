import 'package:clean_arch/model(DTO)/base_model.dart';
import 'package:clean_arch/provider/impl/base_table_provider_impl.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_date_picker/web_date_picker.dart';
import 'package:month_picker_dialog_2/month_picker_dialog_2.dart';

//ignore: must_be_immutable
class BaseTableCalendar<M extends Base> extends StatefulWidget {
  final Color color;
  final double width;
  final double height;
  final double buttonWidth;
  final double buttonHeight;
  final String startMemberName;
  final String endMemberName;

  const BaseTableCalendar(
      {required this.startMemberName,
      required this.endMemberName,
      this.buttonWidth = 70,
      this.buttonHeight = 30,
      this.color = Colors.transparent,
      this.width = 145,
      this.height = 30,
      super.key});

  @override
  State<BaseTableCalendar<M>> createState() => _BaseTableCalendarState<M>();
}

class _BaseTableCalendarState<M extends Base>
    extends State<BaseTableCalendar<M>> {
  final TextEditingController controller = TextEditingController();
  DateTime? selectedDate;

  DateTime starDate = DateTime(0);

  DateTime endDate = DateTime(0);

  @override
  Widget build(BuildContext context) {
    BaseTableProvider<M> providerRead =
        Provider.of<BaseTableProvider<M>>(context, listen: false);
    return Container(
      color: widget.color,
      child: Row(
        children: [
          WebDatePicker(
            width: widget.width,
            height: widget.height,
            onChange: (value) {
              starDate = value!;
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
                        starDate.toString(),
                        widget.endMemberName,
                        starDate.toString());
                  },
                  child: const Text("확인"))),
        ],
      ),
    );
  }
}
