import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:map/repository/repository.dart';

class MapController extends GetxController{
  final Repository _repo = Repository();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late final users = firestore.collection('collection').doc('doc');

  Future<void> getStore(String address) async {
    
    
    users.get().then((value) => 
      print(value.data())
    );

    await _repo.getStore(address).then((result) {
      log('------------------------------------------');
      print('result === $result');
      log('------------------------------------------');
      users.get().then(((value) => 
        print('value.data === ${value.data()}')
      ));
      log('------------------------------------------');
    });
   
  }
  void setDB(){
    users.set({
      'filed4' : '4',
      'field5' : '5',
      'field6' : '6',
      'field7' : '7'
    });
  }
}