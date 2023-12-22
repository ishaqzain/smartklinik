class Pasien {
  String? id;
  String nomorRm;
  String nama;
  String tanggalLahir;
  String nomorTelepon;
  String alamat;
  Pasien({
    this.id,
    required this.nomorRm,
    required this.nama,
    required this.tanggalLahir,
    required this.nomorTelepon,
    required this.alamat,
  });

  factory Pasien.fromJson(Map<String, dynamic> json) => Pasien(
    id: json['id']?.toString() ?? '', // Provide an empty string as a default if 'id' is null
    nomorRm: json['nomor_rm'] ?? '',
    nama: json['nama'] ?? '',
    tanggalLahir: json['tanggal_lahir'] ?? '',
    nomorTelepon: json['nomor_telepon'] ?? '',
    alamat: json['alamat'] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "nama": nama,
  };
}

