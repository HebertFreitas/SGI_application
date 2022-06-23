import 'package:flutter/material.dart';
import 'package:sgi_application/src/screens/login/login_screen.dart';
import 'package:sgi_application/src/screens/os/os_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BoasVindasPage extends StatefulWidget {
  const BoasVindasPage({Key? key}) : super(key: key);

  @override
  State<BoasVindasPage> createState() => _BoasVindasPage();
}

class _BoasVindasPage extends State<BoasVindasPage> {
  @override
  void initState() {
    super.initState();
    verificarToken().then((value) {
      if (value) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const OsPage()));
      } else {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LoginPage()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }

  Future<bool> verificarToken() async {
    SharedPreferences sharedPreference = await SharedPreferences.getInstance();
    if (sharedPreference.getString('token') != null) {
      return true;
    } else {
      return false;
    }
  }
}
