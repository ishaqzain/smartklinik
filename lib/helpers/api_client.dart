import 'package:dio/dio.dart';

final Dio dio = Dio( BaseOptions(
    baseUrl: 'https://08f1-2404-8000-1003-e47-606c-7c32-a7b-d53.ngrok-free.app/',
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