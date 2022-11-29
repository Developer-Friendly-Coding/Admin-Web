import 'package:clean_arch/common/constants/uri_provider.dart';
import 'package:clean_arch/common/util/class_builder.dart';
import 'package:clean_arch/model(DTO)/impl/contract.dart';
import 'package:clean_arch/model(DTO)/impl/customer.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:clean_arch/view/page/validator_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:clean_arch/common/constants/secure_storage.dart';
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
  ClassBuilder.register<Customer>(Customer());
  ClassBuilder.register<Contract>(Contract());
  // ClassBuilder.register<ServiceProvider>(ServiceProvider());

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => SignInProvider()),
    ChangeNotifierProvider(create: (_) => (BaseTableProvider())),
    ChangeNotifierProvider(create: (_) => (BaseTableProvider<Customer>())),
    ChangeNotifierProvider(create: (_) => (BaseTableProvider<Contract>())),
    // ChangeNotifierProvider(create: (_) => (BaseTableProvider<Customer>())),
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
      '/test': (BuildContext context) => const TestPage(),
      '/test2': (BuildContext context) => const ValidatorPage(),
    };
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'),
        Locale("ko"),
      ],
      title: 'Pathfinder Admin',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: routes,
      initialRoute: '/test',
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
    isLogined() async {
      bool isLogin = false;
      FlutterSecureStorage storage = SecureStorage.storage;
      String? value = await storage.read(key: 'admin');
      isLogin = (value != null);
      return isLogin;
    }

    return FutureBuilder(
        future: isLogined(),
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
