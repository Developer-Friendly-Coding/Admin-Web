import 'package:clean_arch/common/constants/column_attributes.dart';
import 'package:clean_arch/common/constants/mapper/table_column_attributes_mapper.dart';
import 'package:clean_arch/common/constants/mapper/table_search_child_mapper.dart';
import 'package:clean_arch/common/constants/text_style.dart';
import 'package:clean_arch/model/base_model.dart';
import 'package:clean_arch/model/impl/contract.dart';
import 'package:clean_arch/model/impl/customer.dart';
import 'package:clean_arch/model/impl/customer_memeber.dart';
import 'package:clean_arch/model/impl/gate.dart';
import 'package:clean_arch/model/impl/office.dart';
import 'package:clean_arch/model/impl/sensor.dart';
import 'package:clean_arch/provider/impl/table_provider_impl.dart';
import 'package:clean_arch/view/widget/table/table_search/table_cu_dialog.dart';
import 'package:clean_arch/view/widget/table/table_search/table_search_child.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//ignore: must_be_immutable
class TableSearchContainer<M extends Base> extends StatelessWidget {
  final List<SearchChild> searchContainerChildList =
      searchChildMapper[M.toString()]!;
  final List<ColumnAttributes> columnAttributesList =
      columnAttributesMapper[M.toString()]!;
  final List<Type> havingDescriptionModelList = [
    Contract,
    Customer,
    Office,
    CustomerMember,
    Gate,
    Sensor,
  ];
  final bool? isCuDialog;
  final Map<int, TextEditingController> controllerMapper = {};
  final double hegiht;
  final double nameWidth;
  final double nameLeftMargin;
  final double clearButtonWidth;
  final double clearButtonHeigt;
  final double searchButtonWidth;
  final double searchButtonHeigt;
  final Color color;

  TableSearchContainer(
      {this.isCuDialog = false,
      this.hegiht = 128,
      this.nameWidth = 100,
      this.nameLeftMargin = 30,
      this.clearButtonHeigt = 44,
      this.clearButtonWidth = 87,
      this.searchButtonHeigt = 44,
      this.searchButtonWidth = 87,
      this.color = Colors.white,
      super.key});

  SizedBox dateTimeSearchBox(int i) {
    controllerMapper[i] = TextEditingController();
    return SizedBox(
      width: 184,
      height: 44,
      child: TextFormField(
        controller: controllerMapper[i],
        readOnly: true,
        style: searchTextStyle,
        decoration: InputDecoration(
          labelText: columnAttributesList[i].name,
          labelStyle: searchTextStyle,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(width: 1, color: Color(0xffC8C8CB)),
          ),
          suffixIcon: IconButton(
            onPressed: () {
              // _selectDate(
              //   context,
              //   providerRead.addButtonTECList[i],
              // );
            },
            icon: const Icon(Icons.calendar_month),
          ),
        ),
      ),
    );
  }

  SizedBox textSearchBox(int i, TableProvider providerRead) {
    controllerMapper[i] = TextEditingController();
    return SizedBox(
      width: 184,
      height: 44,
      child: TextFormField(
        onChanged: (value) {
          providerRead.setQueryParameters(
              columnAttributesList[i].toJson!, value);
        },
        controller: controllerMapper[i],
        style: searchTextStyle,
        decoration: InputDecoration(
          labelText: columnAttributesList[i].name,
          labelStyle: searchTextStyle,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(width: 1, color: Color(0xffC8C8CB)),
          ),
        ),
      ),
    );
  }

  TableCUDialog cuDialog(int i) {
    controllerMapper[i] = TextEditingController();
    return TableCUDialog<M>(
      isSearch: true,
      mode: "search",
      controller: controllerMapper[i]!,
      columnAttributes: columnAttributesList[i],
      border: const OutlineInputBorder(),
    );
  }

  List<Widget> detailComponentList(
      BuildContext context, TableProvider providerRead) {
    List<Widget> result = [];
    for (int i = 0; i < columnAttributesList.length; i++) {
      Container component;

      if (i == 0) {
        continue;
      }
      if (havingDescriptionModelList.contains(M) &&
          i == columnAttributesList.length - 1) {
        continue;
      }
      component = Container(
          child: columnAttributesList[i].enumValus != null
              ? (providerRead.setSearchStringValue("모두", i)
                  ? Container(
                      width: 184,
                      height: 44,
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: Color(0xffC8C8CB),
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: Consumer<TableProvider<M>>(
                          builder: (context, provider, child) {
                            List<String> items = [];
                            items.add("모두");
                            columnAttributesList[i]
                                .enumValus!
                                .forEach((element) {
                              items.add(element.toString());
                            });
                            return DropdownButton(
                              value: provider.searchStringValuesMapper[i],
                              items: items.map(
                                (value) {
                                  return DropdownMenuItem(
                                      value: value,
                                      child: Text(
                                        value,
                                        style: searchTextStyle,
                                      ));
                                },
                              ).toList(),
                              onChanged: ((value) {
                                provider.setSearchStringValue(value, i);
                                value == "모두"
                                    ? providerRead.removeQueryParameters(
                                        columnAttributesList[i].toJson!)
                                    : providerRead.setQueryParameters(
                                        columnAttributesList[i].toJson!,
                                        columnAttributesList[i]
                                            .enumValus!
                                            .firstWhere((element) =>
                                                element.toString() ==
                                                provider
                                                    .searchStringValuesMapper[i])
                                            .name);
                              }),
                            );
                          },
                        ),
                      ),
                    )
                  : const SizedBox())
              : columnAttributesList[i].type == DateTime
                  ? dateTimeSearchBox(i)
                  : columnAttributesList[i].isCuDialog == true
                      ? cuDialog(i)
                      : textSearchBox(i, providerRead));
      result.add(component);
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    TableProvider providerRead =
        Provider.of<TableProvider<M>>(context, listen: false);
    return Container(
      color: color,
      child: Column(
        children: [
          SizedBox(height: 10),
          Row(
            children: [
              SizedBox(width: 15),
              Expanded(
                child: Container(
                  child: Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      ...detailComponentList(context, providerRead),
                      Container(
                        width: 184,
                        height: 44,
                        child: Row(
                          children: [
                            TextButton(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        side: BorderSide(
                                            color: Color(0xff217EFD))),
                                    backgroundColor: Colors.white,
                                    fixedSize: Size(
                                        clearButtonWidth, clearButtonHeigt)),
                                onPressed: () async {
                                  isCuDialog == true
                                      ? await providerRead
                                          .getDataClearFilterForCuDialog()
                                      : await providerRead.getDataClearFilter();
                                  for (int i = 0;
                                      i < columnAttributesList.length;
                                      i++) {
                                    columnAttributesList[i].enumValus != null
                                        ? providerRead.setSearchStringValue(
                                            "모두", i)
                                        : null;
                                  }
                                  controllerMapper.forEach((key, value) {
                                    controllerMapper[key]!.text = "";
                                  });
                                },
                                child: const Text(
                                  "초기화",
                                  style: clearButtonTextStyle,
                                )),
                            SizedBox(width: 10),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    backgroundColor: Color(0xff217EFD),
                                    fixedSize: Size(
                                        searchButtonWidth, searchButtonHeigt)),
                                onPressed: () {
                                  isCuDialog == true
                                      ? providerRead
                                          .getDataBySearchFilterForCuDialog()
                                      : providerRead.getDataBySearchFilter();
                                },
                                child: const Text(
                                  "검색",
                                  style: searchButtonTextStyle,
                                ))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 15)
            ],
          ),
          SizedBox(height: 10)
        ],
      ),
    );
  }
}

// import 'package:clean_arch/common/constants/mapper/table_search_child_mapper.dart';
// import 'package:clean_arch/common/constants/text_style.dart';
// import 'package:clean_arch/model/base_model.dart';
// import 'package:clean_arch/view/widget/table/table_search/table_search_child.dart';
// import 'package:flutter/material.dart';

// //ignore: must_be_immutable
// class TableSearchContainer<M extends Base> extends StatelessWidget {
//   final List<SearchChild> searchContainerChildList =
//       searchChildMapper[M.toString()]!;
//   final double hegiht;
//   final double nameWidth;
//   final double nameLeftMargin;
//   final double allClearButtonWidth;
//   final double allClearButtonHeigt;
//   final Color color;

//   TableSearchContainer(
//       {this.hegiht = 128,
//       this.nameWidth = 100,
//       this.nameLeftMargin = 30,
//       this.allClearButtonHeigt = 40,
//       this.allClearButtonWidth = 130,
//       this.color = Colors.white,
//       super.key});

//   List<Widget> getChildren() {
//     List<Widget> resultChildren = [];
//     resultChildren.add(const SizedBox(height: 15));
//     for (int i = 0; i < searchContainerChildList.length; i++) {
//       Row child = Row(
//         children: [
//           Container(
//             width: nameWidth,
//             margin: EdgeInsets.only(left: nameLeftMargin),
//             child: Text(
//               searchContainerChildList[i].columnName,
//               style: searchNameStyle,
//             ),
//           ),
//           Container(child: searchContainerChildList[i].child),
//         ],
//       );

//       resultChildren.add(child);
//       resultChildren.add(const SizedBox(height: 25));
//     }
//     return resultChildren;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: hegiht,
//       color: color,
//       child: Stack(
//         children: [
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 height: hegiht,
//                 child: ListView(children: getChildren()),
//               ),
//             ],
//           ),
//           Container(
//             margin: EdgeInsets.only(right: 30, top: 30),
//             alignment: Alignment.topRight,
//             child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.amber,
//                     fixedSize: Size(allClearButtonWidth, allClearButtonHeigt)),
//                 onPressed: () {},
//                 child: const Text("전체 초기화")),
//           ),
//         ],
//       ),
//     );
//   }
// }
