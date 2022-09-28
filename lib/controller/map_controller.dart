import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:map/repository/repository.dart';

class MapController extends GetxController{
  final Repository _repo = Repository();
  // FirebaseFirestore firestore = FirebaseFirestore.instance;
  late final creator = FirebaseFirestore.instance.collection('YummyMaps').doc('Creator');

  Future<void> getStore(String address) async {
    
    
    creator.collection('sung').doc('1').get().then((value) => {
        print('=================='),
        print(value),
        print('==================')
      }
    );

    await _repo.getStore(address).then((result) {
      // print('result === $result');
      // users.get().then(((value) => 
      //   print('value.data === ${value.data()}')
      // ));
    });
   
  }
  void setDB(){
    creator.set({
      'filed4' : '8',
      'field5' : '9',
      'field6' : '1',
      'field7' : '2'
    });
  }
    void readDB(){
    creator.get().then((value){
      print(value.data());
    });
  }

  void updateDB(String key, String value){
    creator.update({
      key:value
    });
  }
}