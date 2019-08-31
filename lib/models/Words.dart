import 'dart:convert';

Words wordFromJson(String str) => Words.fromJson(json.decode(str));

String wordToJson(Words data) => json.encode(data.toJson());

class Words {
  List<String> en;
  List<String> ar;

  Words({
    this.en,
    this.ar,
  });

  factory Words.fromJson(Map<String, dynamic> json) => new Words(
    en: new List<String>.from(json["en"].map((x) => x)),
    ar: new List<String>.from(json["ar"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "en": new List<dynamic>.from(en.map((x) => x)),
    "ar": new List<dynamic>.from(ar.map((x) => x)),
  };
}
