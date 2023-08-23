import 'package:dio/dio.dart';
import 'package:weather_app/services/interfaces/request_service.dart';

class DioClient implements IRequestService{
  final Dio dio = Dio();

  @override
  Future get(String url) async{   
    final response = await dio.get(url);
    return response.data;
  }

}