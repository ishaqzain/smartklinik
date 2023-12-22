import 'package:dio/dio.dart';
import 'package:smartklinik/helpers/api_client.dart';
import 'package:smartklinik/model/pasien.dart';

class PasienService {
  Future<List<Pasien>> listData() async{
    final Response response = await ApiClient().get('pasien/?key=123');
    print(response.data);
    final List data = response.data['data'] as List;
    List<Pasien> result = data.map((json) => Pasien.fromJson(json)).toList();
    return result;
  }

  Future<Pasien> simpan(Pasien pasien) async {
    var data = pasien.toJson();
    final Response response = await ApiClient().post('pasien/?key=123', data);
    Pasien result = Pasien.fromJson(response.data['data']);
    return result;
  }

  Future<Pasien> ubah(Pasien pasien, String id) async {
    var data = pasien.toJson();
    final Response response = await ApiClient().put('pasien/${id}?key=123', data);
    print(response.data['data']);
    Pasien result = Pasien.fromJson(response.data['data']);
    return result;
  }

  Future<Pasien> getById(String id) async {
    final Response response = await ApiClient().get('pasien/${id}?key=123');
    Pasien result = Pasien.fromJson(response.data['data']);
    return result;
  }

  Future<Pasien> hapus(Pasien pasien) async {
    final Response response = await ApiClient().delete('pasien/${pasien.id}?key=123');
    Pasien result = Pasien.fromJson(response.data['data']);
    return result;
  }
}
