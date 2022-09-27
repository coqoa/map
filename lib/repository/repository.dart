import 'package:dio/dio.dart';
import 'package:map/repository/repository_ab.dart';


class Repository implements RepositoryAB{

  var options = BaseOptions(
    headers: {'X-NCP-APIGW-API-KEY-ID':"g2qkczolh7", 'X-NCP-APIGW-API-KEY':"76nMwbC7Rn8s34049dc41GUvkpTTgDUBWZevpCrp"}
  );

  @override
  Future<Map<String, dynamic>> getStore(String address) async {
    var response = await Dio(options).get('https://naveropenapi.apigw.ntruss.com/map-geocode/v2/geocode?query=$address');
    Map<String, dynamic> result = response.data;
    return result;
  }
}
