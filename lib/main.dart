import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tcc_app/app/theme/app_theme.dart';
import 'package:tcc_app/config/constants.dart';

import 'app/routes/app_pages.dart';
import 'app/routes/app_routes.dart';

void main() async {
  await GetStorage.init(Constants.storageBox);
  runApp(
    GetMaterialApp(
      title: "Baber App",
      debugShowCheckedModeBanner: false,
      theme: appThemeData,
      initialRoute: Routes.initial,
      getPages: AppPages.routes,
      builder: (context, child) => MediaQuery(
        data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
        child: child ?? Container(),
      ),
    ),
  );
}

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: const ColorScheme.dark(),
//         textTheme: const TextTheme(
//           bodyText1: TextStyle(fontSize: 18.0),
//           bodyText2: TextStyle(fontSize: 16.0),
//           button: TextStyle(fontSize: 16.0),
//         ),
//       ),
//       debugShowCheckedModeBanner: false,
//       home: const Login(),
//     );
//   }
// }
