import 'package:clean_arch/common/constants/column_attributes.dart';
import 'package:clean_arch/model/impl/contract.dart';
import 'package:clean_arch/model/impl/customer.dart';
import 'package:clean_arch/model/impl/customer_memeber.dart';
import 'package:clean_arch/model/impl/gate.dart';
import 'package:clean_arch/model/impl/gate_credential.dart';
import 'package:clean_arch/model/impl/manager.dart';
import 'package:clean_arch/model/impl/office.dart';
import 'package:clean_arch/model/impl/office_branch.dart';
import 'package:clean_arch/model/impl/sensor.dart';
import 'package:clean_arch/model/impl/sensor_value.dart';
import 'package:clean_arch/model/impl/service_provider.dart';
import 'package:clean_arch/model/impl/tax_bill.dart';
import 'package:clean_arch/provider/impl/table_provider_impl.dart';
import 'package:clean_arch/view/page/detail_page.dart';
import 'package:clean_arch/view/widget/table/table_search/table_container.dart';
import 'package:clean_arch/view/widget/table/table_view/table_in_create.dart';
import 'package:clean_arch/view/widget/table/table_view/table_view.dart';
import 'package:clean_arch/view/widget/table/table_view/table_view_for_cuDialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class ClassBuilder {
  static final Map<String, Object> _constructors = <String, Object>{};

  static Map<String, Object> get constructors => _constructors;
  static void register<T>(Object constructor) {
    _constructors[T.toString()] = constructor;
  }

  static Object? fromString(String type) {
    return _constructors[type];
  }

  static init() {
    ClassBuilder.register<Contract>(Contract());
    ClassBuilder.register<CustomerMember>(CustomerMember());
    ClassBuilder.register<Customer>(Customer());
    ClassBuilder.register<Manager>(Manager());
    ClassBuilder.register<OfficeBranch>(OfficeBranch());
    ClassBuilder.register<Office>(Office());
    ClassBuilder.register<ServiceProvider>(ServiceProvider());
    ClassBuilder.register<TaxBill>(TaxBill());
    ClassBuilder.register<Sensor>(Sensor());
    ClassBuilder.register<SensorValue>(SensorValue());
    // ClassBuilder.register<GateCredential>(GateCredential());
    // ClassBuilder.register<Gate>(Gate());
  }

  static TableProvider? getTableProvider(
      Type model, bool isListen, BuildContext context) {
    switch (model) {
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
      // case GateCredential:
      //   return Provider.of<TableProvider<GateCredential>>(context,
      //       listen: isListen);
      // case Gate:
      //   return Provider.of<TableProvider<Gate>>(context, listen: isListen);
      default:
        return null;
    }
  }

  static TableViewForCuDialog? getTableViewForCuDialog(
      Type model, ColumnAttributes columnAttributes) {
    switch (model) {
      case Contract:
        return TableViewForCuDialog<Contract>(
          columnAttributes: columnAttributes,
        );
      case CustomerMember:
        return TableViewForCuDialog<CustomerMember>(
          columnAttributes: columnAttributes,
        );
      case Customer:
        return TableViewForCuDialog<Customer>(
          columnAttributes: columnAttributes,
        );
      case Manager:
        return TableViewForCuDialog<Manager>(
          columnAttributes: columnAttributes,
        );
      case OfficeBranch:
        return TableViewForCuDialog<OfficeBranch>(
          columnAttributes: columnAttributes,
        );
      case Office:
        return TableViewForCuDialog<Office>(
          columnAttributes: columnAttributes,
        );
      case ServiceProvider:
        return TableViewForCuDialog<ServiceProvider>(
          columnAttributes: columnAttributes,
        );
      case TaxBill:
        return TableViewForCuDialog<TaxBill>(
          columnAttributes: columnAttributes,
        );
      case Sensor:
        return TableViewForCuDialog<Sensor>(
          columnAttributes: columnAttributes,
        );
      case SensorValue:
        return TableViewForCuDialog<SensorValue>(
          columnAttributes: columnAttributes,
        );
      // case GateCredential:
      //   return TableView<GateCredential>(
      //     height: height ?? 400,
      //   );
      // case Gate:
      //   return TableView<Gate>(
      //     height: height ?? 400,
      //   );
      default:
        return null;
    }
  }

  static DetailPage? getDetailPage(Type model, int selectedId) {
    switch (model) {
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
      // case GateCredential:
      //   return DetailPage<GateCredential>(selectedId: selectedId);
      // case Gate:
      //   return DetailPage<Gate>(selectedId: selectedId);
      default:
        return null;
    }
  }

  static TableSearchContainer? getTableSearchContainer(Type model) {
    switch (model) {
      case Contract:
        return TableSearchContainer<Contract>();
      case CustomerMember:
        return TableSearchContainer<CustomerMember>();
      case Customer:
        return TableSearchContainer<Customer>();
      case Manager:
        return TableSearchContainer<Manager>();
      case OfficeBranch:
        return TableSearchContainer<OfficeBranch>();
      case Office:
        return TableSearchContainer<Office>();
      case ServiceProvider:
        return TableSearchContainer<ServiceProvider>();
      case TaxBill:
        return TableSearchContainer<TaxBill>();
      case Sensor:
        return TableSearchContainer<Sensor>();
      case SensorValue:
        return TableSearchContainer<SensorValue>();
      // case GateCredential:
      //   return TableSearchContainer<GateCredential>();
      // case Gate:
      //   return TableSearchContainer<Gate>();
      default:
        return null;
    }
  }
}
