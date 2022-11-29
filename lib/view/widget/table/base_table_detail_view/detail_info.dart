import 'package:clean_arch/common/constants/table_column_attributes_mapper.dart';
import 'package:clean_arch/common/constants/text_style.dart';
import 'package:clean_arch/model(DTO)/base_model.dart';
import 'package:clean_arch/provider/impl/base_table_provider_impl.dart';
import 'package:clean_arch/view/widget/table/base_table_view/base_table_attributes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//ignore: must_be_immutable
class DetailInfo<M extends Base> extends StatelessWidget {
  int selectedId;
  final double widthRate;
  final double height;
  final List<ColumnAttributes> columnAttributesList =
      columnAttributesMapper[M.toString()]!;
  Color color;

  DetailInfo(
      {required this.selectedId,
      required this.widthRate,
      required this.height,
      required this.color,
      super.key});

  List<Widget> detailComponentList(BaseTableProvider<M> providerRead) {
    providerRead.setDetailUpdateButtonTECList();
    List<Widget> result = [];

    for (int i = 1; i < columnAttributesList.length; i++) {
      Container component = Container(
        color: color,
        child: Row(
          children: [
            SizedBox(width: 30),
            Container(
                width: 55,
                child: Text(
                  columnAttributesList[i].columnName,
                  style: detailInfoStyle,
                )),
            SizedBox(
                width: 180,
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: columnAttributesList[i].validator,
                  controller: providerRead.updateButtonTECList[i],
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                )),
          ],
        ),
      );
      result.add(component);
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    BaseTableProvider<M> providerRead =
        Provider.of<BaseTableProvider<M>>(context, listen: false);

    return FutureBuilder(
      future: providerRead.getDetailRowDataById(selectedId),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(
              child: Text(
            "Error!...",
            style: snapShotStyle,
          ));
        } else if (snapshot.hasData == false) {
          return const Center(
              child: Text(
            "Loading...",
            style: snapShotStyle,
          ));
        } else {
          List<Widget> detailCL = detailComponentList(providerRead);

          return Container(
            height: 100 + height,
            color: color,
            child: Column(
              children: [
                Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width * widthRate,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * widthRate,
                  height: height,
                  child: GridView.builder(
                    itemCount: detailCL.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3, //1 개의 행에 보여줄 item 개수
                            childAspectRatio: 5 / 1, //가로 대 세로 비율
                            crossAxisSpacing: 0,
                            mainAxisSpacing: 10),
                    itemBuilder: (BuildContext context, int index) {
                      return detailCL[index];
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 600, right: 100),
                  height: 50,
                  width: MediaQuery.of(context).size.width * widthRate,
                  child: ElevatedButton(
                    child: Text("수정"),
                    onPressed: (() {}),
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
