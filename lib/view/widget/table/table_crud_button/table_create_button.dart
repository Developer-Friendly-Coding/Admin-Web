import 'package:clean_arch/common/constants/text_style.dart';
import 'package:flutter/material.dart';
import 'package:clean_arch/model/base_model.dart';
import 'package:go_router/go_router.dart';
import 'package:recase/recase.dart';

class TableCreateButton<M extends Base> extends StatefulWidget {
  final double alertWidth;
  final double alertHeight;
  final double componentNameWidth;
  final double componentInputWidth;
  final bool isFromRelatedTable;
  final Future<bool> Function()? getRelatedDataById;
  const TableCreateButton(
      {this.alertWidth = 900,
      this.alertHeight = 300,
      this.componentNameWidth = 100,
      this.componentInputWidth = 170,
      this.isFromRelatedTable = false,
      this.getRelatedDataById,
      super.key});

  @override
  State<TableCreateButton<M>> createState() => _TableCreateButtonState<M>();
}

class _TableCreateButtonState<M extends Base>
    extends State<TableCreateButton<M>> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            fixedSize: Size(100, 44)),
        onPressed: () {
          context.push(
            "/${ReCase(M.toString()).camelCase}/create",
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('추가', style: createButtonTextStyle),
            SizedBox(width: 9.8),
            Icon(
              Icons.add_circle_outline,
              size: 20.25,
            )
          ],
        ));
  }
}
