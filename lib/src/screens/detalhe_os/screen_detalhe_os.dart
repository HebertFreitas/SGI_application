import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:sgi_application/src/models/os_response/os_response.dart';

class DetalheOs extends StatelessWidget {
  const DetalheOs({Key? key, required this.detalheOs}) : super(key: key);

  final OsResponse detalheOs;

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
                  child: Card(
                      child: Column(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.redAccent,
                        ),
                        padding: const EdgeInsets.fromLTRB(1, 3, 10, 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              detalheOs.titulo ?? '',
                              style: const TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '#${detalheOs.idOrdemServico.toString()}',
                              style: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.redAccent,
                        ),
                        padding: const EdgeInsets.fromLTRB(1, 10, 13, 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              detalheOs.agendadoEm ?? '',
                              style: const TextStyle(fontSize: 11),
                            ),
                            Text(
                              detalheOs.central ?? '',
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: const Color.fromARGB(255, 255, 234, 1),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
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
                                primary:
                                    const Color.fromARGB(255, 206, 205, 205),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
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
                                primary: const Color.fromARGB(255, 231, 7, 7),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
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
                        padding: const EdgeInsets.fromLTRB(30, 1, 30, 1),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 196, 196, 196),
                        ),
                        padding: const EdgeInsets.fromLTRB(15, 50, 1, 1),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.white70,
                        ),
                        padding: const EdgeInsets.fromLTRB(15, 5, 10, 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              detalheOs.nome ?? '',
                              style: const TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      const Divider(
                        color: Colors.black,
                        height: 10,
                      ),
                      SizedBox(
                        height: 15,
                        child: Row(
                          children: const [
                            Text('ENDEREÇO: ',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.white70,
                        ),
                        padding: const EdgeInsets.fromLTRB(15, 5, 1, 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${detalheOs.tipoLogradouro ?? ''} ${detalheOs.logradouro ?? ''}, ${detalheOs.numero ?? ''}, ${detalheOs.complemento ?? ''}, ${detalheOs.bairro ?? ''}, ${detalheOs.cidade ?? ''} - ${detalheOs.estado ?? ''}',
                              style: const TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 25,
                        child: Row(
                          children: const [
                            Text('TELEFONE: ',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.white70,
                        ),
                        padding: const EdgeInsets.fromLTRB(15, 5, 1, 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              detalheOs.telefone ?? '',
                              style: const TextStyle(
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 25,
                        child: Row(
                          children: const [
                            Text('E-MAIL: ',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        padding: const EdgeInsets.fromLTRB(15, 6.99, 10, 1),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              detalheOs.email ?? '',
                              style: const TextStyle(
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      const Divider(
                        color: Colors.black,
                        height: 10,
                      ),
                      SizedBox(
                        height: 30,
                        child: Row(
                          children: const [
                            Text('DESCRIÇÃO: ',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.white70,
                        ),
                        padding: const EdgeInsets.fromLTRB(15, 5, 1, 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              detalheOs.descricao ?? '',
                              style: const TextStyle(
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 23,
                        child: Row(
                          children: const [
                            Text('SENHA INSTALADOR: ',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.white70,
                        ),
                        padding: const EdgeInsets.fromLTRB(15, 5, 1, 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              detalheOs.idParceiro.toString(),
                              style: const TextStyle(
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 21),
                      const Divider(color: Colors.black),
                      SizedBox(
                        height: 29,
                        child: Row(
                          children: const [
                            Text('OBSERVAÇÃO: ',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        padding: const EdgeInsets.fromLTRB(15, 6.99, 10, 1),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AutoSizeText(
                              detalheOs.observacao ?? '',
                              style: const TextStyle(
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
