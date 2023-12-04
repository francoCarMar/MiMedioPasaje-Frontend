class Denuncia {
  final String denCod;
  final String usrDNI;
  final String usrNom;
  final String usrApe;
  final String denRazSoc;
  final String denMovPla;
  final DateTime denFec;
  final DateTime denHor;
  final String denEvi;
  final String denEst;

  Denuncia({
    required this.denCod,
    required this.usrDNI,
    required this.usrNom,
    required this.usrApe,
    this.denRazSoc = '',
    required this.denMovPla,
    required this.denFec,
    required this.denHor,
    this.denEvi = '',
    required this.denEst,
  });

  factory Denuncia.fromJson(Map<String, dynamic> json) {
    return Denuncia(
      denCod: json['denCod'],
      usrDNI: json['usrDNI'],
      usrNom: json['usrNom'],
      usrApe: json['usrApe'],
      denRazSoc: json['denRazSoc'],
      denMovPla: json['denMovPla'],
      denFec: DateTime.parse(json['denFec']),
      denHor: DateTime.parse(json['denHor']),
      denEvi: json['denEvi'],
      denEst: json['denEst'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'denCod': denCod,
      'usrDNI': usrDNI,
      'usrNom': usrNom,
      'usrApe': usrApe,
      'denRazSoc': denRazSoc,
      'denMovPla': denMovPla,
      'denFec': denFec.toIso8601String(),
      'denHor': denHor.toIso8601String(),
      'denEvi': denEvi,
      'denEst': denEst,
    };
  }

  static List<Denuncia> fromJsonList(List<Map<String, dynamic>> jsonList) {
    return jsonList.map((json) => Denuncia.fromJson(json)).toList();
  }
}
