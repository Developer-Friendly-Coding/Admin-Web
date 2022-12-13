import 'package:flutter/material.dart';
import 'package:clean_arch/model/base_model.dart';

//ignore: must_be_immutable
class BaseTableCheckBox<M extends Base> extends StatefulWidget {
  final double height;
  final double width;
  final Color color;
  final bool test;
  final List<Enum> enumList;
  final double iconScale;
  final double iconLeftMargin;
  final double textLeftMargin;
  final String memberName;
  late List<bool?> isCheckedList =
      List<bool?>.generate(enumList.length, (int idx) {
    return false;
  }, growable: false);

  BaseTableCheckBox(
      {required this.enumList,
      required this.memberName,
      this.width = 110,
      this.height = 35,
      this.test = false,
      this.color = Colors.transparent,
      this.iconScale = 0.7,
      this.textLeftMargin = 27,
      this.iconLeftMargin = 0,
      super.key});

  @override
  State<BaseTableCheckBox<M>> createState() => _BaseTableCheckBoxState<M>();
}

class _BaseTableCheckBoxState<M extends Base>
    extends State<BaseTableCheckBox<M>> {
  Enum? enumValue;

  List<Widget> checkListTile() {
    List<Widget> result = [];
    for (int i = 0; i < widget.enumList.length; i++) {
      Container radioListTile = Container(
        color: widget.test == true ? Colors.amber : null,
        width: widget.width,
        height: widget.height,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: EdgeInsets.only(left: widget.iconLeftMargin),
                child: Transform.scale(
                  scale: widget.iconScale,
                  child: Checkbox(
                      value: widget.isCheckedList[i],
                      onChanged: (value) {
                        setState(() {
                          widget.isCheckedList[i] = value;
                        });
                      }),
                ),
              ),
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Container(
                    margin: EdgeInsets.only(left: widget.textLeftMargin),
                    child: Text(widget.enumList[i].toString())))
          ],
        ),
      );

      result.add(radioListTile);
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.color,
      child: Wrap(
        direction: Axis.horizontal,
        children: checkListTile(),
      ),

      //
    );
  }
}
