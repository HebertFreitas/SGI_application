import 'package:flutter/material.dart';
import 'package:sgi_application/src/models/widgets/navigation_drawer.dart';

class TecnicoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          title: const Text('Técnico Page'),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
      );
}
