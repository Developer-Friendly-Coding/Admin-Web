import 'package:clean_arch/common/constants/enum/contract_type.dart';
import 'package:clean_arch/model(DTO)/impl/contract.dart';
import 'package:clean_arch/view/widget/table/base_table_search/base_table_calendar.dart';
import 'package:clean_arch/view/widget/table/base_table_search/base_table_radiobox.dart';
import 'package:clean_arch/view/widget/table/base_table_search/base_table_rangebox.dart';
import 'package:clean_arch/view/widget/table/base_table_search/base_table_search_bar.dart';
import 'package:clean_arch/view/widget/table/base_table_search/base_table_search_child.dart';

List<SearchChild> contractSearchChildList = [
  SearchChild(
    columnName: "고객id",
    child: BaseTableSearchBar<Contract>(
      memberName: "customerId",
    ),
  ),
  SearchChild(
    columnName: "계약담당자id",
    child: BaseTableSearchBar<Contract>(
      memberName: "contractRepId",
    ),
  ),
  SearchChild(
    columnName: "알림담당자id",
    child: BaseTableSearchBar<Contract>(
      memberName: "contactRepId",
    ),
  ),
  SearchChild(
    columnName: "보증금",
    child: BaseTableRangeBox<Contract>(
      startMemberName: "deposit",
      endMemberName: "deposit",
    ),
  ),
  SearchChild(
    columnName: "결제금액",
    child: BaseTableRangeBox<Contract>(
      startMemberName: "rent",
      endMemberName: "rent",
    ),
  ),
  SearchChild(
    columnName: "계약일시",
    child: BaseTableCalendar<Contract>(
      startMemberName: "contractDateTime",
      endMemberName: "contractDateTime",
    ),
  ),
  SearchChild(
    columnName: "시작&종료 일시",
    child: BaseTableCalendar<Contract>(
      startMemberName: "startDateTime",
      endMemberName: "endDateTime",
    ),
  ),
  SearchChild(
    columnName: "계약 상태",
    child: const BaseTableRadioBox<Contract>(
      memberName: "type",
      enumList: ContractType.values,
    ),
  ),
  SearchChild(
    columnName: "설명",
    child: BaseTableSearchBar<Contract>(
      memberName: "description",
    ),
  ),
];

Map<String, List<SearchChild>> searchChildMapper = {
  "Contract": contractSearchChildList
};
