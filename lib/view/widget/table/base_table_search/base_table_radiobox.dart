import 'package:clean_arch/provider/impl/base_table_provider_impl.dart';
import 'package:flutter/material.dart';
import 'package:clean_arch/model/base_model.dart';
import 'package:provider/provider.dart';

class BaseTableRadioBox<M extends Base> extends StatefulWidget {
  final double height;
  final double width;
  final Color color;
  final bool test;
  final List<Enum> enumList;
  final double iconScale;
  final double iconLeftMargin;
  final double textLeftMargin;
  final String memberName;
  const BaseTableRadioBox(
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
  State<BaseTableRadioBox<M>> createState() => _BaseTableRadioBoxState<M>();
}

class _BaseTableRadioBoxState<M extends Base>
    extends State<BaseTableRadioBox<M>> {
  Enum? enumValue;
  List<Widget> radioListTile(BuildContext context) {
    BaseTableProvider<M> providerRead =
        Provider.of<BaseTableProvider<M>>(context, listen: false);

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
                  child: Radio(
                    value: widget.enumList[i],
                    groupValue: enumValue,
                    onChanged: (Enum? value) {
                      setState(() {
                        enumValue = value;
                      });
                      providerRead.getTableDataByRadioBox(
                          widget.memberName, enumValue!);
                    },
                  ),
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
        children: radioListTile(context),
      ),

      //
    );
  }
}
