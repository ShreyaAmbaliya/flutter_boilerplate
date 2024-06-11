import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_boilerplate/providers/data_provider.dart';
import 'package:flutter_boilerplate/route_generator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'helpers/constants.dart';
import 'helpers/lifecycle_event_handler.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {
    runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => DataProvider(),
          ),
        ],
        child: DevicePreview(
          enabled: false,
          builder: (context) => MyApp(),
        ),
      ),
    );
  });
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(LifecycleEventHandler(
        resumeCallBack: () async {
          // checkVersion();
          // do something
        },
        suspendingCallBack: () async => setState(() {
          // do something
          print("suspending");
        })));

    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        builder: (BuildContext context, Widget? child) => MaterialApp(
          navigatorKey: navigatorKey,
          title: 'Flutter App',
          initialRoute: '/',
          onGenerateRoute: RouteGenerator.generateRoute,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
             fontFamily: "Now",
              appBarTheme: AppBarTheme(
                iconTheme: IconThemeData(color: Colors.white, size: 22.sp),
              ),
              primaryColor: Colors.blueGrey,
              cardColor: Colors.white,
              backgroundColor: Color(0xFF0A0A0A)),
        ),
        designSize: Size(375, 812));
  }
}
