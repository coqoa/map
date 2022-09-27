import 'dart:developer';

import 'package:get/get.dart';
import 'package:map/repository/repository.dart';

class MapController extends GetxController{
  final Repository _repo = Repository();
  
  Future<void> getStore(String address) async {

    await _repo.getStore(address).then((result) {
      log('------------------------------------------');
      print('result === $result');
      log('------------------------------------------');
    });
  }
}