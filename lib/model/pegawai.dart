class Pegawai {
  String? id;
  String nip;
  String nama;
  String tanggalLahir;
  String nomorTelepon;
  String email;
  String password;

  Pegawai({
    this.id,
    required this.nip,
    required this.nama,
    required this.tanggalLahir,
    required this.nomorTelepon,
    required this.email,
    required this.password
  });

  factory Pegawai.fromJson(Map<String, dynamic> json) => Pegawai(
      id: json['id']?.toString() ?? '',
      nip: json["nip"] ?? '',
      nama: json["nama"] ?? '',
      tanggalLahir: json["tanggalLahir"] ?? '',
      nomorTelepon: json["nomorTelepon"] ?? '',
      email: json["email"] ?? '',
      password: json["password"] ?? ''
  );

  Map<String, dynamic> toJson() => {
    "nip": nip,
    "nama": nama,
    "tanggal_lahir": tanggalLahir,
    "nomor_telepon": nomorTelepon,
    "email": email,
    "password": password
  };
}
