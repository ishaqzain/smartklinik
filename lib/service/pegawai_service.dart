import 'package:dio/dio.dart';
import 'package:smartklinik/helpers/api_client.dart';
import 'package:smartklinik/model/pegawai.dart';

class PegawaiService {
  Future<List<Pegawai>> listData() async{
    final Response response = await ApiClient().get('pegawai/?key=123');
    print(response.data);
    final List data = response.data['data'] as List;
    List<Pegawai> result = data.map((json) => Pegawai.fromJson(json)).toList();
    return result;
  }

  Future<Pegawai> simpan(Pegawai pegawai) async {
    var data = pegawai.toJson();
    final Response response = await ApiClient().post('pegawai/?key=123', data);
    Pegawai result = Pegawai.fromJson(response.data['data']);
    return result;
  }

  Future<Pegawai> ubah(Pegawai pegawai, String id) async {
    var data = pegawai.toJson();
    final Response response = await ApiClient().put('pegawai/${id}?key=123', data);
    print(response.data['data']);
    Pegawai result = Pegawai.fromJson(response.data['data']);
    return result;
  }

  Future<Pegawai> getById(String id) async {
    final Response response = await ApiClient().get('pegawai/${id}?key=123');
    Pegawai result = Pegawai.fromJson(response.data['data']);
    return result;
  }

  Future<Pegawai> hapus(Pegawai pegawai) async {
    final Response response = await ApiClient().delete('pegawai/${pegawai.id}?key=123');
    Pegawai result = Pegawai.fromJson(response.data['data']);
    return result;
  }
}
