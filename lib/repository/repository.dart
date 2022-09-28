import 'package:dio/dio.dart';
import 'package:map/repository/repository_ab.dart';


class Repository implements RepositoryAB{

  var options = BaseOptions(
    headers: {
      'X-NCP-APIGW-API-KEY-ID':"a7lkp6a8i9", 
      'X-NCP-APIGW-API-KEY':"WwVVlUULJL9i4Ruptet3xfdK5vL36AgMYS2Q9wtm"
    }
  );

  @override
  Future<Map<String, dynamic>> getStore(String address) async {
    var response = await Dio(options).get(
      'https://naveropenapi.apigw.ntruss.com/map-geocode/v2/geocode?query=$address'
    );
    Map<String, dynamic> result = response.data;
    return result;
  }
}
