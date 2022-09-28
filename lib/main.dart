import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:map/controller/map_controller.dart';
import 'package:map/screens/data_add.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart';
import 'package:get/get.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // 

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Naver Map',
      home: YummyMaps(),
    );
  }
}

class YummyMaps extends StatefulWidget {
  const YummyMaps({Key? key}) : super(key: key);

  @override
  YummyMapsState createState() => YummyMapsState();
}

class YummyMapsState extends State<YummyMaps> {
  Completer<NaverMapController> _controller = Completer();
  MapController mapController = MapController();

  @override
  void initState() {
    super.initState();
    mapController.getStore('서울 강남구 밤고개로5길 13');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('YummyMaps')),
      body: NaverMap(
        onMapCreated: onMapCreated,
      ),
      floatingActionButton: FloatingActionButton(
        child: Text('Go!'),
        onPressed: (){
          Get.to(transition: Transition.rightToLeft, DataAdd());
        }
      ),
    );
  }

  void onMapCreated(NaverMapController controller) {
    if (_controller.isCompleted) _controller = Completer();
    _controller.complete(controller);
  }
}