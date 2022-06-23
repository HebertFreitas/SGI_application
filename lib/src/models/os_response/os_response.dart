import 'package:json_annotation/json_annotation.dart';

part 'os_response.g.dart';

@JsonSerializable()
class OsResponse {
  final int idOrdemServico;
  final String? central;
  final String? titulo;
  final String? descricao;
  final String? observacao;
  final String? agendadoEm;
  final String? executadoEm;
  final String? ordemExecucaoDiaria;
  final String? tipoEndereco;
  final String? tipoLogradouro;
  final String? logradouro;
  final int? idParceiro;
  final String? numero;
  final String? complemento;
  final String? bairro;
  final String? cidade;
  final String? estado;
  final String? nome;
  final String? email;
  final String? telefone;
  final int? idTipoEvento;
  final bool? possuiAcrescimo;
  final int? idEmpresa;
  final String? nomeLocal;
  final int? codLocal;
  final int? codFunc;
  final int? tipoEvento;

  OsResponse(
      {required this.idOrdemServico,
      this.central,
      this.titulo,
      this.descricao,
      this.observacao,
      this.agendadoEm,
      this.executadoEm,
      this.ordemExecucaoDiaria,
      this.tipoEndereco,
      this.tipoLogradouro,
      this.logradouro,
      this.idParceiro,
      this.numero,
      this.complemento,
      this.bairro,
      this.cidade,
      this.estado,
      this.nome,
      this.email,
      this.telefone,
      this.idTipoEvento,
      this.possuiAcrescimo,
      this.idEmpresa,
      this.nomeLocal,
      this.codLocal,
      this.codFunc,
      this.tipoEvento});

  factory OsResponse.fromJson(Map<String, dynamic> json) =>
      _$OsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OsResponseToJson(this);
}
