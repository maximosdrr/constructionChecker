import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';

class IReport {
  String numeroRdo;
  String numeroContrato;
  String prazoContratual;
  String prazoDecorrido;
  String prazoVencer;
  String obra;
  String local;
  String contratante;
  String clima;
  String condicao;
  DateTime data;

  List<MaoDeObra> maoDeObra;
  List<Status> status;
  List<String> observacoes;
  List<String> comentarios;
  List<String> materiaisRecebidos;
  List<FotoAdicionada> fotosAdicionadas;
  IReport({
    this.numeroRdo,
    this.numeroContrato,
    this.prazoContratual,
    this.prazoDecorrido,
    this.prazoVencer,
    this.obra,
    this.local,
    this.contratante,
    this.clima,
    this.condicao,
    this.data,
    this.maoDeObra,
    this.status,
    this.observacoes,
    this.comentarios,
    this.materiaisRecebidos,
    this.fotosAdicionadas,
  });

  IReport copyWith({
    String numeroRdo,
    String numeroContrato,
    String prazoContratual,
    String prazoDecorrido,
    String prazoVencer,
    String obra,
    String local,
    String contratante,
    String clima,
    String condicao,
    DateTime data,
    List<MaoDeObra> maoDeObra,
    List<Status> status,
    List<String> observacoes,
    List<String> comentarios,
    List<String> materiaisRecebidos,
    List<FotoAdicionada> fotosAdicionadas,
  }) {
    return IReport(
      numeroRdo: numeroRdo ?? this.numeroRdo,
      numeroContrato: numeroContrato ?? this.numeroContrato,
      prazoContratual: prazoContratual ?? this.prazoContratual,
      prazoDecorrido: prazoDecorrido ?? this.prazoDecorrido,
      prazoVencer: prazoVencer ?? this.prazoVencer,
      obra: obra ?? this.obra,
      local: local ?? this.local,
      contratante: contratante ?? this.contratante,
      clima: clima ?? this.clima,
      condicao: condicao ?? this.condicao,
      data: data ?? this.data,
      maoDeObra: maoDeObra ?? this.maoDeObra,
      status: status ?? this.status,
      observacoes: observacoes ?? this.observacoes,
      comentarios: comentarios ?? this.comentarios,
      materiaisRecebidos: materiaisRecebidos ?? this.materiaisRecebidos,
      fotosAdicionadas: fotosAdicionadas ?? this.fotosAdicionadas,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'numeroRdo': numeroRdo,
      'numeroContrato': numeroContrato,
      'prazoContratual': prazoContratual,
      'prazoDecorrido': prazoDecorrido,
      'prazoVencer': prazoVencer,
      'obra': obra,
      'local': local,
      'contratante': contratante,
      'clima': clima,
      'condicao': condicao,
      'data': data?.millisecondsSinceEpoch,
      'maoDeObra': maoDeObra?.map((x) => x?.toMap())?.toList(),
      'status': status?.map((x) => x?.toMap())?.toList(),
      'observacoes': observacoes,
      'comentarios': comentarios,
      'materiaisRecebidos': materiaisRecebidos,
      // 'fotosAdicionadas': fotosAdicionadas?.map((x) => x?.toMap())?.toList(),
    };
  }

  factory IReport.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return IReport(
      numeroRdo: map['numeroRdo'],
      numeroContrato: map['numeroContrato'],
      prazoContratual: map['prazoContratual'],
      prazoDecorrido: map['prazoDecorrido'],
      prazoVencer: map['prazoVencer'],
      obra: map['obra'],
      local: map['local'],
      contratante: map['contratante'],
      clima: map['clima'],
      condicao: map['condicao'],
      data: DateTime.fromMillisecondsSinceEpoch(map['data']),
      maoDeObra: List<MaoDeObra>.from(
          map['maoDeObra']?.map((x) => MaoDeObra.fromMap(x))),
      status: List<Status>.from(map['status']?.map((x) => Status.fromMap(x))),
      observacoes: List<String>.from(map['observacoes']),
      comentarios: List<String>.from(map['comentarios']),
      materiaisRecebidos: List<String>.from(map['materiaisRecebidos']),
      // fotosAdicionadas: List<FotoAdicionada>.from(map['fotosAdicionadas']?.map((x) => FotoAdicionada.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory IReport.fromJson(String source) =>
      IReport.fromMap(json.decode(source));

  @override
  String toString() {
    return 'IReport(numeroRdo: $numeroRdo, numeroContrato: $numeroContrato, prazoContratual: $prazoContratual, prazoDecorrido: $prazoDecorrido, prazoVencer: $prazoVencer, obra: $obra, local: $local, contratante: $contratante, clima: $clima, condicao: $condicao, data: $data, maoDeObra: $maoDeObra, status: $status, observacoes: $observacoes, comentarios: $comentarios, materiaisRecebidos: $materiaisRecebidos, fotosAdicionadas: $fotosAdicionadas)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is IReport &&
        o.numeroRdo == numeroRdo &&
        o.numeroContrato == numeroContrato &&
        o.prazoContratual == prazoContratual &&
        o.prazoDecorrido == prazoDecorrido &&
        o.prazoVencer == prazoVencer &&
        o.obra == obra &&
        o.local == local &&
        o.contratante == contratante &&
        o.clima == clima &&
        o.condicao == condicao &&
        o.data == data &&
        listEquals(o.maoDeObra, maoDeObra) &&
        listEquals(o.status, status) &&
        listEquals(o.observacoes, observacoes) &&
        listEquals(o.comentarios, comentarios) &&
        listEquals(o.materiaisRecebidos, materiaisRecebidos) &&
        listEquals(o.fotosAdicionadas, fotosAdicionadas);
  }

  @override
  int get hashCode {
    return numeroRdo.hashCode ^
        numeroContrato.hashCode ^
        prazoContratual.hashCode ^
        prazoDecorrido.hashCode ^
        prazoVencer.hashCode ^
        obra.hashCode ^
        local.hashCode ^
        contratante.hashCode ^
        clima.hashCode ^
        condicao.hashCode ^
        data.hashCode ^
        maoDeObra.hashCode ^
        status.hashCode ^
        observacoes.hashCode ^
        comentarios.hashCode ^
        materiaisRecebidos.hashCode ^
        fotosAdicionadas.hashCode;
  }
}

class FotoAdicionada {
  File imagem;
  String descricao;
  FotoAdicionada({
    this.imagem,
    this.descricao,
  });

  FotoAdicionada copyWith({
    File imagem,
    String descricao,
  }) {
    return FotoAdicionada(
      imagem: imagem ?? this.imagem,
      descricao: descricao ?? this.descricao,
    );
  }

  @override
  String toString() => 'FotoAdicionada(imagem: $imagem, descricao: $descricao)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is FotoAdicionada &&
        o.imagem == imagem &&
        o.descricao == descricao;
  }

  @override
  int get hashCode => imagem.hashCode ^ descricao.hashCode;
}

class Status {
  String andar;
  String description;
  String status;
  int porcentagemDeExecucao;
  Status({
    this.andar,
    this.description,
    this.status,
    this.porcentagemDeExecucao,
  });

  Status copyWith({
    String andar,
    String description,
    String status,
    int porcentagemDeExecucao,
  }) {
    return Status(
      andar: andar ?? this.andar,
      description: description ?? this.description,
      status: status ?? this.status,
      porcentagemDeExecucao:
          porcentagemDeExecucao ?? this.porcentagemDeExecucao,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'andar': andar,
      'description': description,
      'status': status,
      'porcentagemDeExecucao': porcentagemDeExecucao,
    };
  }

  factory Status.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Status(
      andar: map['andar'],
      description: map['description'],
      status: map['status'],
      porcentagemDeExecucao: map['porcentagemDeExecucao'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Status.fromJson(String source) => Status.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Status(andar: $andar, description: $description, status: $status, porcentagemDeExecucao: $porcentagemDeExecucao)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Status &&
        o.andar == andar &&
        o.description == description &&
        o.status == status &&
        o.porcentagemDeExecucao == porcentagemDeExecucao;
  }

  @override
  int get hashCode {
    return andar.hashCode ^
        description.hashCode ^
        status.hashCode ^
        porcentagemDeExecucao.hashCode;
  }
}

class MaoDeObra {
  String descricao;
  int quantidade;
  String categoria;
  MaoDeObra({
    this.descricao,
    this.quantidade,
    this.categoria,
  });

  MaoDeObra copyWith({
    String descricao,
    int quantidade,
    String categoria,
  }) {
    return MaoDeObra(
      descricao: descricao ?? this.descricao,
      quantidade: quantidade ?? this.quantidade,
      categoria: categoria ?? this.categoria,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'descricao': descricao,
      'quantidade': quantidade,
      'categoria': categoria,
    };
  }

  factory MaoDeObra.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return MaoDeObra(
      descricao: map['descricao'],
      quantidade: map['quantidade'],
      categoria: map['categoria'],
    );
  }

  String toJson() => json.encode(toMap());

  factory MaoDeObra.fromJson(String source) =>
      MaoDeObra.fromMap(json.decode(source));

  @override
  String toString() =>
      'MaoDeObra(descricao: $descricao, quantidade: $quantidade, categoria: $categoria)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is MaoDeObra &&
        o.descricao == descricao &&
        o.quantidade == quantidade &&
        o.categoria == categoria;
  }

  @override
  int get hashCode =>
      descricao.hashCode ^ quantidade.hashCode ^ categoria.hashCode;
}
