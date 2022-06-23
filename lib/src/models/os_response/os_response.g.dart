// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'os_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OsResponse _$OsResponseFromJson(Map<String, dynamic> json) => OsResponse(
      idOrdemServico: json['idOrdemServico'] as int,
      central: json['central'] as String?,
      titulo: json['titulo'] as String?,
      descricao: json['descricao'] as String?,
      observacao: json['observacao'] as String?,
      agendadoEm: json['agendadoEm'] as String?,
      executadoEm: json['executadoEm'] as String?,
      ordemExecucaoDiaria: json['ordemExecucaoDiaria'] as String?,
      tipoEndereco: json['tipoEndereco'] as String?,
      tipoLogradouro: json['tipoLogradouro'] as String?,
      logradouro: json['logradouro'] as String?,
      idParceiro: json['idParceiro'] as int?,
      numero: json['numero'] as String?,
      complemento: json['complemento'] as String?,
      bairro: json['bairro'] as String?,
      cidade: json['cidade'] as String?,
      estado: json['estado'] as String?,
      nome: json['nome'] as String?,
      email: json['email'] as String?,
      telefone: json['telefone'] as String?,
      idTipoEvento: json['idTipoEvento'] as int?,
      possuiAcrescimo: json['possuiAcrescimo'] as bool?,
      idEmpresa: json['idEmpresa'] as int?,
      nomeLocal: json['nomeLocal'] as String?,
      codLocal: json['codLocal'] as int?,
      codFunc: json['codFunc'] as int?,
      tipoEvento: json['tipoEvento'] as int?,
    );

Map<String, dynamic> _$OsResponseToJson(OsResponse instance) =>
    <String, dynamic>{
      'idOrdemServico': instance.idOrdemServico,
      'central': instance.central,
      'titulo': instance.titulo,
      'descricao': instance.descricao,
      'observacao': instance.observacao,
      'agendadoEm': instance.agendadoEm,
      'executadoEm': instance.executadoEm,
      'ordemExecucaoDiaria': instance.ordemExecucaoDiaria,
      'tipoEndereco': instance.tipoEndereco,
      'tipoLogradouro': instance.tipoLogradouro,
      'logradouro': instance.logradouro,
      'idParceiro': instance.idParceiro,
      'numero': instance.numero,
      'complemento': instance.complemento,
      'bairro': instance.bairro,
      'cidade': instance.cidade,
      'estado': instance.estado,
      'nome': instance.nome,
      'email': instance.email,
      'telefone': instance.telefone,
      'idTipoEvento': instance.idTipoEvento,
      'possuiAcrescimo': instance.possuiAcrescimo,
      'idEmpresa': instance.idEmpresa,
      'nomeLocal': instance.nomeLocal,
      'codLocal': instance.codLocal,
      'codFunc': instance.codFunc,
      'tipoEvento': instance.tipoEvento,
    };
