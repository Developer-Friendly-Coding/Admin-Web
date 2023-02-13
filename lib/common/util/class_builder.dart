import 'package:clean_arch/common/constants/column_attributes.dart';
import 'package:clean_arch/model/base_model.dart';
import 'package:clean_arch/model/impl/contract.dart';
import 'package:clean_arch/model/impl/customer.dart';
import 'package:clean_arch/model/impl/customer_memeber.dart';
import 'package:clean_arch/model/impl/event.dart';
import 'package:clean_arch/model/impl/gate.dart';
import 'package:clean_arch/model/impl/gate_credential.dart';
import 'package:clean_arch/model/impl/guide.dart';
import 'package:clean_arch/model/impl/manager.dart';
import 'package:clean_arch/model/impl/notice.dart';
import 'package:clean_arch/model/impl/office.dart';
import 'package:clean_arch/model/impl/office_branch.dart';
import 'package:clean_arch/model/impl/sensor.dart';
import 'package:clean_arch/model/impl/sensor_value.dart';
import 'package:clean_arch/model/impl/service_provider.dart';
import 'package:clean_arch/model/impl/tax_bill.dart';
import 'package:clean_arch/provider/impl/table_provider_impl.dart';
import 'package:clean_arch/view/page/detail_page.dart';
import 'package:clean_arch/view/page/table_create_page.dart';
import 'package:clean_arch/view/widget/table/table_search/table_search_container.dart';
import 'package:clean_arch/view/widget/table/table_cu_dialog/table_for_multi_cuDialog.dart';
import 'package:clean_arch/view/widget/table/table_cu_dialog/table_view_for_cuDialog.dart';
import 'package:clean_arch/view/widget/table/table_view/talble_view_in_create.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class ClassBuilder {
  // static final Map<String, Object> _constructors = <String, Object>{};

  // static Map<String, Object> get constructors => _constructors;
  // static void register<T>(Object constructor) {
  //   _constructors[T.toString()] = constructor;
  // }

  // static Object? fromString(String type) {
  //   return _constructors[type];
  // }

  static Base? getModelFromJson(Type modelType, Map<String, dynamic> data) {
    switch (modelType) {
      case Contract:
        return Contract.fromJson(data);
      case CustomerMember:
        return CustomerMember.fromJson(data);
      case Customer:
        return Customer.fromJson(data);
      case Manager:
        return Manager.fromJson(data);
      case OfficeBranch:
        return OfficeBranch.fromJson(data);
      case Office:
        return Office.fromJson(data);
      case ServiceProvider:
        return ServiceProvider.fromJson(data);
      case TaxBill:
        return TaxBill.fromJson(data);
      case Sensor:
        return Sensor.fromJson(data);
      case SensorValue:
        return SensorValue.fromJson(data);
      case GateCredential:
        return GateCredential.fromJson(data);
      case Gate:
        return Gate.fromJson(data);
      case Guide:
        return Guide.fromJson(data);
      case Event:
        return Event.fromJson(data);
      case Notice:
        return Notice.fromJson(data);
      default:
        return null;
    }
  }

  static TableProvider? getTableProvider(
      Type modelType, bool isListen, BuildContext context) {
    switch (modelType) {
      case Contract:
        return Provider.of<TableProvider<Contract>>(context, listen: isListen);
      case CustomerMember:
        return Provider.of<TableProvider<CustomerMember>>(context,
            listen: isListen);
      case Customer:
        return Provider.of<TableProvider<Customer>>(context, listen: isListen);
      case Manager:
        return Provider.of<TableProvider<Manager>>(context, listen: isListen);
      case OfficeBranch:
        return Provider.of<TableProvider<OfficeBranch>>(context,
            listen: isListen);
      case Office:
        return Provider.of<TableProvider<Office>>(context, listen: isListen);
      case ServiceProvider:
        return Provider.of<TableProvider<ServiceProvider>>(context,
            listen: isListen);
      case TaxBill:
        return Provider.of<TableProvider<TaxBill>>(context, listen: isListen);
      case Sensor:
        return Provider.of<TableProvider<Sensor>>(context, listen: isListen);
      case SensorValue:
        return Provider.of<TableProvider<SensorValue>>(context,
            listen: isListen);
      case GateCredential:
        return Provider.of<TableProvider<GateCredential>>(context,
            listen: isListen);
      case Gate:
        return Provider.of<TableProvider<Gate>>(context, listen: isListen);
      case Guide:
        return Provider.of<TableProvider<Guide>>(context, listen: isListen);
      case Notice:
        return Provider.of<TableProvider<Notice>>(context, listen: isListen);
      case Event:
        return Provider.of<TableProvider<Event>>(context, listen: isListen);
      default:
        return null;
    }
  }

  static TableViewForCuDialog? getTableViewForCuDialog(Type modelType,
      ColumnAttributes columnAttributes, TextEditingController controller) {
    switch (modelType) {
      case Contract:
        return TableViewForCuDialog<Contract>(
            columnAttributes: columnAttributes, controller: controller);
      case CustomerMember:
        return TableViewForCuDialog<CustomerMember>(
            columnAttributes: columnAttributes, controller: controller);
      case Customer:
        return TableViewForCuDialog<Customer>(
            columnAttributes: columnAttributes, controller: controller);
      case Manager:
        return TableViewForCuDialog<Manager>(
            columnAttributes: columnAttributes, controller: controller);
      case OfficeBranch:
        return TableViewForCuDialog<OfficeBranch>(
            columnAttributes: columnAttributes, controller: controller);
      case Office:
        return TableViewForCuDialog<Office>(
            columnAttributes: columnAttributes, controller: controller);
      case ServiceProvider:
        return TableViewForCuDialog<ServiceProvider>(
            columnAttributes: columnAttributes, controller: controller);
      case TaxBill:
        return TableViewForCuDialog<TaxBill>(
            columnAttributes: columnAttributes, controller: controller);
      case Sensor:
        return TableViewForCuDialog<Sensor>(
            columnAttributes: columnAttributes, controller: controller);
      case SensorValue:
        return TableViewForCuDialog<SensorValue>(
            columnAttributes: columnAttributes, controller: controller);
      case Gate:
        return TableViewForCuDialog<Gate>(
            columnAttributes: columnAttributes, controller: controller);
      case GateCredential:
        return TableViewForCuDialog<GateCredential>(
            columnAttributes: columnAttributes, controller: controller);
      case Guide:
        return TableViewForCuDialog<Guide>(
            columnAttributes: columnAttributes, controller: controller);
      case Notice:
        return TableViewForCuDialog<Notice>(
            columnAttributes: columnAttributes, controller: controller);
      case Event:
        return TableViewForCuDialog<Event>(
            columnAttributes: columnAttributes, controller: controller);
      default:
        return null;
    }
  }

  static DetailPage? getDetailPage(Type modelType, int selectedId) {
    switch (modelType) {
      case Contract:
        return DetailPage<Contract>(selectedId: selectedId);
      case CustomerMember:
        return DetailPage<CustomerMember>(selectedId: selectedId);
      case Customer:
        return DetailPage<Customer>(selectedId: selectedId);
      case Manager:
        return DetailPage<Manager>(selectedId: selectedId);
      case OfficeBranch:
        return DetailPage<OfficeBranch>(selectedId: selectedId);
      case Office:
        return DetailPage<Office>(selectedId: selectedId);
      case ServiceProvider:
        return DetailPage<ServiceProvider>(selectedId: selectedId);
      case TaxBill:
        return DetailPage<TaxBill>(selectedId: selectedId);
      case Sensor:
        return DetailPage<Sensor>(selectedId: selectedId);
      case Gate:
        return DetailPage<Gate>(selectedId: selectedId);
      case GateCredential:
        return DetailPage<GateCredential>(selectedId: selectedId);
      case Guide:
        return DetailPage<Guide>(selectedId: selectedId);
      case Event:
        return DetailPage<Event>(selectedId: selectedId);
      case Notice:
        return DetailPage<Notice>(selectedId: selectedId);
      default:
        return null;
    }
  }

  static TableSearchContainer? getTableSearchContainer(
      Type modelType, bool isCuDialog) {
    switch (modelType) {
      case Contract:
        return TableSearchContainer<Contract>(
          hegiht: 97,
          isCuDialog: isCuDialog,
        );
      case CustomerMember:
        return TableSearchContainer<CustomerMember>(
          hegiht: 97,
          isCuDialog: isCuDialog,
        );
      case Customer:
        return TableSearchContainer<Customer>(
          hegiht: 97,
          isCuDialog: isCuDialog,
        );
      case Manager:
        return TableSearchContainer<Manager>(
          hegiht: 97,
          isCuDialog: isCuDialog,
        );
      case OfficeBranch:
        return TableSearchContainer<OfficeBranch>(
          hegiht: 97,
          isCuDialog: isCuDialog,
        );
      case Office:
        return TableSearchContainer<Office>(
          hegiht: 97,
          isCuDialog: isCuDialog,
        );
      case ServiceProvider:
        return TableSearchContainer<ServiceProvider>(
          hegiht: 97,
          isCuDialog: isCuDialog,
        );
      case TaxBill:
        return TableSearchContainer<TaxBill>(
          hegiht: 97,
          isCuDialog: isCuDialog,
        );
      case Sensor:
        return TableSearchContainer<Sensor>(
          hegiht: 97,
          isCuDialog: isCuDialog,
        );
      case SensorValue:
        return TableSearchContainer<SensorValue>(
          hegiht: 97,
          isCuDialog: isCuDialog,
        );
      case GateCredential:
        return TableSearchContainer<GateCredential>(
          hegiht: 97,
          isCuDialog: isCuDialog,
        );
      case Gate:
        return TableSearchContainer<Gate>(
          hegiht: 97,
          isCuDialog: isCuDialog,
        );
      case Guide:
        return TableSearchContainer<Guide>(
          hegiht: 97,
          isCuDialog: isCuDialog,
        );
      case Notice:
        return TableSearchContainer<Notice>(
          hegiht: 97,
          isCuDialog: isCuDialog,
        );
      case Event:
        return TableSearchContainer<Event>(
          hegiht: 97,
          isCuDialog: isCuDialog,
        );
      default:
        return null;
    }
  }

  static TableCreatePage? getTableCreatePage(Type? modelType) {
    switch (modelType) {
      case Contract:
        return TableCreatePage<Contract>();
      case CustomerMember:
        return TableCreatePage<CustomerMember>();
      case Customer:
        return TableCreatePage<Customer>();
      case Manager:
        return TableCreatePage<Manager>();
      case OfficeBranch:
        return TableCreatePage<OfficeBranch>();
      case Office:
        return TableCreatePage<Office>();
      case ServiceProvider:
        return TableCreatePage<ServiceProvider>();
      case TaxBill:
        return TableCreatePage<TaxBill>();
      case Sensor:
        return TableCreatePage<Sensor>();
      case SensorValue:
        return TableCreatePage<SensorValue>();
      case GateCredential:
        return TableCreatePage<GateCredential>();
      case Gate:
        return TableCreatePage<Gate>();
      case Guide:
        return TableCreatePage<Guide>();
      case Event:
        return TableCreatePage<Event>();
      case Notice:
        return TableCreatePage<Notice>();
      default:
        return null;
    }
  }

  static TableViewForMultiCuDialog? getTableViewForMultiCuDialog(
      Type modelType) {
    switch (modelType) {
      case Office:
        return TableViewForMultiCuDialog<Office>();
      default:
        return null;
    }
  }

  static TableViewInCreate? getTableViewInCreate(Type modelType) {
    switch (modelType) {
      case Office:
        return TableViewInCreate<Office>();
      default:
        return null;
    }
  }
}
