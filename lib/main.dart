import 'package:clean_arch/common/constants/uri_provider.dart';
import 'package:clean_arch/common/util/class_builder.dart';
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
import 'package:clean_arch/provider/impl/dash_board_provider_impl.dart';
import 'package:clean_arch/view/page/customer_member_page.dart';
import 'package:clean_arch/view/page/customer_page.dart';
import 'package:clean_arch/view/page/dash_board_page.dart';
import 'package:clean_arch/view/page/gate_credential_page.dart';
import 'package:clean_arch/view/page/gate_page.dart';
import 'package:clean_arch/view/page/manager_page.dart';
import 'package:clean_arch/view/page/office_branch_page.dart';
import 'package:clean_arch/view/page/office_page.dart';
import 'package:clean_arch/view/page/sensor_page.dart';
import 'package:clean_arch/view/page/service_provider_page.dart';
import 'package:clean_arch/view/page/tax_bill_page.dart';
import 'package:clean_arch/view/page/test.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:clean_arch/view/page/login_page.dart';
import 'package:clean_arch/provider/impl/signin_provider_impl.dart';
import 'package:clean_arch/provider/impl/table_provider_impl.dart';
import 'package:clean_arch/view/page/contract_page.dart';
import 'package:flutter/gestures.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");
  UriProvider.init();
  ClassBuilder.init();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => SignInProvider()),
    ChangeNotifierProvider(create: (_) => DashBoardProvider()),
    ChangeNotifierProvider(create: (_) => (TableProvider<Contract>())),
    ChangeNotifierProvider(create: (_) => (TableProvider<CustomerMember>())),
    ChangeNotifierProvider(create: (_) => (TableProvider<Customer>())),
    ChangeNotifierProvider(create: (_) => (TableProvider<Manager>())),
    ChangeNotifierProvider(create: (_) => (TableProvider<OfficeBranch>())),
    ChangeNotifierProvider(create: (_) => (TableProvider<Office>())),
    ChangeNotifierProvider(create: (_) => (TableProvider<ServiceProvider>())),
    ChangeNotifierProvider(create: (_) => (TableProvider<TaxBill>())),
    ChangeNotifierProvider(create: (_) => (TableProvider<Sensor>())),
    ChangeNotifierProvider(create: (_) => (TableProvider<GateCredential>())),
    ChangeNotifierProvider(create: (_) => (TableProvider<Gate>())),
  ], child: const PfAdmin()));
}

class PfAdmin extends StatelessWidget {
  const PfAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    final routes = {
      '/login': (BuildContext context) => const LoginPage(),
      '/main': (BuildContext context) => const DashBoardPage(),
      '/contract': (BuildContext context) => const ContractPage(),
      '/customerMember': (BuildContext context) => const CustomerMemberPage(),
      '/customer': (BuildContext context) => const CustomerPage(),
      '/manager': (BuildContext context) => const ManagerPage(),
      '/officeBranch': (BuildContext context) => const OfficeBranchPage(),
      '/office': (BuildContext context) => const OfficePage(),
      '/serviceProvider': (BuildContext context) => const ServiceProviderPage(),
      '/taxBill': (BuildContext context) => const TaxBillPage(),
      '/sensor': (BuildContext context) => const SensorPage(),
      '/gateCredential': (BuildContext context) => const GateCredentialPage(),
      '/gate': (BuildContext context) => const GatePage(),
      '/test': (BuildContext context) => const MyWidget(),
    };
    return MaterialApp(
      scrollBehavior: MyCustomScrollBehavior(),
      title: 'Pathfinder Admin',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: routes,
      initialRoute: '/login',
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
