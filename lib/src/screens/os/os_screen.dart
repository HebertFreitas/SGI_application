import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:sgi_application/src/models/os_response/os_response.dart';
import 'package:sgi_application/src/models/widgets/build_search_field.dart';
import 'package:sgi_application/src/models/widgets/navigation_drawer.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../services/api/api.dart';
import '../detalhe_os/screen_detalhe_os.dart';

class OsPage extends StatefulWidget {
  const OsPage({Key? key}) : super(key: key);

  @override
  State<OsPage> createState() => _OsPageState();
}

class _OsPageState extends State<OsPage> {
  List<OsResponse>? listaOs;

  Future<List<OsResponse>?> obterListaOs() async {
    final api = Api();

    try {
      var response =
          await api.request('Tecnico/getOrdensServico', RequestType.get, {});
      var jsonOs = jsonDecode(response?.body ?? '[]');
      var osLista = jsonOs
          .map<OsResponse>((client) => OsResponse.fromJson(client))
          .toList();

      return osLista;
    } catch (e) {
      print(e);
    }
    return null;
  }

  @override
  void initState() {
    super.initState();
    obterListaOs().then((osList) {
      setState(() {
        listaOs = osList;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawerWidget(),
      appBar: AppBar(
        title: Image.asset(
          'assets/logo_emive.png',
          height: 45,
        ),
        shadowColor: Colors.black,
        backgroundColor: Colors.black87,
      ),
      body: listaOs == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const BuildSearchField(),
                    Expanded(
                      child: SizedBox(
                        child: ListView.builder(
                          itemCount: listaOs?.length,
                          itemBuilder: (context, index) {
                            return Card(
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      settings: RouteSettings(
                                          arguments: listaOs![index]),
                                      builder: (context) => const DetalheOs(),
                                    ),
                                  );
                                  // Function is executed on tap.
                                },
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      decoration: const BoxDecoration(
                                        color: Colors.redAccent,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(3),
                                        ),
                                      ),
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 15, 10, 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '#${listaOs![index].idOrdemServico.toString()}',
                                            style:
                                                const TextStyle(fontSize: 15),
                                          ),
                                          Text(
                                            listaOs![index].central ?? '',
                                            style:
                                                const TextStyle(fontSize: 15),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(3),
                                        ),
                                      ),
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 10, 10, 10),
                                      child: Row(
                                        children: [
                                          const Align(
                                              alignment: Alignment.bottomLeft,
                                              child: Icon(
                                                Icons.switch_account_outlined,
                                                color: Colors.black,
                                              )),
                                          Text(
                                            listaOs![index].nome ?? '',
                                            style:
                                                const TextStyle(fontSize: 10),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(3),
                                        ),
                                      ),
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 10, 10, 10),
                                      child: Row(
                                        children: [
                                          const Align(
                                              alignment: Alignment.bottomLeft,
                                              child: Icon(
                                                Icons.maps_home_work_outlined,
                                                color: Colors.black,
                                              )),
                                          Text(
                                            '${listaOs![index].tipoLogradouro ?? ''} ${listaOs![index].logradouro ?? ''}, ${listaOs![index].numero ?? ''}, ${listaOs![index].complemento ?? ''}, ${listaOs![index].bairro ?? ''}, ${listaOs![index].cidade ?? ''} - ${listaOs![index].estado ?? ''}',
                                            style:
                                                const TextStyle(fontSize: 10),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(3),
                                        ),
                                      ),
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 10, 10, 10),
                                      child: Row(
                                        children: [
                                          const Align(
                                              alignment: Alignment.bottomLeft,
                                              child: Icon(
                                                Icons.location_on_outlined,
                                                color: Colors.black,
                                              )),
                                          Text(
                                            listaOs![index].nomeLocal ?? '',
                                            style:
                                                const TextStyle(fontSize: 10),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(3),
                                        ),
                                      ),
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 10, 10, 10),
                                      child: Row(
                                        children: [
                                          const Align(
                                              alignment: Alignment.bottomLeft,
                                              child: Icon(
                                                Icons.call_sharp,
                                                color: Colors.black,
                                              )),
                                          Text(
                                            listaOs![index].telefone ?? '',
                                            style:
                                                const TextStyle(fontSize: 10),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(3),
                                        ),
                                      ),
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 10, 10, 10),
                                      child: Row(
                                        children: [
                                          const Align(
                                              alignment: Alignment.bottomLeft,
                                              child: Icon(
                                                Icons.calendar_month_outlined,
                                                color: Colors.black,
                                              )),
                                          Text(
                                            listaOs![index].agendadoEm ?? '',
                                            style:
                                                const TextStyle(fontSize: 10),
                                          ),
                                        ],
                                      ),
                                    ),

                                    /*ListTile(
                                    title: Text(
                                      listaOs![index].titulo ?? '',
                                      style: const TextStyle(fontSize: 15),
                                    ),
                                    subtitle: Text(
                                      listaOs![index].idOrdemServico.toString(),
                                    ),
                                    leading: const Icon(Icons.text_snippet),
                                    onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          /*settings: RouteSettings(
                                              arguments: listaOs![index]),*/
                                          builder: (context) =>
                                              const DetalheOs(),
                                        ),
                                      );
                                    },
                                  ),*/
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        backgroundColor: const Color.fromARGB(255, 238, 238, 238),
        unselectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.library_add_outlined,
              color: Colors.black,
              size: 35,
            ),
            label: 'Acrescimo',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.library_books_outlined,
                color: Colors.black,
                size: 35,
              ),
              label: 'OS'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.dashboard_outlined,
                color: Colors.black,
                size: 35,
              ),
              label: 'Dashboard'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.menu_book_outlined,
                color: Colors.black,
                size: 35,
              ),
              label: 'Manuais'),
        ],
      ),
    );
  }
}

Future<bool> sair() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  await sharedPreferences.clear();
  return true;
}
