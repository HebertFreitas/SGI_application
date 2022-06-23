import 'package:flutter/material.dart';
import 'package:sgi_application/src/screens/boas_vindas/boas_vindas.dart';
import 'package:sgi_application/src/screens/os/os_screen.dart';
import 'package:sgi_application/src/screens/tecnico_screen/tecnico_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NavigationDrawerWidget extends StatelessWidget {
  final padding = const EdgeInsets.symmetric(horizontal: 20);

  const NavigationDrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final urlImage = 'assets/logo_emive.png';
    return Drawer(
      child: Material(
        color: Colors.black87,
        child: ListView(children: <Widget>[
          buildHeader(
            urlImage: urlImage,
          ),
          Container(
            padding: padding,
            child: Column(
              children: const [
                SizedBox(height: 16),
              ],
            ),
          ),
          buildMenuItem(
              text: 'Técnico',
              icon: Icons.engineering_outlined,
              onClicked: () => selectedItem(context, 0)),
          const SizedBox(height: 16),
          buildMenuItem(
              text: 'Home',
              icon: Icons.home,
              onClicked: () => selectedItem(context, 1)),
          const SizedBox(height: 24),
          const Divider(color: Colors.white70),
          const SizedBox(height: 24),
          const SizedBox(height: 250),
          buildMenuItem(
              text: 'Sair',
              icon: Icons.exit_to_app,
              onClicked: () async {
                bool saiu = await sair();
                if (saiu) {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BoasVindasPage()));
                }
              }),
        ]),
      ),
    );
  }

  Widget buildHeader({
    required String urlImage,
  }) =>
      InkWell(
        child: Container(
          padding: padding
              .add(const EdgeInsets.symmetric(vertical: 4, horizontal: 3)),
          child: Row(
            children: [Image.asset(urlImage)],
          ),
        ),
      );

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    final color = Colors.white;
    final hoverColor = Colors.white70;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(
        text,
        style: TextStyle(color: color, fontSize: 16),
      ),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  Future<bool> sair() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
    return true;
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();
    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => TecnicoPage(),
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const OsPage(),
        ));
    }
  }
}
