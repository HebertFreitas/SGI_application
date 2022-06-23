import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  final int id;
  final String login;
  final String typeUsu;
  final bool isInstalador;
  final String senhaHash;
  final String? nome;
  final String accessToken;
  final String? foto;
  final double? fotoBase64;
  final String? primeiroNome;
  final String? primeiroUltimoNome;
  final String? ultimoNome;

  LoginResponse(
      {required this.id,
      required this.login,
      required this.typeUsu,
      required this.isInstalador,
      required this.senhaHash,
      this.nome,
      required this.accessToken,
      this.foto,
      this.fotoBase64,
      this.primeiroNome,
      this.primeiroUltimoNome,
      this.ultimoNome});

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
