import 'package:clean_arch/view/page/table_create_page.dart';
import 'package:flutter/material.dart';
import 'package:clean_arch/model/base_model.dart';

class TableCreateButton<M extends Base> extends StatefulWidget {
  final double alertWidth;
  final double alertHeight;
  final double componentNameWidth;
  final double componentInputWidth;

  const TableCreateButton(
      {this.alertWidth = 900,
      this.alertHeight = 300,
      this.componentNameWidth = 100,
      this.componentInputWidth = 170,
      super.key});

  @override
  State<TableCreateButton<M>> createState() => _TableCreateButtonState<M>();
}

class _TableCreateButtonState<M extends Base>
    extends State<TableCreateButton<M>> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => (TableCreatePage<M>()),
            ),
          );
        },
        child: const Text('추가'));
  }
}
