import 'package:dio/dio.dart';

final Dio dio = Dio( BaseOptions(
    baseUrl: 'https://d971-2404-8000-1003-e47-592f-ecd2-f5cf-e6c8.ngrok-free.app/',
    connectTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 3)
));
class ApiClient {

  // cari data
  Future <Response> get(String path) async{
    try{
      final response = await dio.get(Uri.encodeFull(path));
      return response;
    } on DioException catch(e){
      throw Exception(e.message);
    }
  }

  // tambah data
  Future<Response> post(String path, dynamic data) async{
    try{
      final response = await dio.post(Uri.encodeFull(path), data: data);
      return response;
    } on DioException catch(e){
      throw Exception(e.message);
    }
  }

  // update data
  Future<Response> put (String path, dynamic data) async{
    try{
      final response = await dio.put(Uri.encodeFull(path), data: data);
      return response;
    } on DioException catch (e){
      throw Exception(e.message);
    }
  }

  // hapus data
  Future<Response> delete (String path) async{
    try{
      final response = await dio.delete(Uri.encodeFull(path));
      return response;
    } on DioException catch (e){
      throw Exception(e.message);
    }
  }

}