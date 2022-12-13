import 'package:clean_arch/provider/impl/base_table_provider_impl.dart';
import 'package:flutter/material.dart';
import 'package:clean_arch/common/constants/text_style.dart';
import 'package:clean_arch/model/base_model.dart';
import 'package:provider/provider.dart';

class BaseTableSearchBar<M extends Base> extends StatelessWidget {
  final double width;
  final double paddingTopAndBottom;
  final double iconSize;
  final Color color;
  final String memberName;
  final controller = TextEditingController();
  BaseTableSearchBar(
      {required this.memberName,
      this.width = 250,
      this.paddingTopAndBottom = 0,
      this.iconSize = 20,
      this.color = Colors.transparent,
      super.key});

  @override
  Widget build(BuildContext context) {
    BaseTableProvider<M> providerRead =
        Provider.of<BaseTableProvider<M>>(context, listen: false);
    return SizedBox(
      width: width,
      child: TextFormField(
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
              providerRead.getTableDataBySearchBar(memberName, controller.text);
            },
            icon: Icon(
              Icons.search,
              size: iconSize,
            ),
          ),
        ),
        textInputAction: TextInputAction.go,
        onFieldSubmitted: (value) async {
          providerRead.getTableDataBySearchBar(memberName, controller.text);
        },
      ),
    );
  }
}
