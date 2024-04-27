import 'package:flutter/material.dart';
import 'package:gallery/views/image_details.dart';
import 'package:get/get.dart';
import 'views/gallery_view.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Gallery App',
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => GalleryView()),
        GetPage(name: '/image_details', page: () => ImageDetailsView()),
      ],
    );
  }
}
