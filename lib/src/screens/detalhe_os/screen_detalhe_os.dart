import 'dart:convert';

import 'package:flutter/material.dart';

import '../../models/os_response/os_response.dart';
import '../../services/api/api.dart';

class DetalheOs extends StatefulWidget {
  const DetalheOs({Key? key}) : super(key: key);

  @override
  State<DetalheOs> createState() => _DetalheOsState();
}

class _DetalheOsState extends State<DetalheOs> {
  List<OsResponse>? detalheOs;

  Future<List<OsResponse>?> obterDetalheOs() async {
    final api = Api();

    try {
      var response =
          await api.request('Tecnico/getOrdensServico', RequestType.get, {});
      var jsonOs = jsonDecode(response?.body ?? '[]');
      var detalheLista = jsonOs
          .map<OsResponse>((client) => OsResponse.fromJson(client))
          .toList();

      return detalheLista;
    } catch (e) {
      print(e);
    }
    return null;
  }

  @override
  void initState() {
    super.initState();
    obterDetalheOs().then((detalheList) {
      setState(() {
        detalheOs = detalheList;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/logo_emive.png',
          height: 45,
        ),
        shadowColor: Colors.black,
        backgroundColor: Colors.black87,
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white70,
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: SizedBox(
                  child: ListView.builder(
                      itemCount: detalheOs?.length,
                      itemBuilder: (context, index) {
                        return Card(
                            child: Column(
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                color: Colors.redAccent,
                              ),
                              padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    detalheOs![index].titulo ?? '',
                                    style: const TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '#${detalheOs![index].idOrdemServico.toString()}',
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              decoration: const BoxDecoration(
                                color: Colors.redAccent,
                              ),
                              padding: const EdgeInsets.fromLTRB(1, 10, 13, 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    detalheOs![index].executadoEm ?? '',
                                    style: const TextStyle(fontSize: 11),
                                  ),
                                  Text(
                                    detalheOs![index].central ?? '',
                                    style: const TextStyle(fontSize: 13),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              decoration: const BoxDecoration(
                                color: Colors.white70,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: const Color.fromARGB(
                                          255, 255, 234, 1),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                    ),
                                    onPressed: () {},
                                    child: Wrap(
                                      children: const <Widget>[
                                        Icon(
                                          Icons.attach_money_outlined,
                                          color: Colors.black,
                                          size: 24.0,
                                        ),
                                        SizedBox(
                                          width: 35,
                                        ),
                                      ],
                                    ),
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: const Color.fromARGB(
                                          255, 206, 205, 205),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                    ),
                                    onPressed: () {},
                                    child: Wrap(
                                      children: const <Widget>[
                                        Icon(
                                          Icons.settings_input_antenna_outlined,
                                          color: Colors.black,
                                          size: 24.0,
                                        ),
                                        SizedBox(
                                          width: 35,
                                        ),
                                      ],
                                    ),
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary:
                                          const Color.fromARGB(255, 231, 7, 7),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                    ),
                                    onPressed: () {},
                                    child: Wrap(
                                      children: const <Widget>[
                                        Text(
                                          'Modo teste',
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              padding:
                                  const EdgeInsets.fromLTRB(40, 10, 40, 10),
                            ),
                            Container(
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 196, 196, 196),
                              ),
                              padding:
                                  const EdgeInsets.fromLTRB(10, 100, 10, 10),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              decoration: const BoxDecoration(
                                color: Colors.white70,
                              ),
                              padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    detalheOs![index].nome ?? '',
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 24),
                            const Divider(color: Colors.black),
                            const SizedBox(height: 24),
                            SizedBox(
                              height: 20,
                              child: Row(
                                children: const [
                                  Text('ENDEREÇO: ',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                            Container(
                              decoration: const BoxDecoration(
                                color: Colors.white70,
                              ),
                              padding: const EdgeInsets.fromLTRB(1, 5, 1, 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    detalheOs![index].logradouro ?? '',
                                    style: const TextStyle(
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 30,
                              child: Row(
                                children: const [
                                  Text('TELEFONE: ',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                            Container(
                              decoration: const BoxDecoration(
                                color: Colors.white70,
                              ),
                              padding: const EdgeInsets.fromLTRB(1, 5, 1, 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    detalheOs![index].telefone ?? '',
                                    style: const TextStyle(
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 29,
                              child: Row(
                                children: const [
                                  Text('E-MAIL: ',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                            Container(
                              decoration: const BoxDecoration(
                                color: Colors.white,
                              ),
                              padding:
                                  const EdgeInsets.fromLTRB(1, 6.99, 10, 1),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    detalheOs![index].email ?? '',
                                    style: const TextStyle(
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 30),
                            const Divider(color: Colors.black),
                            SizedBox(
                              height: 29,
                              child: Row(
                                children: const [
                                  Text('DESCRIÇÃO: ',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                            Container(
                              decoration: const BoxDecoration(
                                color: Colors.white,
                              ),
                              padding:
                                  const EdgeInsets.fromLTRB(1, 6.99, 10, 1),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    detalheOs![index].observacao ?? '',
                                    style: const TextStyle(
                                      fontSize: 11,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ));
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
