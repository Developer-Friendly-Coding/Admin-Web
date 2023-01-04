import 'package:clean_arch/model/impl/contract.dart';
import 'package:clean_arch/model/impl/customer.dart';
import 'package:clean_arch/model/impl/customer_memeber.dart';
import 'package:clean_arch/model/impl/gate.dart';
import 'package:clean_arch/model/impl/gate_credential.dart';
import 'package:clean_arch/model/impl/manager.dart';
import 'package:clean_arch/model/impl/office.dart';
import 'package:clean_arch/model/impl/office_branch.dart';
import 'package:clean_arch/model/impl/sensor.dart';
import 'package:clean_arch/model/impl/service_provider.dart';
import 'package:clean_arch/model/impl/tax_bill.dart';
import 'package:clean_arch/provider/impl/base_table_provider_impl.dart';
import 'package:clean_arch/view/page/detail_page.dart';
import 'package:clean_arch/view/widget/table/base_table_search/base_table_container.dart';
import 'package:clean_arch/view/widget/table/base_table_view/base_table_view.dart';
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
    ClassBuilder.register<GateCredential>(GateCredential());
    ClassBuilder.register<Gate>(Gate());
  }

  static getBaseTableProvider(Type model, bool isListen, BuildContext context) {
    switch (model) {
      case Contract:
        return Provider.of<BaseTableProvider<Contract>>(context,
            listen: isListen);
      case CustomerMember:
        return Provider.of<BaseTableProvider<CustomerMember>>(context,
            listen: isListen);
      case Customer:
        return Provider.of<BaseTableProvider<Customer>>(context,
            listen: isListen);
      case Manager:
        return Provider.of<BaseTableProvider<Manager>>(context,
            listen: isListen);
      case OfficeBranch:
        return Provider.of<BaseTableProvider<OfficeBranch>>(context,
            listen: isListen);
      case Office:
        return Provider.of<BaseTableProvider<Office>>(context,
            listen: isListen);
      case ServiceProvider:
        return Provider.of<BaseTableProvider<ServiceProvider>>(context,
            listen: isListen);
      case TaxBill:
        return Provider.of<BaseTableProvider<TaxBill>>(context,
            listen: isListen);
      case Sensor:
        return Provider.of<BaseTableProvider<Sensor>>(context,
            listen: isListen);
      case GateCredential:
        return Provider.of<BaseTableProvider<GateCredential>>(context,
            listen: isListen);
      case Gate:
        return Provider.of<BaseTableProvider<Gate>>(context, listen: isListen);
    }
  }

  static getBaseTableView(Type model, double? height) {
    switch (model) {
      case Contract:
        return BaseTableView<Contract>(
          height: height ?? 400,
        );
      case CustomerMember:
        return BaseTableView<CustomerMember>(
          height: height ?? 400,
        );
      case Customer:
        return BaseTableView<Customer>(
          height: height ?? 400,
        );
      case Manager:
        return BaseTableView<Manager>(
          height: height ?? 400,
        );
      case OfficeBranch:
        return BaseTableView<OfficeBranch>(
          height: height ?? 400,
        );
      case Office:
        return BaseTableView<Office>(
          height: height ?? 400,
        );
      case ServiceProvider:
        return BaseTableView<ServiceProvider>(
          height: height ?? 400,
        );
      case TaxBill:
        return BaseTableView<TaxBill>(
          height: height ?? 400,
        );
      case Sensor:
        return BaseTableView<Sensor>(
          height: height ?? 400,
        );
      case GateCredential:
        return BaseTableView<GateCredential>(
          height: height ?? 400,
        );
      case Gate:
        return BaseTableView<Gate>(
          height: height ?? 400,
        );
    }
  }

  static getDetailPage(Type model, int selectedId) {
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
      case GateCredential:
        return DetailPage<GateCredential>(selectedId: selectedId);
      case Gate:
        return DetailPage<Gate>(selectedId: selectedId);
    }
  }

  static getBaseTableSearchContainer(Type model) {
    switch (model) {
      case Contract:
        return BaseTableSearchContainer<Contract>();
      case CustomerMember:
        return BaseTableSearchContainer<CustomerMember>();
      case Customer:
        return BaseTableSearchContainer<Customer>();
      case Manager:
        return BaseTableSearchContainer<Manager>();
      case OfficeBranch:
        return BaseTableSearchContainer<OfficeBranch>();
      case Office:
        return BaseTableSearchContainer<Office>();
      case ServiceProvider:
        return BaseTableSearchContainer<ServiceProvider>();
      case TaxBill:
        return BaseTableSearchContainer<TaxBill>();
      case Sensor:
        return BaseTableSearchContainer<Sensor>();
      case GateCredential:
        return BaseTableSearchContainer<GateCredential>();
      case Gate:
        return BaseTableSearchContainer<Gate>();
    }
  }
}
