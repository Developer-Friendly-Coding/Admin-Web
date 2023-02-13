import 'package:clean_arch/common/constants/mapper/table_name_mapper.dart';
import 'package:clean_arch/common/constants/uri_provider.dart';
import 'package:clean_arch/common/util/class_builder.dart';
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
import 'package:clean_arch/provider/impl/dash_board_provider_impl.dart';
import 'package:clean_arch/view/page/contract_manage_page.dart';
import 'package:clean_arch/view/page/customer_member_page.dart';
import 'package:clean_arch/view/page/customer_page.dart';
import 'package:clean_arch/view/page/dash_board_page.dart';
import 'package:clean_arch/view/page/event_page.dart';
import 'package:clean_arch/view/page/gate_credential_page.dart';
import 'package:clean_arch/view/page/gate_page.dart';
import 'package:clean_arch/view/page/guide_page.dart';
import 'package:clean_arch/view/page/manager_page.dart';
import 'package:clean_arch/view/page/notice_page.dart';
import 'package:clean_arch/view/page/office_branch_page.dart';
import 'package:clean_arch/view/page/office_page.dart';
import 'package:clean_arch/view/page/sensor_page.dart';
import 'package:clean_arch/view/page/sensor_value_page.dart';
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
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:go_router/go_router.dart';

Future main() async {
  // usePathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  UriProvider.init();

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
    ChangeNotifierProvider(create: (_) => (TableProvider<SensorValue>())),
    ChangeNotifierProvider(create: (_) => (TableProvider<GateCredential>())),
    ChangeNotifierProvider(create: (_) => (TableProvider<Gate>())),
    ChangeNotifierProvider(create: (_) => (TableProvider<Guide>())),
    ChangeNotifierProvider(create: (_) => (TableProvider<Event>())),
    ChangeNotifierProvider(create: (_) => (TableProvider<Notice>())),
  ], child: PfAdmin()));
}

class PfAdmin extends StatelessWidget {
  PfAdmin({super.key});
  final _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const LoginPage(),
        // routes:
      ),
      GoRoute(
        path: '/dashBoard',
        builder: (context, state) => const DashBoardPage(),
      ),
      GoRoute(
        path: '/contract',
        builder: (context, state) => const ContractPage(),
      ),
      GoRoute(
        path: '/customerMember',
        builder: (context, state) => const CustomerMemberPage(),
      ),
      GoRoute(
        path: '/customer',
        builder: (context, state) => CustomerPage(),
      ),
      GoRoute(
        path: '/manager',
        builder: (context, state) => const ManagerPage(),
      ),
      GoRoute(
        path: '/officeBranch',
        builder: (context, state) => const OfficeBranchPage(),
      ),
      GoRoute(
        path: '/office',
        builder: (context, state) => const OfficePage(),
      ),
      GoRoute(
        path: '/serviceProvider',
        builder: (context, state) => const ServiceProviderPage(),
      ),
      GoRoute(
        path: '/taxBill',
        builder: (context, state) => const TaxBillPage(),
      ),
      GoRoute(
        path: '/sensor',
        builder: (context, state) => const SensorPage(),
      ),
      GoRoute(
        path: '/sensorValue',
        builder: (context, state) => const SensorValuePage(),
      ),
      GoRoute(
        path: '/gateCredential',
        builder: (context, state) => const GateCredentialPage(),
      ),
      GoRoute(
        path: '/gate',
        builder: (context, state) => const GatePage(),
      ),
      GoRoute(
        path: '/guide',
        builder: (context, state) => const GuidePage(),
      ),
      GoRoute(
        path: '/event',
        builder: (context, state) => const EventPage(),
      ),
      GoRoute(
        path: '/notice',
        builder: (context, state) => const NoticePage(),
      ),
      GoRoute(
        path: '/contractManage',
        builder: (context, state) => const ContractManagePage(),
      ),
      GoRoute(
          path: '/:entity/create',
          builder: (context, state) {
            return ClassBuilder.getTableCreatePage(
                modelNameToModelTypeMapper[state.params['entity']])!;
          }),
      GoRoute(
          path: '/:entity/:id',
          builder: (context, state) {
            return ClassBuilder.getDetailPage(
                modelNameToModelTypeMapper[state.params['entity']],
                int.tryParse(state.params['id']!)!)!;
          }),
      // GoRoute(
      //   path: '/test',
      //   builder: (context, state) => MyWidget(),
      // ),
    ],
  );
  @override
  Widget build(BuildContext context) {
    // final routes = {
    //   '/login': (BuildContext context) => const LoginPage(),
    //   '/main': (BuildContext context) => const DashBoardPage(),
    //   '/contract': (BuildContext context) => const ContractPage(),
    //   '/customerMember': (BuildContext context) => const CustomerMemberPage(),
    //   '/customer': (BuildContext context) => CustomerPage(),
    //   '/manager': (BuildContext context) => const ManagerPage(),
    //   '/officeBranch': (BuildContext context) => const OfficeBranchPage(),
    //   '/office': (BuildContext context) => const OfficePage(),
    //   '/serviceProvider': (BuildContext context) => const ServiceProviderPage(),
    //   '/taxBill': (BuildContext context) => const TaxBillPage(),
    //   '/sensor': (BuildContext context) => const SensorPage(),
    //   '/sensorValue': (BuildContext context) => const SensorValuePage(),
    //   '/gateCredential': (BuildContext context) => const GateCredentialPage(),
    //   '/gate': (BuildContext context) => const GatePage(),
    //   '/guide': (BuildContext context) => const GuidePage(),
    //   '/event': (BuildContext context) => const EventPage(),
    //   '/notice': (BuildContext context) => const NoticePage(),
    //   '/contractManage': (BuildContext context) => const ContractManagePage(),
    //   '/test': (BuildContext context) => Profile(),
    // };

    return MaterialApp.router(
      routerConfig: _router,
      // onGenerateRoute: (settings) {
      //   if (settings.name!.split("/").length >= 3) {
      //     String modelName = settings.name!.split("/")[1];
      //     String selectedId = settings.name!.split("/")[2];
      //     bool isModel = modelNameToModelConstructor[modelName] is Base;
      //     bool isId = int.tryParse(selectedId) != null;
      //     if (isModel && isId) {
      //       if (settings.name!.split("/").length == 4 &&
      //           settings.name!.split("/")[3] == "BoardView" &&
      //           modelNameToModelTypeMapper[modelName] == Office) {
      //         return MaterialPageRoute(
      //             settings: RouteSettings(name: settings.name),
      //             builder: (context) =>
      //                 BoardViewPage(selectedId: int.parse(selectedId)));
      //       }
      //       return MaterialPageRoute(
      //         settings: RouteSettings(name: settings.name),
      //         builder: (context) => ClassBuilder.getDetailPage(
      //             modelNameToModelTypeMapper[modelName],
      //             int.parse(selectedId)) as Widget,
      //       );
      //     }
      //   }
      //   return null;
      // },
      // scrollBehavior: MyCustomScrollBehavior(),
      title: 'Pathfinder Admin',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          scrollbarTheme: ScrollbarThemeData(
              thumbVisibility: MaterialStateProperty.all(true),
              thickness: MaterialStateProperty.all(10),
              thumbColor:
                  MaterialStateProperty.all(Colors.black.withOpacity(0.3)),
              radius: const Radius.circular(8.0),
              minThumbLength: 100)),
      // routes: routes,
      // initialRoute: '/login',
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
