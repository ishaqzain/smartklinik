import 'package:dio/dio.dart';
import 'package:smartklinik/helpers/api_client.dart';
import 'package:smartklinik/model/poli.dart';

class PoliService {
  Future<List<Poli>> listData() async{
    final Response response = await ApiClient().get('poli/?key=123');
    print(response.data);
    final List data = response.data['data'] as List;
    List<Poli> result = data.map((json) => Poli.fromJson(json)).toList();
    return result;
  }

  Future<Poli> simpan(Poli poli) async {
    var data = poli.toJson();
    final Response response = await ApiClient().post('poli/?key=123', data);
    Poli result = Poli.fromJson(response.data['data']);
    return result;
  }

  Future<Poli> ubah(Poli poli, String id) async {
    var data = poli.toJson();
    final Response response = await ApiClient().put('poli/${id}?key=123', data);
    print(response);
    Poli result = Poli.fromJson(response.data['data']);
    return result;
  }

  Future<Poli> getById(String id) async {
    final Response response = await ApiClient().get('poli/${id}?key=123');
    Poli result = Poli.fromJson(response.data['data']);
    return result;
  }

  Future<Poli> hapus(Poli poli) async {
    final Response response = await ApiClient().delete('poli/${poli.id}?key=123');
    Poli result = Poli.fromJson(response.data['data']);
    return result;
  }
}
