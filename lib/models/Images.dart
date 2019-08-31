import 'dart:convert';

Images imagesFromJson(String str) => Images.fromJson(json.decode(str));

String imagesToJson(Images data) => json.encode(data.toJson());

class Images {
  List<String> numbers;
  List<String> family;

  Images({
    this.numbers,
    this.family,
  });

  factory Images.fromJson(Map<String, dynamic> json) => new Images(
    numbers: new List<String>.from(json["numbers"].map((x) => x)),
    family: new List<String>.from(json["family"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "numbers": new List<dynamic>.from(numbers.map((x) => x)),
    "family": new List<dynamic>.from(family.map((x) => x)),
  };
}
