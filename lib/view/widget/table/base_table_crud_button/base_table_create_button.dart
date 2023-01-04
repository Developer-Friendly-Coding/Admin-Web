import 'package:clean_arch/common/constants/mapper/table_column_attributes_mapper.dart';
import 'package:clean_arch/common/constants/text_style.dart';
import 'package:clean_arch/view/page/table_create_page.dart';
import 'package:clean_arch/view/widget/error_dialog.dart';
import 'package:clean_arch/view/widget/table/base_table_view/base_table_attributes.dart';
import 'package:flutter/material.dart';
import 'package:clean_arch/model/base_model.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:clean_arch/provider/impl/base_table_provider_impl.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:web_date_picker/web_date_picker.dart';
import 'package:flutter_test/flutter_test.dart';

class BaseTableCreateButton<M extends Base> extends StatefulWidget {
  final double alertWidth;
  final double alertHeight;
  final double componentNameWidth;
  final double componentInputWidth;

  const BaseTableCreateButton(
      {this.alertWidth = 900,
      this.alertHeight = 300,
      this.componentNameWidth = 100,
      this.componentInputWidth = 170,
      super.key});

  @override
  State<BaseTableCreateButton<M>> createState() =>
      _BaseTableCreateButtonState<M>();
}

class _BaseTableCreateButtonState<M extends Base>
    extends State<BaseTableCreateButton<M>> {
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
