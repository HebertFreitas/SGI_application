// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      id: json['id'] as int,
      login: json['login'] as String,
      typeUsu: json['typeUsu'] as String,
      isInstalador: json['isInstalador'] as bool,
      senhaHash: json['senhaHash'] as String,
      nome: json['nome'] as String?,
      accessToken: json['accessToken'] as String,
      foto: json['foto'] as String?,
      fotoBase64: (json['fotoBase64'] as num?)?.toDouble(),
      primeiroNome: json['primeiroNome'] as String?,
      primeiroUltimoNome: json['primeiroUltimoNome'] as String?,
      ultimoNome: json['ultimoNome'] as String?,
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'login': instance.login,
      'typeUsu': instance.typeUsu,
      'isInstalador': instance.isInstalador,
      'senhaHash': instance.senhaHash,
      'nome': instance.nome,
      'accessToken': instance.accessToken,
      'foto': instance.foto,
      'fotoBase64': instance.fotoBase64,
      'primeiroNome': instance.primeiroNome,
      'primeiroUltimoNome': instance.primeiroUltimoNome,
      'ultimoNome': instance.ultimoNome,
    };
