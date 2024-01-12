class Obat {
  String? id;
  String merek;
  String harga;
  String stock;

  Obat({
    this.id,
    required this.merek,
    required this.harga,
    required this.stock,
  });

  factory Obat.fromJson(Map<String, dynamic> json) => Obat(
    id: json['id'],
    merek: json['merek'],
    harga: json['harga'],
    stock: json['stock'],
  );

  Map<String, dynamic> toJson() => {
    "merek": merek,
    "harga": harga,
    "stock": stock,
  };
}

