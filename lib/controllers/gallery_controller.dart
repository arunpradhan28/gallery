import 'package:flutter/material.dart';
import 'package:gallery/models/image_models.dart';
import 'package:gallery/services/pixabay_services.dart';
import 'package:get/get.dart';


class GalleryController extends GetxController {
  final PixabayService _pixabayService = PixabayService();
  final RxList<ImageModel> images = <ImageModel>[].obs;
  final RxString query = ''.obs;
  final RxInt page = 1.obs;

  @override
  void onInit() {
    fetchImages();
    super.onInit();
  }

  void fetchImages() async {
    try {
      final results = await _pixabayService.fetchImages(query.value, page.value);
      final List<ImageModel> newImages = results.map((json) => ImageModel.fromJson(json)).toList();
      images.addAll(newImages);
    } catch (e) {
      print('Error fetching images: $e');
    }
  }

  void searchImages(String newQuery) {
    images.clear();
    page.value = 1;
    query.value = newQuery;
    fetchImages();
  }

  void loadMoreImages() {
    page.value++;
    fetchImages();
  }
  int calculateCrossAxisCount(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth < 600) {
      return 2;
    } else if (screenWidth < 900) {
      return 3;
    } else {
      return 4;
    }
  }

  void showImageDetails(BuildContext context, ImageModel image) {
    Get.toNamed('/image_details', arguments: image);
  }
  
  
}
