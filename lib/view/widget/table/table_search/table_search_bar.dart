import 'package:clean_arch/provider/impl/table_provider_impl.dart';
import 'package:flutter/material.dart';
import 'package:clean_arch/common/constants/text_style.dart';
import 'package:clean_arch/model/base_model.dart';
import 'package:provider/provider.dart';

class TableSearchBar<M extends Base> extends StatelessWidget {
  final double width;
  final double paddingTopAndBottom;
  final double iconSize;
  final Color color;
  final String memberName;
  final String? Function(String?)? validator;
  TextEditingController controller = TextEditingController();
  TableSearchBar(
      {required this.memberName,
      this.width = 250,
      this.paddingTopAndBottom = 0,
      this.iconSize = 20,
      this.color = Colors.transparent,
      this.validator,
      super.key});

  @override
  Widget build(BuildContext context) {
    TableProvider<M> providerRead =
        Provider.of<TableProvider<M>>(context, listen: false);
    return SizedBox(
      width: width,
      child: TextFormField(
        validator: validator,
        controller: controller,
        style: MediaQuery.of(context).size.width < 1920
            ? unifiedSearchStyleLapTop
            : unifiedSearchStyle,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.0166,
              right: 0,
              top: paddingTopAndBottom,
              bottom: paddingTopAndBottom),
          filled: true,
          fillColor: color,
          isDense: true,
          suffixIcon: IconButton(
            onPressed: () {
              providerRead.getDataBySearchBar(memberName, controller.text);
            },
            icon: Icon(
              Icons.search,
              size: iconSize,
            ),
          ),
        ),
        textInputAction: TextInputAction.go,
        onFieldSubmitted: (value) async {
          providerRead.getDataBySearchBar(memberName, controller.text);
        },
      ),
    );
  }
}
