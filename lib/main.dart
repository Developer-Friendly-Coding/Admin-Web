import 'package:clean_arch/common/constants/uri_provider.dart';
import 'package:clean_arch/common/util/class_builder.dart';
import 'package:clean_arch/model(DTO)/impl/contract.dart';
import 'package:clean_arch/model(DTO)/impl/customer.dart';
import 'package:clean_arch/model(DTO)/impl/customer_memeber.dart';
import 'package:clean_arch/model(DTO)/impl/gate.dart';
import 'package:clean_arch/model(DTO)/impl/gate_credential.dart';
import 'package:clean_arch/model(DTO)/impl/manager.dart';
import 'package:clean_arch/model(DTO)/impl/office.dart';
import 'package:clean_arch/model(DTO)/impl/office_branch.dart';
import 'package:clean_arch/model(DTO)/impl/sensor.dart';
import 'package:clean_arch/model(DTO)/impl/service_provider.dart';
import 'package:clean_arch/model(DTO)/impl/tax_bill.dart';
import 'package:clean_arch/view/page/customer_member_page.dart';
import 'package:clean_arch/view/page/customer_page.dart';
import 'package:clean_arch/view/page/gate_credential_page.dart';
import 'package:clean_arch/view/page/gate_page.dart';
import 'package:clean_arch/view/page/manager_page.dart';
import 'package:clean_arch/view/page/office_branch_page.dart';
import 'package:clean_arch/view/page/office_page.dart';
import 'package:clean_arch/view/page/sensor_page.dart';
import 'package:clean_arch/view/page/service_provider_page.dart';
import 'package:clean_arch/view/page/tax_bill_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:clean_arch/common/constants/text_style.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:clean_arch/view/widget/logout_button.dart';
import 'package:clean_arch/view/widget/sidebar_menu.dart';
import 'package:clean_arch/view/page/login_page.dart';
import 'package:clean_arch/provider/impl/signin_provider_impl.dart';
import 'package:clean_arch/provider/impl/base_table_provider_impl.dart';
import 'package:clean_arch/view/page/contract_page.dart';

Future main() async {
  await dotenv.load(fileName: ".env");
  UriProvider.init();
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

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => SignInProvider()),
    ChangeNotifierProvider(create: (_) => (BaseTableProvider())),
    ChangeNotifierProvider(create: (_) => (BaseTableProvider<Contract>())),
    ChangeNotifierProvider(
        create: (_) => (BaseTableProvider<CustomerMember>())),
    ChangeNotifierProvider(create: (_) => (BaseTableProvider<Customer>())),
    ChangeNotifierProvider(create: (_) => (BaseTableProvider<Manager>())),
    ChangeNotifierProvider(create: (_) => (BaseTableProvider<OfficeBranch>())),
    ChangeNotifierProvider(create: (_) => (BaseTableProvider<Office>())),
    ChangeNotifierProvider(
        create: (_) => (BaseTableProvider<ServiceProvider>())),
    ChangeNotifierProvider(create: (_) => (BaseTableProvider<TaxBill>())),
    ChangeNotifierProvider(create: (_) => (BaseTableProvider<Sensor>())),
    ChangeNotifierProvider(
        create: (_) => (BaseTableProvider<GateCredential>())),
    ChangeNotifierProvider(create: (_) => (BaseTableProvider<Gate>())),
  ], child: const PfAdmin()));
}

class PfAdmin extends StatelessWidget {
  const PfAdmin({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final routes = {
      '/login': (BuildContext context) => const LoginPage(),
      '/main': (BuildContext context) => const DashBoard(),
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
    };
    return MaterialApp(
      title: 'Pathfinder Admin',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: routes,
      initialRoute: '/contract',
    );
  }
}

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  void initState() {
    super.initState();

    //스토리지 admin값이있으면
    //멤버함수실행
  }

  @override
  Widget build(BuildContext context) {
    SignInProvider providerRead =
        Provider.of<SignInProvider>(context, listen: false);

    return FutureBuilder(
        future: providerRead.isLogined(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          //해당 부분은 data를 아직 받아 오지 못했을때 실행되는 부분을 의미한다.
          if (snapshot.hasData == false) {
            return Center(child: Text("Loading...", style: snapShotStyle));
          }
          //error가 발생하게 될 경우 반환하게 되는 부분
          else if (snapshot.hasError) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Error: ${snapshot.error}',
                style: const TextStyle(fontSize: 15),
              ),
            );
          }
          // 데이터를 정상적으로 받아오게 되면 다음 부분을 실행하게 되는 것이다.
          else {
            if (snapshot.data == true) {
              return Scaffold(
                // drawer: PFAdminDrawer(),
                body: Container(
                  color: const Color.fromARGB(255, 232, 237, 246),
                  child: Row(
                    children: [
                      const SideBarMenu(),
                      SingleChildScrollView(
                        child: Container(
                          width:
                              MediaQuery.of(context).size.width * 0.8197916667,
                          child: Column(
                            children: [
                              Stack(
                                children: const [LogoutButton()],
                              ),
                              Container(
                                width: double.infinity,
                                color: Colors.amber,
                                child: const Center(
                                  child: Text(
                                    "메인보드 준비중",
                                    style: TextStyle(fontSize: 50),
                                  ),
                                ),
                              ),
                              Container(
                                height: 1000,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return Center(
                child: Text(
                  "Please Login First",
                  style: snapShotStyle,
                ),
              );
            }
          }
        });
  }
}
