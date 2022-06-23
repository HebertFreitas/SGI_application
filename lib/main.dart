import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:sgi_application/src/screens/boas_vindas/boas_vindas.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const BoasVindasPage(),
    );
  }

  Future main() async {
    WidgetsFlutterBinding.ensureInitialized();

    // ignore: deprecated_member_use
    FlutterNativeSplash.removeAfter(initializaton);
  }

  Future initializaton(BuildContext? context) async {
    await Future.delayed(const Duration(seconds: 3));
  }
}
