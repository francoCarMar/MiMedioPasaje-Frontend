class User {
  final String usrDNI;
  final String usrNom;
  final String usrApe;
  final String usrEma;
  final String usrPas;
  final List<int> usrImgCar;
  final List<int> usrImgDNI;
  final int usrCalCod;
  final bool usrVal;

  User({
    required this.usrDNI,
    required this.usrNom,
    required this.usrApe,
    required this.usrEma,
    required this.usrPas,
    required this.usrImgCar,
    required this.usrImgDNI,
    required this.usrCalCod,
    required this.usrVal,
  });

  factory User.fromJsonMap(Map<String, dynamic> json) => User(
        usrDNI: json["usrDNI"],
        usrNom: json["usrNom"],
        usrApe: json["usrApe"],
        usrEma: json["usrEma"],
        usrPas: json["usrPas"],
        usrImgCar: json["usrImgCar"],
        usrImgDNI: json["usrImgDNI"],
        usrCalCod: json["usrCalCod"],
        usrVal: json["usrVal"],
      );

  Map<String, dynamic> toJson() => {
        "usrDNI": usrDNI,
        "usrNom": usrNom,
        "usrApe": usrApe,
        "usrEma": usrEma,
        "usrPas": usrPas,
        "usrImgCar": usrImgCar,
        "usrImgDNI": usrImgDNI,
        "usrCalCod": usrCalCod,
        "usrVal": usrVal,
      };
}
