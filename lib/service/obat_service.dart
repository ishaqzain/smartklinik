import 'package:dio/dio.dart';
import 'package:smartklinik/helpers/api_client.dart';
import 'package:smartklinik/model/obat.dart';

class ObatService {
  Future<List<Obat>> listData() async{
    final Response response = await ApiClient().get('obat/?key=123');
    print(response.data);
    final List data = response.data['data'] as List;
    List<Obat> result = data.map((json) => Obat.fromJson(json)).toList();
    return result;
  }

  Future<Obat> simpan(Obat obat) async {
    var data = obat.toJson();
    final Response response = await ApiClient().post('obat/?key=123', data);
    print(response.data);
    Obat result = Obat.fromJson(response.data['data']);
    return result;
  }

  Future<Obat> ubah(Obat obat, String id) async {
    var data = obat.toJson();
    final Response response = await ApiClient().put('obat/${id}?key=123', data);
    print(response.data['data']);
    Obat result = Obat.fromJson(response.data['data']);
    return result;
  }

  Future<Obat> getById(String id) async {
    final Response response = await ApiClient().get('obat/${id}?key=123');
    Obat result = Obat.fromJson(response.data['data']);
    return result;
  }

  Future<Obat> hapus(Obat obat) async {
    final Response response = await ApiClient().delete('obat/${obat.id}?key=123');
    Obat result = Obat.fromJson(response.data['data']);
    return result;
  }
}
