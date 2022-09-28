import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class DataAdd extends StatefulWidget {
  const DataAdd({Key? key}) : super(key: key);

  @override
  State<DataAdd> createState() => _DataAddState();
}

class _DataAddState extends State<DataAdd> {
  late final creator = FirebaseFirestore.instance.collection('YummyMaps').doc('Creator');

  String name = '';
  String address = '';
  String number = '';
  String youtubeUrl = '';

  void setDB(String name, String address, String number, String youtubeUrl){
    creator.set({
      'name' : name,
      'address' : address,
      'number' : number,
      'youtubeUrl' : youtubeUrl,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DATA ADD..'),
        centerTitle: true,
      ),
      body: Center(
        
        child: SizedBox(
          width: 350,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                autofocus: true,
                autocorrect: false,
                decoration: const InputDecoration(hintText: 'name'),
                onChanged: (e){
                  setState(() {
                    name = e;
                  });
                },
              ),
              TextFormField(
                decoration: const InputDecoration(hintText: 'address'),
                onChanged: (e){
                  setState(() {
                    address = e;
                  });
                },
              ),
              TextFormField(
                decoration: const InputDecoration(hintText: 'number'),
                onChanged: (e){
                  setState(() {
                    number = e;
                  });
                },
              ),
              TextFormField(
                decoration: const InputDecoration(hintText: 'Youtube URL'),
                onChanged: (e){
                  setState(() {
                    youtubeUrl = e;
                  });
                },
                // 마지막 항목이어야 함
                onEditingComplete: (){
                  if(name.isNotEmpty 
                    && address.isNotEmpty 
                    && number.isNotEmpty 
                    && youtubeUrl.isNotEmpty
                  ) {
                    log('name = $name / address = $address / number = $number / youtubeUrl = $youtubeUrl');
                    setDB(name, address, number, youtubeUrl);
                  }
                },
              ),
              if(name.isEmpty 
                  || address.isEmpty 
                  || number.isEmpty 
                  || youtubeUrl.isEmpty
              )
              const SizedBox(height: 10),
              const Text('칸을 모두 채우시오', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
              const SizedBox(height: 10),
              Text('${name.isEmpty?'❗':'✅'} name = $name'),
              Text('${address.isEmpty?'❗':'✅'} address = $address'),
              Text('${number.isEmpty?'❗':'✅'} number = $number'),
              Text('${youtubeUrl.isEmpty?'❗':'✅'} Youtube URL = $youtubeUrl'),

              //-----------------------중간에  collectiond이랑 doc을 하나 더 만들어줘야함 
            ],
          ),
        ),
      ),
    );
  }
}